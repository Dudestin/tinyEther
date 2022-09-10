//============================================================================//
//                                                                            //
//      Binary to Gray code converter                                         //
//                                                                            //
//      Module name: bin2gray                                                 //
//      Desc: parameterised module to convert binary numbers to gray encoded  //
//            numbers                                                         //
//      Date: Aug 2012                                                        //
//      Developer: Wesley New                                                 //
//      Licence: GNU General Public License ver 3                             //
//      Notes:                                                                //
//                                                                            //
//============================================================================//

module my_bin2gray #(
           //=============
           // Parameters
           //=============
           parameter WIDTH = 32
       ) (
           //============
           // I/O Ports
           //============
           input  [WIDTH-1:0] din,
           output [WIDTH-1:0] dout
       );

//====================
// FUNC: binary2gray
//====================
function [WIDTH-1:0] binary2gray;
    input [WIDTH-1:0] value;
    integer i;
    begin
        binary2gray[WIDTH-1] = value[WIDTH-1];
        for (i = WIDTH-1; i > 0; i = i - 1)
            binary2gray[i - 1] = value[i] ^ value[i - 1];
    end
endfunction

assign dout = binary2gray(din);
endmodule
