module xorg_tb;
  reg a,b;
  wire y;
  
  xorg dut(y,a,b);
  
  initial begin
    $dumpfile("xorg.vcd");
    $dumpvars;
  end
  
  initial begin
    $monitor("At time=%0t A=%b B=%b Y=%b",$time,a,b,y);
    a=0; b=0;
    #10 a=0; b=1;
    #10 a=1; b=0;
    #10 a=1; b=1;
    #10
    $finish;
  end
endmodule
