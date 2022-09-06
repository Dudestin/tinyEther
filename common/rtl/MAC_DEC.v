// Decode PHY_FIFO data & store HEADER, PAYLOAD to DISTINCT FIFO
// TODO [x] : CRC check 

module MAC_DEC #(
    parameter HEADER_DWIDTH = 128
)(
    clk,
    arst_n,
    
    // INBOUND : PHY0-FIFO
    i0_fifo_dout,
    i0_fifo_empty,
    i0_fifo_aempty,
    i0_fifo_afull,  // need to be synchronize !!
    i0_fifo_half,   // need to be synchronize !!
    i0_fifo_frame_exist,
    i0_fifo_rden,
    i0_fifo_del,

    // INBOUND : PHY1-FIFO  
    i1_fifo_dout,
    i1_fifo_empty,
    i1_fifo_aempty,
    i1_fifo_afull,  // need to be synchronize !!
    i1_fifo_half,   // need to be synchronize !!
    i1_fifo_frame_exist,    
    i1_fifo_rden,
    i1_fifo_del,

    // INBOUND : PHY2-FIFO
    i2_fifo_dout,
    i2_fifo_empty,
    i2_fifo_aempty,
    i2_fifo_afull,  // need to be synchronize !!
    i2_fifo_half,   // need to be synchronize !!
    i2_fifo_frame_exist,    
    i2_fifo_rden,
    i2_fifo_del,

    // INBOUND : PHY3-FIFO
    i3_fifo_dout,
    i3_fifo_empty,
    i3_fifo_aempty,
    i3_fifo_afull,  // need to be synchronize !!
    i3_fifo_half,   // need to be synchronize !!
    i3_fifo_frame_exist,    
    i3_fifo_rden,
    i3_fifo_del,
            
    // OUTBOUND : HEADER_FIFO   
    h_fifo_din,
    h_fifo_full,
    h_fifo_wren,
    
    // OUTBOUND : BODY_FIFO 
    b_fifo_din,
    b_fifo_afull,
    b_fifo_wren,
    b_fifo_del
 );
    input wire clk;
    input wire arst_n;
    
    // PHY0-FIFO
    input wire [7:0] i0_fifo_dout;
    input wire i0_fifo_empty;
    input wire i0_fifo_aempty;
    input wire i0_fifo_afull;   
    input wire i0_fifo_half;
    input wire i0_fifo_frame_exist;
    output reg i0_fifo_rden;
    input wire i0_fifo_del;

    // PHY1-FIFO    
    input wire [7:0] i1_fifo_dout;
    input wire i1_fifo_empty;
    input wire i1_fifo_aempty;
    input wire i1_fifo_afull;   
    input wire i1_fifo_half;
    input wire i1_fifo_frame_exist; 
    output reg i1_fifo_rden;
    input wire i1_fifo_del; 

    // PHY2-FIFO    
    input wire [7:0] i2_fifo_dout;
    input wire i2_fifo_empty;
    input wire i2_fifo_aempty;
    input wire i2_fifo_afull;   
    input wire i2_fifo_half;
    input wire i2_fifo_frame_exist; 
    output reg i2_fifo_rden;
    input wire i2_fifo_del;

    // PHY3-FIFO    
    input wire [7:0] i3_fifo_dout;
    input wire i3_fifo_empty;
    input wire i3_fifo_aempty;
    input wire i3_fifo_afull;
    input wire i3_fifo_half;
    input wire i3_fifo_frame_exist;     
    output reg i3_fifo_rden;
    input wire i3_fifo_del;
    
    // select phy id by schedular
    reg [1:0] phy_id_reg;
    reg [1:0] phy_id_next;

    // FCS section is valid
    reg fcs_correct;

    // HEADER-FIFO
    // h_fifo_din[HEADER_DWIDTH-1:0] = {RESERVED[11:0], FCS_CORRECT[0:0], is_CTRL_FRAME[0:0], PORT[1:0], SRC_MAC[47:0], DST_MAC[47:0], TYPE[15:0]}
    output reg [HEADER_DWIDTH-1:0] h_fifo_din; 
    input  wire h_fifo_full;
    output reg  h_fifo_wren;    
    reg [111:0] frame_header_reg;
    reg [111:0] frame_header_next;
    // BODY-FIFO
    output reg [7:0] b_fifo_din;
    input  wire b_fifo_afull; 
    output reg b_fifo_wren;
    output reg b_fifo_del;

    // general purpose counter
    reg [3:0] cnt_reg;
    reg [3:0] cnt_next;

    /* below signals are used in scheduler */
    wire [3:0] i_fifo_afull;
    wire [3:0] i_fifo_afull_sync; // afull is on write clock domain, so need to be synchronize;
    assign i_fifo_afull = {i3_fifo_afull , i2_fifo_afull , i1_fifo_afull , i0_fifo_afull};
    vec_sync_2ff #(.WIDTH(4)) vec_sync_afull (.clk(clk), .din(i_fifo_afull), .dout(i_fifo_afull_sync));

    wire [3:0] i_fifo_half;
    wire [3:0] i_fifo_half_sync; // afull is on write clock domain, so need to be synchronize;
    assign i_fifo_half = {i3_fifo_half, i2_fifo_half, i1_fifo_half, i0_fifo_half};
    vec_sync_2ff #(.WIDTH(4)) vec_sync_half (.clk(clk), .din(i_fifo_half), .dout(i_fifo_half_sync));
    
    wire [3:0] i_fifo_frame_exist;
    assign i_fifo_frame_exist = 
        {i3_fifo_frame_exist, i2_fifo_frame_exist, i1_fifo_frame_exist, i0_fifo_frame_exist};   
    
    wire [3:0] i_fifo_aempty;
    assign i_fifo_aempty = 
        {i3_fifo_aempty, i2_fifo_aempty, i1_fifo_aempty, i0_fifo_aempty};
    
    // MUX by phy_id_reg
    wire [7:0] i_fifo_dout;
    assign i_fifo_dout = (phy_id_reg == 2'b00) ? i0_fifo_dout :
                            (phy_id_reg == 2'b01) ? i1_fifo_dout : 
                            (phy_id_reg == 2'b10) ? i2_fifo_dout :
                            (phy_id_reg == 2'b11) ? i3_fifo_dout : 8'b0;
    wire i_fifo_empty;  
    assign i_fifo_empty  = (phy_id_reg == 2'b00) ? i0_fifo_empty :
                           (phy_id_reg == 2'b01) ? i1_fifo_empty : 
                           (phy_id_reg == 2'b10) ? i2_fifo_empty :
                           (phy_id_reg == 2'b11) ? i3_fifo_empty : 1'b0;
    wire i_fifo_del;
    assign i_fifo_del    = (phy_id_reg == 2'b00) ? i0_fifo_del :
                           (phy_id_reg == 2'b01) ? i1_fifo_del : 
                           (phy_id_reg == 2'b10) ? i2_fifo_del :
                           (phy_id_reg == 2'b11) ? i3_fifo_del : 1'b0;
                           
    // DEMUX input fifo read_enable by phy_id_reg
    reg i_fifo_rden;
    always @*
    begin
        case (phy_id_reg)
            2'b00 : 
                begin               
                    i0_fifo_rden = i_fifo_rden;
                    i1_fifo_rden = 1'b0;
                    i2_fifo_rden = 1'b0;
                    i3_fifo_rden = 1'b0;
                end
            2'b01 : 
                begin
                    i0_fifo_rden = 1'b0;
                    i1_fifo_rden = i_fifo_rden;
                    i2_fifo_rden = 1'b0;
                    i3_fifo_rden = 1'b0;
                end
            2'b10 :
                begin
                    i0_fifo_rden = 1'b0;
                    i1_fifo_rden = 1'b0;
                    i2_fifo_rden = i_fifo_rden;
                    i3_fifo_rden = 1'b0;
                end
            2'b11 :
                begin
                    i0_fifo_rden = 1'b0;
                    i1_fifo_rden = 1'b0;
                    i2_fifo_rden = 1'b0;
                    i3_fifo_rden = i_fifo_rden;
                end
            default : 
                begin
                    i0_fifo_rden = 1'b0;
                    i1_fifo_rden = 1'b0;
                    i2_fifo_rden = 1'b0;
                    i3_fifo_rden = 1'b0;                
                end
        endcase     
    end

    // FCS-Checker
    reg crc_en;
    reg crc_rst;
    wire [31:0] crc_out;
    crc crc_impl(.data_in(i_fifo_dout),
                .crc_en(crc_en),
                .crc_out(crc_out),
                .rst(~arst_n | crc_rst),
                .clk(clk)); 

    // ctrl frame should be processed by CPU.
    localparam integer BPDS_ADDR  = 48'h01_80_C2_00_00_00;
    localparam integer PAUSE_ADDR = 48'h01_80_C2_00_00_01;
    reg is_ctrl; // wire

    // STATE MACHINE
    reg [2:0] STATE_reg;
    reg [2:0] STATE_next;
    localparam S_IDLE = 3'b000,
          S_HEADER  = 3'b001,
          S_PAYLOAD = 3'b010,
          S_FCS     = 3'b011,
          S_END     = 3'b100;       

    always @*
    begin
        /* default value */
        crc_rst = 1'b0; // wire
        crc_en  = 1'b0; // wire
        fcs_correct = (crc_out == 32'hC704_DD7B) ? 1'b1 : 1'b0;
        is_ctrl     = (frame_header_reg[63:16] == BPDS_ADDR)  ? 1'b1 : 
                      (frame_header_reg[63:16] == PAUSE_ADDR) ? 1'b1 : 1'b0; // wire
        i_fifo_rden = 1'b0; // wire
        // h_fifo_din  = {12'b0, fcs_correct, is_ctrl, phy_id_reg, frame_header_reg}; // wire
        h_fifo_din  = {12'b0, 1'b1, is_ctrl, phy_id_reg, frame_header_reg};
        h_fifo_wren = 1'b0; // write to header FIFO
        b_fifo_din  = 8'b0; // wire
        b_fifo_del  = 1'b0; // wire
        b_fifo_wren = 1'b0; // wire
        STATE_next  = STATE_reg;
        cnt_next    = cnt_reg;
        phy_id_next = phy_id_reg;
        frame_header_next = frame_header_reg;

        /* State-machine */
        case (STATE_reg)
            S_IDLE:
            begin
                crc_rst = 1'b1; // wire
                if (~h_fifo_full & ~b_fifo_afull)
                begin
                    STATE_next = S_HEADER;
                    cnt_next   = 4'b0;
                    /* Simple Scheduler */
                    casex ({i_fifo_frame_exist, i_fifo_half_sync, i_fifo_afull_sync})     
                    //casex ({~i_fifo_aempty, i_fifo_half_sync, i_fifo_afull_sync})           
                        /* Highest Priority : most of FRAME-FIFO occupied. */
                        12'bxxxx_xxxx_xxx1 : phy_id_next = 2'd0;
                        12'bxxxx_xxxx_xx10 : phy_id_next = 2'd1;
                        12'bxxxx_xxxx_x100 : phy_id_next = 2'd2;
                        12'bxxxx_xxxx_1000 : phy_id_next = 2'd3;
                        /* Medium Priority : half of FRAME-FIFO occupied. */
                        12'bxxxx_xxx1_0000 : phy_id_next = 2'd0;
                        12'bxxxx_xx10_0000 : phy_id_next = 2'd1;
                        12'bxxxx_x100_0000 : phy_id_next = 2'd2;
                        12'bxxxx_1000_0000 : phy_id_next = 2'd3;
                        /* Lowest Priority    : FRAME-FIFO has untreated frame. */
                        12'bxxx1_0000_0000 : phy_id_next = 2'd0;
                        12'bxx10_0000_0000 : phy_id_next = 2'd1;
                        12'bx100_0000_0000 : phy_id_next = 2'd2;
                        12'b1000_0000_0000 : phy_id_next = 2'd3;                
                        default : STATE_next = S_IDLE; // if no one is selectable, stay IDLE;
                    endcase
                end
            end

            S_HEADER:
            begin
                // TODO[x] : if reach DELIMITER, GO TO S_END
                // TODO[x] : if i_fifo EMPTY, STOLE & wait
                if (i_fifo_del == 1'b1) // end of FRAME, something wrong happend, go to S_END
                begin               
                    i_fifo_rden = 1'b1;
                    STATE_next  = S_END;
                end
                else if (i_fifo_empty)  /* stole process, await data */
                begin
                    i_fifo_rden = 1'b0;
                end
                else // data has provided, store HEADER to h_fifo.
                begin
                    cnt_next        = cnt_reg + 1'b1;
                    crc_en          = 1'b1;
                    i_fifo_rden     = 1'b1;
                    frame_header_next     = {frame_header_reg[103:0], i_fifo_dout};
                    if (cnt_reg == 4'd13) // end of HEADER, go to S_PAYLOAD
                        STATE_next = S_PAYLOAD;
                end
            end

            S_PAYLOAD:
            begin
                if (i_fifo_empty) /* stole process, await data */
                begin
                    /* stole */ 
                    crc_en      = 1'b0;
                    i_fifo_rden = 1'b0;
                    b_fifo_wren = 1'b0;
                end
                else    // if data has provided, store to b_fifo.
                begin
                    crc_en      = 1'b1;
                    i_fifo_rden = 1'b1;
                    b_fifo_wren = 1'b1;
                    b_fifo_din  = i_fifo_dout;
                    if (i_fifo_del == 1'b1) // EOD, write delimiter to body FIFO.
                    begin
                        b_fifo_del = 1'b1;
                        STATE_next = S_END;
                    end
                end
            end

            S_END:
            begin
                h_fifo_wren = 1'b1;  // write to header FIFO
                /* reset registers */
                STATE_next = S_IDLE;
                cnt_next   = 8'b0;
                phy_id_next = 2'b0;
                frame_header_next = 112'b0;
            end

            default: // UNDEFINED STATE
            begin
                STATE_next = S_END;
            end
        endcase
    end

    always @(posedge clk or negedge arst_n)
    begin
        if (arst_n == 1'b0)
        begin
            STATE_reg   <= S_IDLE;          
            cnt_reg     <= 4'b0;
            phy_id_reg  <= 2'b00;
            frame_header_reg  <= 112'b0;
        end
        else
        begin
            STATE_reg   <= STATE_next; 
            cnt_reg     <= cnt_next;
            phy_id_reg  <= phy_id_next;
            frame_header_reg  <= frame_header_next;
        end
    end

endmodule
