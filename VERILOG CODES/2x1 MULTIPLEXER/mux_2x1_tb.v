module mux_2x1_tb;
   reg  [1:0]data_in;
   reg  sel_inp;
   wire data_out;
  
   mux_2x1 dut(data_in, sel_inp, data_out);
  
   initial begin
     $dumpfile("mux_2x1.vcd");
     $dumpvars;
   end
  
   initial
      begin
         $monitor("At time=%0t Sel_input=%0b Data_input=%0b Data_output=%0b",$time, sel_inp, data_in, data_out);
    sel_inp=0;
         #10 data_in[1] = 0;
         #10 data_in[0] = 0;
         #10 data_in[0] = 1;
         #10 sel_inp=1;
         #10 data_in[0] = 1;
         #10 data_in[1] = 0;
         #10 data_in[1] = 1;
         #10
         $finish;
      end
endmodule
