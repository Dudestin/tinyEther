//============================================================================//
//                                                                            //
//      Gray code to Binary converter                                         //
//                                                                            //
//      Module name: gray2bin                                                 //
//      Desc: parameterised module to convert gray coded numbers to binary    //
//            numbers                                                         //
//      Date: Aug 2012                                                        //
//      Developer: Wesley New                                                 //
//      Licence: GNU General Public License ver 3                             //
//      Notes:                                                                //
//                                                                            //
//============================================================================//

module my_gray2bin #(
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
   
   // gen vars
   genvar i;

   //=====================
   // Generate: gray2bin
   //=====================
   generate 
      for (i=0; i<WIDTH; i=i+1)
      begin : gen_for
         assign dout[i] = ^ din[WIDTH-1:i];
      end
   endgenerate

endmodule