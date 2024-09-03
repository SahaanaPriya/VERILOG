module half_sub_tb;
  reg a,b;
  wire diff,borrow;
  
  half_sub dut(diff,borrow,a,b);
  
  initial begin
    $dumpfile("half_sub.vcd");
    $dumpvars;
  end
  
  initial begin
    $monitor("At time=%0t A=%b B=%b Difference=%b Borrow=%b",$time,a,b,diff,borrow);
    a=0; b=0;
    #10 a=0; b=1;
    #10 a=1; b=0;
    #10 a=1; b=1;
    #10
    $finish;
  end
endmodule
