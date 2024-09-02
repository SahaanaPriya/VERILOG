module half_adder_tb;
  reg a,b;
  wire s,cout;
  
  half_adder dut(.a(a),.b(b),.s(s),.cout(cout));
  
  initial begin
    $dumpfile("half_adder.vcd");
    $dumpvars;
  end
  
  initial begin
    $monitor("At time=%0t \tA=%b B=%b \tSum=%b Carry=%b",$time,a,b,s,cout);
    a=1'b0; b=1'b0;
    #10 a=1'b0; b=1'b1;
    #10 a=1'b1; b=1'b0;
    #10 a=1'b1; b=1'b1;
    #10
    $finish;
  end
  
endmodule
