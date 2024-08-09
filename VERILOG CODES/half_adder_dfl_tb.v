module half_adder_dfl_tb;
  reg a,b;
  wire sum,carry;
  half_adder_dfl dut(.a(a),.b(b),.sum(sum),.carry(carry));
  initial begin
    $dumpfile("half_adder_dfl.vcd");
    $dumpvars;
  end
  initial begin
    $monitor("At time %0t: a=%b b=%b, sum=%b,carry=%b",$time, a,b,sum,carry);
    a=0; b=0;
    #1
    a=0;b=1;
    #1
    a=1;b=0;
    #1
    a=1;b=1;
  end
endmodule
