module full_adder(a,b,cin,cout,sum);
    input a, b, cin;
    output cout, sum;
    assign sum=a^b^cin;
    assign cout=(a&b)|(b&cin)|(a&cin);
endmodule

module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    wire [3:0]c;
    full_adder fa1(x[0],y[0],c[0],c[1],sum[0]);
    full_adder fa2(x[1],y[1],c[1],c[2],sum[1]);
    full_adder fa3(x[2],y[2],c[2],c[3],sum[2]);
    full_adder fa4(x[3],y[3],c[3],sum[4],sum[3]);
endmodule
