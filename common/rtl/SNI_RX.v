// RX CSMA/CD Half-Duplex Ethernet Module with SNI Interface
// Receive data from PHY, then delete preamble, SFD and FCS section.
// After, Store data and EOD (End of Data) flags to FIFO.

module SNI_RX(
           arst_n,
           fifo_afull, fifo_din, fifo_wren,
           // Original FIFO Signal
           fifo_EOD_in,
           // SNI signal
           RXC, CRS, RXD
       );
// general interface
input wire arst_n;            // async reset from user clock domain

// FIFO Interface signal
input  wire fifo_afull;       // fifo also_full
output wire [7:0] fifo_din;
output wire fifo_wren;
// Original FIFO signal
output wire fifo_EOD_in;     // indicates End of Data. Useful to detect frame end.

// SNI (Serial Network Interface) signal
input  wire RXC;
input  wire CRS;
input  wire RXD;

// state
reg [1:0] STATE;
localparam S_IDLE = 2'b00,
           S_PREAMBLE = 2'b01,
           S_BODY     = 2'b10,
           S_END      = 2'b11;

reg [7:0] seq; // 1Byte
reg [2:0] counter; // 0 -> 7 counter for make a Byte from bits

assign fifo_din = seq;
// store to fifo 1Byte cycle
assign fifo_wren = (counter == 3'h7);
// assign fifo_wren = 1'b1;
assign fifo_EOD_in = ~CRS & (STATE == S_BODY);

always @(posedge RXC or negedge arst_n)
begin
    if (arst_n == 1'b0)
    begin
        STATE   <= S_IDLE;
        seq     <= 8'b0;
        counter <= 3'b0;
    end
    else
    begin
        seq <= {seq[6:0], RXD};
        if (STATE == S_IDLE)
        begin
            if (CRS & ~fifo_afull)
                STATE <= S_PREAMBLE;
        end

        else if (STATE == S_PREAMBLE)
        begin
            if (~CRS)
                STATE <= S_IDLE;
            else if (seq == 8'b1010_1011) // detect SFD
                STATE <= S_BODY;
        end

        else if (STATE == S_BODY)
        begin
            counter <= counter + 3'b1;
            if (~CRS)
            begin
                STATE <= S_END;
            end

            // store to fifo 1Byte cycle
        end

        else if (STATE == S_END)
        begin
            counter <= 3'b0;
            STATE   <= S_IDLE;
        end

        // undefined state, go to S_END
        else
        begin
            STATE <= S_END;
        end

    end
end

endmodule
