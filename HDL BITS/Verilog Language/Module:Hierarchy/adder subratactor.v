module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire cout1,cout2;
    wire [31:0]out;
    wire [15:0] sum1,sum2;
    assign out=b^{32{sub}};
    add16 a1(a[15:0],out[15:0],sub,sum1[15:0],cout1);
    add16 a2(a[31:16],out[31:16],cout1,sum2[15:0],cout2);
    assign sum={sum2[15:0],sum1[15:0]};
endmodule
