// TX CSMA/CD Half-Duplex Ethernet Module with SNI Interface
// Transmit data to PHY
// Get data from FIFO until read EOD flags
// This unit don't calculate FCS, previous units should calculate them.
// to avoid circuit bloating. 

module SNI_TX #(
    parameter IFG = 96 // Interframe Gap
)( 
	arst_n,
	// FIFO signal
	fifo_aempty, fifo_dout, fifo_empty, fifo_rden,
	// Original FIFO signal
	fifo_EOD_out,
	// SNI signal
	TXC, COL, CRS, TXD, TXEN
);
    input wire arst_n;            // async reset from user clock domain
    
    // FIFO Interface signal
    input wire fifo_aempty;       // fifo also_empty
    input wire [7:0]  fifo_dout;
    input wire fifo_empty;
    output reg fifo_rden;    
	// Original FIFO signal    
    input  wire fifo_EOD_out;     // indicates End of Data. Useful to detect frame to frame.

    // SNI (Serial Network Interface) signal
	input  wire TXC;
    input  wire COL;
    input  wire CRS;
    output wire TXD;
    output wire TXEN;

reg [2:0] STATE;
localparam S_IDLE = 3'b000,
       S_PREAMBLE = 3'b001,
       S_BODY     = 3'b011,
       S_FCS      = 3'b111,
       S_COL      = 3'b100,
       S_END      = 3'b110;	

// used in all state
reg TXD_reg;
reg TXEN_reg;
assign TXD  = TXD_reg;
assign TXEN = TXEN_reg;
// general purpose counter
reg [7:0] cnt_reg;

// S_COL : random counter
reg [7:0] rand_cnt_reg;

// rand value generater
wire [31:0] rand_value;
m_seq_32 randgen(.clk(TXC), .reset(arst_n), .mseq32(rand_value));

always @(posedge TXC or negedge arst_n)
begin
    if (~arst_n)
    begin
        STATE    <= S_IDLE;
        TXD_reg  <= 1'b1;
        TXEN_reg <= 1'b0;
        cnt_reg  <= 8'b0;
        rand_cnt_reg <= 8'b0;
        fifo_rden<= 1'b0;
    end
    else
    begin
    	fifo_rden <= 1'b0;
    	TXEN_reg  <= 1'b0;
    	
    	// if data is in fifo, and ~CRS, can transmit data
        if (STATE == S_IDLE)
        begin
        	TXD_reg  <= 1'b1;
            if (~fifo_aempty & ~CRS) // fifo has some data & CRS is 0
            begin
            	rand_cnt_reg  <= rand_value[7:0]; // used in S_COL
                STATE         <= S_PREAMBLE;
            end
        end
        
        // Transmit preamble
        else if (STATE == S_PREAMBLE)
        begin
        	TXEN_reg <= 1'b1;
            if (cnt_reg == 8'd63) // final preamble bit
            begin
            	TXD_reg <= 1'b1;
                cnt_reg <= 8'b0;
                STATE   <= S_BODY;         
            end
            else
            begin
            	TXD_reg  <= ~TXD_reg;
            	cnt_reg  <= cnt_reg + 1'b1;
            end
        end
        
        // Transmit Frame Body
        else if (STATE == S_BODY)
        begin
            // send body data
            cnt_reg  <= cnt_reg + 1'b1;
            TXD_reg  <= fifo_dout[~cnt_reg[2:0]]; // big endian 
            TXEN_reg <= 1'b1;
            if (cnt_reg[2:0] == 3'd7)
            begin
            	cnt_reg   <= 8'b0;
            	fifo_rden <= 1'b1;
                if (fifo_EOD_out)    // detect end of data, go to S_FCS.                                    
                    STATE <= S_END;  // ** now, Not Implemented S_FCS. **
                else if (fifo_empty) // unexpected situation, no remain data, go to S_END.
                	STATE <= S_END;
            end
        end
        
        // Collision occured
        // discard remain data from fifo, then wait random time
        // then go to S_END
        else if (STATE == S_COL)
        begin
        	// Discard remain data from fifo.
        	fifo_rden <= ~fifo_EOD_out;
        	if (fifo_EOD_out)
        	begin
        		// Then wait random time 
        		if (rand_cnt_reg == 8'b0)
        			STATE <= S_END;
        		else
        			rand_cnt_reg <= rand_cnt_reg - 1'b1;
        	end
        end
        
        // reset all registers
        // wait to secure IFG, then go to S_IDLE
        else if (STATE == S_END)
        begin
            cnt_reg     <= cnt_reg + 1'b1;
            if (cnt_reg == IFG)  // to secure IFG (Interframe Gap)
            begin
				cnt_reg  <= 8'b0;
                STATE    <= S_IDLE;
            end
        end
        
        // undefined state, go to S_END
        else
            STATE     <= S_END;

        // if detect collision, go to S_COL at any state without S_COL
        if (COL & (STATE != S_COL))
            STATE     <= S_COL;
            
    end
end
endmodule