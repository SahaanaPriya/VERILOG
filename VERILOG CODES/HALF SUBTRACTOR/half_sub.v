module half_sub(
  output diff,borrow,
  input a,b);
  assign diff=a^b;
  assign borrow=(~a&b);
endmodule
