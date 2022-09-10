module IP_FRAME_FIFO (
           arst_n,
           di, clkw, we,
           do, clkr, re,
           empty_flag, aempty_flag,
           full_flag, afull_flag,
           // my original signal
           EOD_in, EOD_out
       );

input wire clkw, we;
input wire clkr, re;
input wire arst_n;

input wire [7:0] di;

output wire [7:0] do;
output wire  afull_flag, aempty_flag;
output wire  full_flag, empty_flag;
// my original signal
input  wire EOD_in;
output wire EOD_out;

wire [8:0] raw_di;
assign raw_di = {di, EOD_in};

wire [8:0] raw_do;
assign do = raw_do[8:1];
assign EOD_out = raw_do[0];

raw_async_9b_fifo fifo_impl (
                      .rst(~arst_n),
                      .di(raw_di), .clkw(clkw), .we(we),
                      .do(raw_do), .clkr(clkr), .re(re),
                      .empty_flag(empty_flag), .aempty_flag(aempty_flag),
                      .full_flag(full_flag), .afull_flag(afull_flag)

                  );


endmodule
