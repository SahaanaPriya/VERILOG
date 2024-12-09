module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire cout1,cout2,cout3;
    wire [15:0]out;
    wire [15:0] sum1,sum2,sum3;
    add16 a1(a[15:0],b[15:0],1'b0,sum1[15:0],cout1);
    add16 a2(a[31:16],b[31:16],1'b0,sum2[15:0],cout2);
    add16 a3(a[31:16],b[31:16],1'b1,sum3[15:0],cout3);
    assign out=cout1?sum3[15:0]:sum2[15:0];
    assign sum={out[15:0],sum1[15:0]};
endmodule
