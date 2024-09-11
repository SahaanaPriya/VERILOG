module full_sub_tb;
  reg a,b,c;
  wire diff,bout;
  
  full_sub dut(a,b,c,diff,bout);
  
  initial begin
    $dumpfile("full_sub.vcd");
    $dumpvars;
  end
  
  initial begin
    $monitor("At time=%0t A=%b B=%b Bin=%b Difference=%b Bout=%b",$time,a,b,c,diff,bout);
    a=0; b=0; c=0;
    #10 a=0; b=0; c=1;
    #10 a=0; b=1; c=0;
    #10 a=0; b=1; c=1;
    #10 a=1; b=0; c=0;
    #10 a=1; b=0; c=1;
    #10 a=1; b=1; c=0;
    #10 a=1; b=1; c=1;
    #10
    $finish;
  end
endmodule
