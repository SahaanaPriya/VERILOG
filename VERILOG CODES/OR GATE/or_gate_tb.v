module org_tb;
  reg a,b;
  wire y;
  
  org dut(y,a,b);
  
  initial begin
    $dumpfile("org.vcd");
    $dumpvars;
  end
  
  initial begin
    $monitor("At time=%0t a=%b b=%b y=%b",$time,a,b,y);
    a=0; b=0;
    #10 a=0; b=1;
    #10 a=1; b=0;
    #10 a=1; b=1;
    #10
    $finish;
  end
endmodule
