module counter(clk,
               rst_b,
               posedge_up_counter,
               negedge_up_counter,
	       pulse_out
              );
   input clk;
   input rst_b;

   output [31:0] posedge_up_counter;
   output [31:0] negedge_up_counter;
   output pulse_out;
   
   reg [31:0] posedge_up_counter;
   reg [31:0] negedge_up_counter;
   reg pulse_out;

   always @(posedge clk or negedge rst_b)
   begin
      if(rst_b == 1'b0)
         posedge_up_counter <= 0;
      else
	 posedge_up_counter <= posedge_up_counter + 1;
   end
   
   always @(negedge clk or negedge rst_b)
   begin
      if(rst_b == 1'b0)
         negedge_up_counter <= 0;
      else
	 negedge_up_counter <= negedge_up_counter + 1;
   end

   always @(posedge clk)
   begin
      pulse_out = 1'b0;
      if (posedge_up_counter % 31 == 0)
         pulse_out <= 1;
      else
	 pulse_out <= 0;
   end

endmodule
