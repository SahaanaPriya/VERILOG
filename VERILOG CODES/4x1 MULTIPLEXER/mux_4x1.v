module mux_2x1(
                input  [1:0]data_in,
                input  sel_inp,
                output reg data_out
              );
   always @(*)
   begin
     if(sel_inp)
       data_out = data_in[1];
     else
       data_out = data_in[0];
   end
endmodule

module mux_4x1(sel_inp,
               data_in,
               data_out
              );
   input  [1:0]sel_inp;
   input  [3:0]data_in;
   output data_out;
  
   wire   w1, w2;
  
   mux_2x1 m1(sel_inp[1], data_in[2],data_in[3], w1);
   mux_2x1 m2(sel_inp[1], data_in[0],data_in[1], w0);
   mux_2x1 m3(sel_inp[0], w0, w1, data_out);
endmodule
