module top_module (input a, input b, input c, output out);//
    wire nand_out;
    assign out = ~nand_out;
    andgate inst1 ( nand_out,a,b,c,1,1 );
endmodule
