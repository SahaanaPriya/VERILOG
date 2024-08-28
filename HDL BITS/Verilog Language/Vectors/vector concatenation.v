module top_module (
    input [4:0] a, b, c, d, e, f,
    output [7:0] w, x, y, z );//

    // assign { ... } = { ... };
    wire [31:0]concat;
    assign concat={a[4:0],b[4:0],c[4:0],d[4:0],e[4:0],f[4:0],2'b11};
    assign w=concat[31:24];
    assign x=concat[23:16];
    assign y=concat[15:8];
    assign z=concat[7:0];
endmodule
