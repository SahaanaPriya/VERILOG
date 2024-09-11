module full_sub(
  input a,b,c,
  output diff,bout);
  assign diff=a^b^c;
  assign bout=(~a&b)|(~(a^b)&c);
endmodule
