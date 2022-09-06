/* Simple MDIO memory mapped interface */
/* Address assign: [31:24] - 8'h07, [12:8] - PHY-ID, [6:2] - Register-ID */
/* Data assign   : transmit index sequence 7 -> 0, 15 -> 8 (little endian byte assign) */

module MDIO (
           clk,
           arst_n,

           /* MDIO interface */
           mdc,
           mdio,

           /* picosoc IO interface */
           iomem_valid,
           iomem_ready,
           iomem_wstrb,
           iomem_addr,
           iomem_wdata,
           iomem_rdata
       );
input wire clk;
input wire arst_n;

// convert endian, because riscv support little-endian,
// but ethernet frame follow big endian
function [31:0] endian_conv (input [31:0] din);
    begin
        endian_conv[ 7: 0] = din[31:24];
        endian_conv[15: 8] = din[23:16];
        endian_conv[23:16] = din[15: 8];
        endian_conv[31:24] = din[7 : 0];
    end
endfunction

/* common signal */
reg [7:0] count_reg;
reg mode_reg; // 1:write, 0:read
reg [4:0] phy_id_reg;
reg [4:0] reg_addr_reg;

reg [15:0] tx_data_reg;
reg [15:0] rx_data_reg;

/* SoC Interface */
input         iomem_valid;
output  reg   iomem_ready;
input  [ 3:0] iomem_wstrb;
input  [31:0] iomem_addr;
input  [31:0] iomem_wdata;
output reg [31:0] iomem_rdata;

/* SM flag */
reg launch_SM; // assert by SoC  Interface. launch statemachine flag
reg busy_SM;   // assert by MDIO Interface. complete statemachine process flag

reg [1:0] IO_STATE;
localparam [1:0] S_IO_IDLE = 2'd0,
           S_IO_AWAIT_BUSY = 2'd1,
           S_IO_WAIT_MDIO  = 2'd2, // await MDIO
           S_IO_DONE = 2'd3;
always @(posedge clk or negedge arst_n)
begin
    if (~arst_n)
    begin
        IO_STATE     <= S_IO_IDLE;
        iomem_ready  <= 1'b0;
        iomem_rdata  <= 16'b0;
        mode_reg     <= 1'b0;
        phy_id_reg   <= 5'b0;
        reg_addr_reg <= 5'b0;
        launch_SM    <= 1'b0;
        tx_data_reg  <= 1'b0;
    end
    else
    begin
        case(IO_STATE)
            S_IO_IDLE:
            begin
                iomem_ready <= 1'b0;
                if (iomem_valid && ~iomem_ready && iomem_addr[31:24] == 8'h07)
                begin
                    if (iomem_wstrb[1])
                        tx_data_reg[15: 8] <= iomem_wdata[15: 8];
                    if (iomem_wstrb[0])
                        tx_data_reg[ 7: 0] <= iomem_wdata[ 7: 0];
                    phy_id_reg   <= iomem_addr[12: 8];
                    reg_addr_reg <= iomem_addr[ 6: 2];
                    mode_reg     <= |iomem_wstrb; // 1: W, 0: R
                    launch_SM    <= 1'b1; // launch statemachine
                    IO_STATE     <= S_IO_AWAIT_BUSY;
                end
            end

            S_IO_AWAIT_BUSY:
            begin
                if (busy_SM)
                begin
                    launch_SM <= 1'b0;
                    IO_STATE <= S_IO_WAIT_MDIO;
                end
            end

            S_IO_WAIT_MDIO:
            begin
                if (~busy_SM)
                    IO_STATE <= S_IO_DONE;
            end

            S_IO_DONE:
            begin
                iomem_ready <= 1'b1; // assert ready pulse
                iomem_rdata <= {16'b0, rx_data_reg[15:0]};
                IO_STATE <= S_IO_IDLE;
            end

            default:
                IO_STATE <= S_IO_IDLE;
        endcase
    end
end

/* MDIO Interface */
reg [3:0] MDIO_STATE;
localparam S_IDLE = 4'd0,
           S_PREAMBLE = 4'd1,
           S_MODESET  = 4'd2,
           S_PHY_ID   = 4'd3,
           S_REG_ADDR = 4'd4,
           S_TA       = 4'd5,
           S_RX_DATA  = 4'd6,
           S_TX_DATA  = 4'd7,
           S_END      = 4'd8;

/* generate MDIO clock */
reg [4:0] mdc_div; // 1/32 divider, 48MHz -> 1.5MHz
output wire mdc;
reg mdc_reg;
assign mdc = mdc_reg;

reg mdc_rising;    // indicate mdc rising edge
reg mdc_falling;   // indicate mdc falling edge

always @(posedge clk or negedge arst_n) // clock divider
begin
    if (~arst_n)
    begin
        mdc_reg <= 1'b0;
        mdc_div <= 5'b0;
        mdc_rising  <= 1'b0;
        mdc_falling <= 1'b0;
    end
    else
    begin
        mdc_div <= mdc_div + 1'b1;
        mdc_rising  <= 1'b0;
        mdc_falling <= 1'b0;
        if (mdc_div == 5'b1_1111)
        begin
            mdc_reg <= ~mdc_reg;
            if (mdc_reg) // falling edge
                mdc_falling <= 1'b1;
            else         // rising edge
                mdc_rising  <= 1'b1;
        end
    end
end

/* MDIO interface */
inout wire mdio;
reg mdio_reg;
reg mdio_sel; // 0 means in-mode, 1 means out-mode
assign mdio = mdio_sel ? mdio_reg : 1'bz;

always @(posedge clk or negedge arst_n)
begin
    if (~arst_n)
    begin
        MDIO_STATE <= S_IDLE;
        count_reg    <= 8'b0;
        mdio_reg     <= 1'b0;
        mdio_sel     <= 1'b0; // default : High-Z
        busy_SM      <= 1'b0;
        rx_data_reg  <= 16'b0;
    end
    else
    begin
        if (mdc_falling) // at MDC falling edge, assert & latch mdio signal
        begin
            case (MDIO_STATE)
                S_IDLE:
                begin
                    mdio_sel <= 1'b0; // High-Z when Idle
                    if (launch_SM)
                    begin
                        busy_SM <= 1'b1;
                        MDIO_STATE <= S_PREAMBLE;
                    end
                end

                S_PREAMBLE:
                begin
                    mdio_sel  <= 1'b1; // toggle to output-mode
                    count_reg <= count_reg + 1'b1;
                    if (count_reg <  8'd32)
                        mdio_reg <= 1'b1;
                    else if (count_reg == 8'd32)
                        mdio_reg <= 1'b0;
                    else if (count_reg == 8'd33)
                    begin
                        count_reg <= 8'd0;
                        mdio_reg <= 1'b1;
                        MDIO_STATE <= S_MODESET;
                    end
                end

                S_MODESET: // set read or write
                begin
                    if (count_reg == 8'b0)
                    begin
                        count_reg <= 8'b1;
                        mdio_reg  <= ~mode_reg;
                    end
                    else
                    begin
                        count_reg <= 8'd4;
                        mdio_reg  <= mode_reg;
                        MDIO_STATE     <= S_PHY_ID;
                    end
                end

                S_PHY_ID:
                begin
                    count_reg <= count_reg - 1'b1; // Start from 4
                    mdio_reg  <= phy_id_reg[count_reg];
                    if (count_reg == 8'd0)
                    begin
                        count_reg <= 8'd4;
                        MDIO_STATE     <= S_REG_ADDR;
                    end
                end

                S_REG_ADDR:
                begin
                    count_reg <= count_reg - 1'b1; // Start from 4
                    mdio_reg  <= reg_addr_reg[count_reg];
                    if (count_reg == 8'd0)
                    begin
                        count_reg <= 8'd0;
                        MDIO_STATE <= S_TA;
                    end
                end

                S_TA: // turn around, await 2-cycle
                begin
                    mdio_sel <= mode_reg; // select in or out for MDIO line
                    if (count_reg == 8'd0)
                    begin
                        mdio_reg  <= 1'b1;
                        count_reg <= 8'b1;
                    end
                    else
                    begin
                        count_reg <= 8'd15;
                        if (mode_reg)
                        begin
                            mdio_reg <= 1'b0;
                            MDIO_STATE <= S_TX_DATA;
                        end
                        else
                            MDIO_STATE <= S_RX_DATA;
                    end
                end

                S_RX_DATA: // Receive data from PHY
                begin
                    count_reg <= count_reg - 1'b1; // Start from 15
                    rx_data_reg <= {rx_data_reg[14:0], mdio};
                    if (count_reg == 8'd0)
                        MDIO_STATE <= S_END;
                end

                S_TX_DATA: // Transmit data from FPGA
                begin
                    count_reg <= count_reg - 1'b1; // Start from 15
                    mdio_reg  <= tx_data_reg[count_reg];
                    if (count_reg == 8'd0)
                        MDIO_STATE <= S_END;
                end

                S_END:
                begin
                    busy_SM   <= 1'b0;
                    count_reg <= 8'b0;
                    mdio_sel  <= 1'b0; // restore output-mode
                    mdio_reg  <= 1'b0;
                    MDIO_STATE     <= S_IDLE;
                end
            endcase
        end
    end
end
endmodule
