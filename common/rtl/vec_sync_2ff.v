/* vector synchronizer for gray code or one-hot code */

module vec_sync_2ff #(
           parameter integer WIDTH = 1
       )(
           input wire clk,
           input wire [WIDTH-1:0] din,
           output wire [WIDTH-1:0] dout
       );
reg [WIDTH-1:0] temp1;
reg [WIDTH-1:0] temp2;

always @(posedge clk)
begin
    temp1 <= din;
    temp2 <= temp1;
end

assign dout = temp2;
endmodule
