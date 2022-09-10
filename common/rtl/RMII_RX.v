// RX Ethernet Module with RMII Interface
// Receive data from PHY, then store Header, Body and FCS to FIFO.

module RMII_RX(
           arst_n,
           fifo_afull, fifo_din, fifo_wren,
           // Original FIFO Signal
           fifo_EOD_in,
           // RMII signal
           REF_CLK, CRS_DV, RXD0, RXD1,

           // monitor signal
           succ_rx_count_gray, // 16-bit, gray-code
           buff_OF_count_gray  // 16-bit, gray-code
       );
// general interface
input wire arst_n;            // async reset from user clock domain

// RMII signal
input  wire REF_CLK;
input  wire RXD0;
input  wire RXD1;
input  wire CRS_DV;

// FIFO Interface signal
input  wire fifo_afull;       // fifo also_full
output reg [7:0] fifo_din;
output reg fifo_wren;
// Original FIFO signal
output reg fifo_EOD_in;      // actually wire, indicates End of Data. Useful to detect frame end.

// monitor signal
output wire [15:0] succ_rx_count_gray;
reg [15:0] succ_rx_count_reg;
my_bin2gray #(.WIDTH(16))
            succ_gray(.din(succ_rx_count_reg), .dout(succ_rx_count_gray));

// overflowed frame count
output wire [15:0] buff_OF_count_gray;
reg [15:0] buff_OF_count_reg;
my_bin2gray #(.WIDTH(16))
            buff_OF_gray (.din(buff_OF_count_reg), .dout(buff_OF_count_gray));

reg RXD0_lat;
reg RXD1_lat;
reg CRS_DV_lat;

wire DV = CRS_DV | CRS_DV_lat; // demodulate DV (Data Valid) Signal
always @(posedge REF_CLK or negedge arst_n)
begin
    if (~arst_n)
    begin
        RXD0_lat <= 1'b0;
        RXD1_lat <= 1'b0;
        CRS_DV_lat <= 1'b0;
    end
    else
    begin
        RXD0_lat <= RXD0;
        RXD1_lat <= RXD1;
        CRS_DV_lat <= CRS_DV;
    end
end

// state
reg [1:0] STATE_reg;
localparam S_IDLE = 2'b00,
           S_PREAMBLE = 2'b01,
           S_BODY     = 2'b10,
           S_END      = 2'b11;
reg [7:0] seq_reg;
reg [1:0] cnt_reg;

reg [1:0] STATE_next;
reg [1:0] cnt_next;
reg [15:0] succ_rx_count_next;
reg [15:0] buff_OF_count_next;
reg [7:0] seq_next;

always @*
begin
    /* default value */
    STATE_next = STATE_reg;
    cnt_next   = cnt_reg;
    succ_rx_count_next = succ_rx_count_reg;
    buff_OF_count_next = buff_OF_count_reg;
    seq_next  = {RXD1_lat, RXD0_lat, seq_reg[7:2]};
    // seq_next  = {seq_reg[5:0], RXD0_lat, RXD1_lat};
    fifo_din  = 8'b0;
    fifo_wren = 1'b0;
    fifo_EOD_in = 1'b0; // wire

    case (STATE_reg)
        S_IDLE :
        begin
            cnt_next = 2'b0;
            if (CRS_DV)
                if (fifo_afull) // overflow
                    buff_OF_count_next = buff_OF_count_reg + 1'b1;
                else
                    STATE_next = S_PREAMBLE;
        end

        S_PREAMBLE:
        begin
            if (~CRS_DV) // abort
                STATE_next = S_IDLE;
            else if (seq_reg == 8'b1101_0101) // detect SFD
                // else if (seq_reg == 8'b1010_1011) // detect SFD
                STATE_next = S_BODY;
        end

        S_BODY:
        begin
            cnt_next = cnt_reg + 2'b1;
            if (cnt_reg[1:0] == 2'b11)
            begin
                fifo_din  = seq_reg; // wire, seq_reg is filled by entire byte in this time.
                fifo_wren = 1'b1;    // wire
                fifo_EOD_in = ~DV;   // wire, EOD
                STATE_next = DV ? S_BODY : S_END;
            end
        end

        S_END:
        begin
            succ_rx_count_next = succ_rx_count_reg + 1'b1;
            STATE_next = S_IDLE;
        end

        // undefined state, go to S_END
        default
        begin
            STATE_next = S_END;
        end

    endcase
end

always @(posedge REF_CLK or negedge arst_n)
begin
    if (~arst_n)
    begin
        STATE_reg <= S_IDLE;
        cnt_reg <= 2'b0;
        succ_rx_count_reg <= 16'b0;
        buff_OF_count_reg <= 16'b0;
        seq_reg <= 8'b0;
    end
    else
    begin
        STATE_reg <= STATE_next;
        cnt_reg <= cnt_next;
        succ_rx_count_reg <= succ_rx_count_next;
        buff_OF_count_reg <= buff_OF_count_next;
        seq_reg <= seq_next;
    end
end

endmodule
