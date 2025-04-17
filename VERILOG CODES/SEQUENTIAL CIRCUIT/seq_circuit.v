module d_ff(d_in,
            clk,
            rst_b_d,
            q_out_d
           );
   input  d_in;
   input  clk;
   input  rst_b_d;
   output q_out_d;
  
   reg    q_out_d;
  always @(posedge clk or negedge rst_b_d)
   begin
     if(!rst_b_d)
        q_out_d <= 0;
     else
        q_out_d <= d_in;
   end
endmodule

module t_ff(t_in,
            clk,
            rst_b_t,
            q_out_t
           );
   input  t_in;
   input  clk;
   input  rst_b_t;
   output q_out_t;
  
   reg    q_out_t;
  always @(posedge clk or negedge rst_b_t)
   begin
     if(!rst_b_t)
        q_out_t <= 0;
     else
       if(t_in)
          q_out_t <= ~q_out_t;
       else
          q_out_t <= q_out_t;
   end
endmodule

module seq_circuit(clkin);
   input clkin;
   input reset_b;
   wire  q1, q2, q3;
   wire  w;
  
   not(w,q3);
   t_ff ff1(w,clkin,reset_b,q1);
   d_ff ff2(q1,clkin,reset_b,q2);
   t_ff ff3(q2,clkin,reset_b,q3);
endmodule
