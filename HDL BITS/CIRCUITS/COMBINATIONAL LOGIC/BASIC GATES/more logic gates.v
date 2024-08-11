module top_module( 
    input a, b,
    output out_and,
    output out_or,
    output out_xor,
    output out_nand,
    output out_nor,
    output out_xnor,
    output out_anotb
);
    and g1(out_and,a,b);
    or g2(out_or,a,b);
    xor g3(out_xor,a,b);
    nand g4(out_nand,a,b);
    nor g5(out_nor,a,b);
    xnor g6(out_xnor,a,b);
    and g7(out_anotb,a,~b);
endmodule
