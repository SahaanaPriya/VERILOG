//Create a clock which can generate 100MHz
`timescale 1ns/100ps
module clk_generator(
		//No inputs or outputs in this module
		    );
	//Time period for 100MHz: 10ns
	//ON time: 5ns
	//OFF time: 5ns

	reg clk_100MHz;
	parameter total_time_period = 10; //Input Clock Frequency = 100MHz
	integer delay_time;
	//The initial block will be executed only one at the beginning of the simulation
	initial
	begin

	        delay_time = total_time_period/2;
		$display("@ %0dns delay_time = %0d",$time, delay_time);
		//This is the file in which the dump file will be created
		$dumpfile("test.vcd");
		//This is command to tell the instance from which it should dump, and 0 tells dump all hierachy underneath this 
		$dumpvars(0,clk_generator);
		clk_100MHz=1'b0;
		#1000;
		$finish(); //This is to finish the simulation
	end
	//There is no sensitivity list in the always block
	always 
		clk_100MHz = #delay_time ~clk_100MHz;

	always @(posedge clk_100MHz)
	begin
		$display("@ %0tns clk_100MHz posedge occured",$realtime);
	end

	always @(negedge clk_100MHz)
	begin
		$display("@ %0tns clk_100MHz negedge occured",$realtime);
	end
endmodule
