module ram_1KB(reset_b,
	           clock,
               chip_select,
               write_address,
               write_enable,
               write_data,
               read_enable,
	           read_address,
               read_data);

   parameter ADDR_WIDTH  = 10;
   parameter DATA_WIDTH  = 8;
   parameter ADDR_DEPTH  = 1024;

   input  reset_b;
   input  clock;
   input  chip_select;
   input  [ADDR_WIDTH-1:0]write_address;
   input  write_enable;
   input  [DATA_WIDTH-1:0]write_data;
   input  read_enable;
   input  [ADDR_WIDTH-1:0]read_address;
   output [DATA_WIDTH-1:0]read_data;

   wire [DATA_WIDTH-1:0]read_data;
   reg [DATA_WIDTH-1:0] mem [0:ADDR_DEPTH-1];

   reg  [ADDR_WIDTH-1:0]write_address_ff; 
   reg  write_enable_ff;
   reg  [DATA_WIDTH-1:0]write_data_ff;
   reg  read_enable_ff;
   reg  [ADDR_WIDTH-1:0]read_address_ff;
   reg  [DATA_WIDTH-1:0]read_data_ff;
   //Flopped version
   always @(posedge clock or negedge reset_b)
   begin
      if (reset_b == 1'b0)
      begin
         write_enable_ff  <= 1'b0;
	     read_enable_ff   <= 1'b0;
	     write_data_ff    <= 'b0;
	     write_address_ff <= 'b0;
	     read_address_ff  <= 'b0;
      end
      else
      begin
	     write_enable_ff  <= write_enable;
	     read_enable_ff   <= read_enable;
	     write_data_ff    <= write_data;
	     write_address_ff <= write_address;
	     read_address_ff  <= read_address;
      end
   end
   //WRITE OPERATION
   always @(posedge clock or negedge reset_b)
   begin
      if (reset_b == 1'b0)
      begin
         write_enable_ff <= 1'b0;
	     write_data_ff   <= 'b0;
      end
      else if (chip_select  && write_enable_ff )
         mem[write_address_ff] <= write_data_ff;
   end
   //READ OPERATION
   always @(posedge clock or negedge reset_b)
   begin
      if (reset_b == 1'b0)
      begin
         read_enable_ff  <= 1'b0;
	     read_data_ff    <= 'b0;
      end
      else if (chip_select  && read_enable_ff && ~write_enable_ff )
         read_data_ff <= mem[read_address_ff];
   end

   assign read_data = (chip_select  && read_enable_ff && ~write_enable_ff ) ? read_data_ff : 'bz;

endmodule 
