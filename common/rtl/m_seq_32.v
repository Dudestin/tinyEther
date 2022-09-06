// cite from https://marsee101.blog.fc2.com/blog-entry-2449.html

module m_seq_32(
    input    wire        clk,
    input    wire        reset,
    output    reg [31:0]    mseq32
    
);

    function [31:0] mseqf32 (input [31:0] din);
        reg xor_result;
        begin
            xor_result = din[31] ^ din[21] ^ din[1] ^ din[0];
            mseqf32 = {din[30:0], xor_result};
        end
    endfunction
     
    always @(posedge clk) begin
        if (reset) 
            mseq32 <= 32'h789ABCDE;
        else
            mseq32 <= mseqf32(mseq32);
    end
     
endmodule