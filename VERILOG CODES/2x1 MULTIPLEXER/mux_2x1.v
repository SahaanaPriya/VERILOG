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
