module ram_1KB_tb;
   reg  reset_b;
   reg  clock;
   reg  chip_select;
   reg  [9:0]write_address;
   reg  write_enable;
   reg  [7:0]write_data;
   reg  read_enable;
   reg  [9:0]read_address;
   wire [7:0]read_data;
   reg  [7:0]read_data_mem;
   integer i;

   ram_1KB uut(
	       .reset_b       (reset_b),
	       .clock         (clock),
	       .chip_select   (chip_select),
	       .write_address (write_address),
	       .write_enable  (write_enable),
	       .write_data    (write_data),
	       .read_enable   (read_enable),
	       .read_address  (read_address),
	       .read_data     (read_data)
	      );
 
   initial begin
     $dumpfile("dump.vcd");
      $dumpvars(0,ram_1KB_tb);
      chip_select = 1'b1;
      clock = 1'b0;
      read_enable = 1'b0;
      write_enable = 1'b0;
      reset_mem;
      for(i=0; i<1024; i=i+1) 
      begin
         write_mem(i, 8'hAA);
	     //$display("Write: Address = %0h Data = %0h", i, write_data);
      end
      @(posedge clock);
      for(i=0; i<1024; i=i+1)
      begin
         read_mem(i,read_data_mem);
	     //$display("Read: Address = %0h Data = %0h", i, read_data_mem);
      end
      #20000;
      $finish();
   end

   always
      clock = #5 ~clock;

  task write_mem(input reg [9:0] wr_address,
                 input reg [7:0] wr_data );
   begin
      write_enable  = 1'b1;
      write_address = wr_address;
      write_data    = wr_data;
      @(posedge clock);
      write_enable  = 1'b0;
      @(posedge clock);
      $display("Write: Address = %0h Data = %0h", wr_address, wr_data);
   end   
   endtask

  task read_mem(input   reg [9:0] re_address,
                output  reg [7:0] re_data);
   begin
      read_enable   = 1'b1;
      read_address  = re_address;
      @(posedge clock);
      @(posedge clock);
      re_data       = read_data;
      read_enable   = 1'b0;
      $display("Read: Address = %0h Data = %0h", re_address, re_data);
   end
   endtask

   task reset_mem;
   begin
      reset_b = 1'b0;
      repeat (16) @(posedge clock);
      reset_b = 1'b1;
   end
   endtask
endmodule
