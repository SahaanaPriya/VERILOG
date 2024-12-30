`timescale 1ns/1ps
module counter_tb;
   reg clk_100MHz;
   reg rst_b;
   wire [31:0] pos_counter;
   wire [31:0] neg_counter;
   wire pulse_out;

   initial begin
      $dumpfile("test_counter.vcd");
      $dumpvars(0,counter_tb);
      clk_100MHz = 1'b0;
      rst_b = 1'b0;
      #20
      rst_b = 1'b1;
      #2000;
      $display("@ %0dns Value of pos_counter = %0d", $time, pos_counter); 
      $display("@ %0dns Value of neg_counter = %0d", $time, neg_counter);
      $finish(); 
   end

   always
      clk_100MHz = #5 ~clk_100MHz;

   counter u_counter(
                      .clk                (clk_100MHz),
                      .rst_b              (rst_b),
                      .posedge_up_counter (pos_counter),
                      .negedge_up_counter (neg_counter),
		      .pulse_out          (pulse_out)
                    );
endmodule
