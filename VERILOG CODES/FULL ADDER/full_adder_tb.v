module full_adder_tb;
  reg a,b,cin;
  wire sum,cout;
  
  full_adder dut(sum,cout,a,b,cin);
  
  initial begin
    $dumpfile("full_adder.vcd");
    $dumpvars;
  end
  
  initial begin
    $monitor("At time=%0t A=%b B=%b Cin=%b Sum=%b Cout=%b",$time,a,b,cin,sum,cout);
    a=0; b=0; cin=0;
    #10 a=0; b=0; cin=1;
    #10 a=0; b=1; cin=0;
    #10 a=0; b=1; cin=1;
    #10 a=1; b=0; cin=0;
    #10 a=1; b=0; cin=1;
    #10 a=1; b=1; cin=0;
    #10 a=1; b=1; cin=1;
    #10
    $finish;
  end
endmodule
