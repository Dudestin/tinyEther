// generic purpose 2-FF synchronizer

module sync_2ff(
           clk,
           din,
           dout
       );

input wire clk;
input wire din;
output wire dout;

reg temp1;
reg temp2;

assign dout = temp2;

always @(posedge clk)
begin
    temp1 <= din;
    temp2 <= temp1;
end

endmodule
