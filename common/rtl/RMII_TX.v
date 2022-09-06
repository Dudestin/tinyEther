/* RMII PHY-TX Interface */

module RMII_TX #( 
    parameter IFG = 48 // Interframe Gap, when 100Mbps, 0.96us.
)( 
    arst_n,
    // FIFO signal
    fifo_aempty, fifo_dout, fifo_empty, fifo_rden,
    // Original FIFO signal
    fifo_EOD_out,
    // RMII signal
    REF_CLK, TXD0, TXD1, TX_EN, CRS_DV, 
    
    // config
    duplex_mode, // 1 means full-duplex, 0 means half-duplex
    
    // monitor signal
    succ_tx_count_gray, // Success to TX frame counter, gray-encoded, 16-bit counter
    fail_tx_count_gray  // Fail to TX frame counter, gray-encoded, 16-bit counter
);

    input wire arst_n;
    input wire fifo_aempty;
    input wire [7:0] fifo_dout;
    input wire fifo_empty;
    output reg fifo_rden;
    input wire fifo_EOD_out;
    
    input  wire REF_CLK; // 50MHz, come from PHY-Chip
    output wire TXD0;
    output wire TXD1;
    output wire TX_EN;
    input  wire CRS_DV;
    
    reg TXD0_reg;
    reg TXD1_reg;
    reg TXEN_reg;
    assign TXD0 = TXD0_reg;
    assign TXD1 = TXD1_reg;
    assign TX_EN = TXEN_reg;
    
    input wire duplex_mode;
    
    // pseudo collision detection, enable when Half-duplex mode.
    wire COL;
    assign COL = duplex_mode ? 1'b0 : CRS_DV & TX_EN;
    
    output wire [15:0] succ_tx_count_gray;
    reg [15:0] succ_tx_count_reg; // raw binary counter
    my_bin2gray #(.WIDTH(16)) 
        succ_gray(.din(succ_tx_count_reg), .dout(succ_tx_count_gray));
    output wire [15:0] fail_tx_count_gray;
    reg [15:0] fail_tx_count_reg;
    my_bin2gray #(.WIDTH(16))
        fail_gray(.din(fail_tx_count_reg), .dout(fail_tx_count_gray));
    
    reg [2:0] STATE_reg;
    localparam S_IDLE = 3'd0,
        S_PREAMBLE = 3'd1,
        S_BODY     = 3'd2,
        S_FCS      = 3'd3,
        S_COL      = 3'd4,
        S_END      = 3'd5;
        
    /* general purpose counter */
    reg [7:0] cnt_reg;

    reg [2:0] STATE_next;
    reg TXD0_next, TXD1_next, TXEN_next;
    reg [15:0] succ_tx_count_next, fail_tx_count_next;
    reg [7:0] cnt_next;

    reg [7:0] latched_fifo_dout_reg;
    reg [7:0] latched_fifo_dout_next;
    reg latched_fifo_EOD_reg;
    reg latched_fifo_EOD_next;
    reg latched_fifo_empty_reg;
    reg latched_fifo_empty_next;
        
    always @*
    begin
        /* default value */
        STATE_next = STATE_reg;
        TXD0_next = 1'b0;
        TXD1_next = 1'b0;
        TXEN_next = 1'b0;
        succ_tx_count_next = succ_tx_count_reg;
        fail_tx_count_next = fail_tx_count_reg;
        cnt_next  = cnt_reg;
        fifo_rden = 1'b0;
        latched_fifo_dout_next = latched_fifo_dout_reg;
        latched_fifo_EOD_next  = latched_fifo_EOD_reg;
        latched_fifo_empty_next= latched_fifo_empty_reg;
        
        case (STATE_reg)
        S_IDLE : 
        begin
            TXD0_next = 1'b0; TXD1_next = 1'b0;
            TXEN_next = 1'b0;
            if (~fifo_aempty) // fifo has some data & CRS is 0
            begin
                STATE_next     = S_PREAMBLE;
            end
        end

        /* transmit preamble section */
        S_PREAMBLE : 
        begin
            cnt_next = cnt_reg + 1'b1;
            TXEN_next = 1'b1;
            if (cnt_reg < 8'd31)
            begin
                TXD0_next = 1'b1;
                TXD1_next = 1'b0;
            end
            else if (cnt_reg == 8'd31)
            begin
                TXD0_next = 1'b1;
                TXD1_next = 1'b1;
                cnt_next  = 8'b0;
                STATE_next = S_BODY;
                // fetch new byte (need in next state)
                latched_fifo_dout_next = fifo_dout;
                latched_fifo_EOD_next  = fifo_EOD_out;
                latched_fifo_empty_next= fifo_empty;
            end
        end

        /* transmit body(header + payload) section */
        S_BODY:
        begin
            cnt_next = cnt_reg + 1'b1;
            TXEN_next = 1'b1;
            case(cnt_reg[1:0])
                2'd0: // STAGE 0 : if fifo become empty before EOD comming, abort.
                begin               
                    TXD0_next = latched_fifo_dout_reg[0];
                    TXD1_next = latched_fifo_dout_reg[1];
                    if (latched_fifo_empty_reg & ~latched_fifo_EOD_reg) // if fifo become empty before EOD comming, abort.
                    begin
                        fail_tx_count_next = fail_tx_count_reg + 1'b1;
                        STATE_next = S_END;
                    end
                end
                2'd1: // STAGE 1
                begin               
                    TXD0_next = latched_fifo_dout_reg[2];
                    TXD1_next = latched_fifo_dout_reg[3];
                end
                2'd2: // STAGE 2 : assert fifo_rden
                begin               
                    TXD0_next = latched_fifo_dout_reg[4];
                    TXD1_next = latched_fifo_dout_reg[5];
                    fifo_rden = 1'b1;
                end
                2'd3: // STATE 3 : fetch new byte, EOD & decide continue or exit by EOD
                begin               
                    TXD0_next = latched_fifo_dout_reg[6];
                    TXD1_next = latched_fifo_dout_reg[7];
                    cnt_next = 8'b0;
                    latched_fifo_dout_next = fifo_dout;     // load new byte
                    latched_fifo_EOD_next  = fifo_EOD_out;  // load new EOD corresponding above statement
                    latched_fifo_empty_next= fifo_empty;    // latch fifo empty flag
                    if (latched_fifo_EOD_reg) // if is last byte, finish TX process
                    begin
                        succ_tx_count_next = succ_tx_count_reg + 1'b1;
                        STATE_next = S_END;
                    end
                end
                default:
                begin
                    TXD0_next = 1'b0; TXD1_next = 1'b0; TXEN_next = 1'b0;
                end                                                        
            endcase
        end
        
        /* reset all registers, wait to secure IFG, then go to S_IDLE */            
        S_END : 
        begin
            TXD0_next = 1'b0; TXD1_next = 1'b0;
            TXEN_next = 1'b0;
            cnt_next  = cnt_reg + 1'b1;
            if (cnt_reg == (IFG-2))  // to secure IFG (Interframe Gap)
            begin
                cnt_next = 8'b0;
                STATE_next = S_IDLE;
            end             
        end
        
        /* undefined state, go to S_END */
        default :
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
            TXD0_reg <= 1'b0;
            TXD1_reg <= 1'b0;
            TXEN_reg <= 1'b0;
            succ_tx_count_reg <= 16'b0;
            fail_tx_count_reg <= 16'b0;
            cnt_reg <= 8'b0;
            latched_fifo_dout_reg <= 8'b0;
            latched_fifo_EOD_reg  <= 1'b0;
            latched_fifo_empty_reg <= 1'b0;
        end
        else
        begin
            STATE_reg <= STATE_next;
            TXD0_reg <= TXD0_next;
            TXD1_reg <= TXD1_next;
            TXEN_reg <= TXEN_next;
            succ_tx_count_reg <= succ_tx_count_next;
            fail_tx_count_reg <= fail_tx_count_next;
            cnt_reg  <= cnt_next;
            latched_fifo_dout_reg <= latched_fifo_dout_next;
            latched_fifo_EOD_reg  <= latched_fifo_EOD_next;
            latched_fifo_empty_reg <= latched_fifo_empty_next;
        end
    end
endmodule
