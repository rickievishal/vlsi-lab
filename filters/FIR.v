module FIR (y,x,clk,rst);
  input [3:0]x;
  input clk,rst;
  output [7:0]y;
  wire [7:0]p1,p2,p3;
  wire [3:0]a1,a2;
  div div1(clk,rst,co);
  parameter a=4'b0001;
  parameter b=4'b0010;
  parameter c=4'b0011;
  assign p1=a*x;
  
  dff4 d1(a1,co,rst,x);
  assign p2=a1*b;
  dff4 d2(a2,co,rst,a1);
  assign p3=a2*c;
  assign y=p1+p2+p3;
endmodule


module dff4 (q,clk,rst,d);
  input clk,rst;
  input [3:0]d;
  output [3:0]q;
  dff f1 (clk,d[0],rst,q[0]);
  dff f2 (clk,d[1],rst,q[1]);
  dff f3 (clk,d[2],rst,q[2]);
  dff f4 (clk,d[3],rst,q[3]);
endmodule

module dff(clk,d,rst,q);
input d,clk,rst;
output q;
reg q;
always@(posedge clk)
begin
if(rst==1)
q=0;
else
q=d;
end
endmodule


 module div(clk,rst,co);
  input clk,rst;
  output co;
  reg [27:0]sig;
  always@(posedge clk)
  begin
    if(rst==1)
      sig=28'b0;
    else if(rst==0)
      sig=sig+1;
    end
    assign co=sig[25];
  endmodule
  