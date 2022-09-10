/* very simple implementation of MUTEX */
/* usage : if the module want to use the resource, assert req_* when using it
           when release the resource, deassert req_*.
           You can use the resource when corresponding val_* asserted.
           user must obey to following condition : 
           1. Be sure to deassert req_0, when release the module.
           2. User must deassert (release resource) req_* once a request, if not comply this, it will cause the resource starvation.
*/

module mutex(
           input wire clk,
           input wire arst_n,
           input wire req_0, // high priority
           input wire req_1, // low  priority

           output wire val_0,
           output wire val_1
       );

reg state_0; // 1 meaning using the resource
reg state_1;

assign val_0 = state_0;
assign val_1 = state_1;

always @(posedge clk or negedge arst_n)
begin
    if (~arst_n)
    begin
        state_0 <= 1'b0;
        state_1 <= 1'b0;
    end
    else
    begin
        // Aquire
        if (req_0 & ~state_1) // req_0 priority is higher than req_1,
            state_0 <= 1'b1;
        else if (req_1 & ~state_0)
            state_1 <= 1'b1;
        // Release
        if (~req_0)
            state_0 <= 1'b0;
        if (~req_1)
            state_1 <= 1'b0;
    end
end

endmodule
