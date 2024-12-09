module top_module_a (input x, input y, output z);
    assign z=(x^y)&x;
endmodule

module top_module_b ( input x, input y, output z );
    assign z=~(x^y);
endmodule

module top_module (input x, input y, output z);
    wire w1,w2,w3,w4,w5,w6;
    top_module_a g1(x,y,w1);
    top_module_b g2(x,y,w2);
    top_module_a g3(x,y,w3);
    top_module_b g4(x,y,w4);
    or g5(w5,w1,w2);
    and g6(w6,w3,w4);
    xor g7(z,w5,w6);
endmodule
