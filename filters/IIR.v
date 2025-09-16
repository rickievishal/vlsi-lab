module IIR (x,clk,rst,y);
  input [3:0]x;
  input clk,rst;
  output [11:0]y;
  wire [7:0]p1,p2,p3,p4,p5,h1,h2,y1,y2;
  wire [3:0]x1,x2;
  div div1(clk,rst,co);
  parameter b0=4'b0001;
  parameter b1=4'b0001;
  parameter b2=4'b0001;
  parameter a1=4'b1110;
  parameter a2=4'b1110;
  assign p1=x*b0;
  dff4 d1(x,co,rst,x1);
  assign p2=b1*x1;
  dff4 d2(x1,co,rst,x2);
  assign p3=x2*b2;
  assign h1=p1+p2+p3;
  dff8 d3(h1,co,rst,y1);
  assign p4=a1*y1;
  dff8 d4(y1,co,rst,y2);
  assign p5=a2*y2;
  assign h2=p4+p5;
  assign y=h1+h2;

endmodule

module dff8 (d,clk,rst,q);
  input clk,rst;
  input [7:0]d;
  output [7:0]q;
  dff f1 (clk,d[0],rst,q[0]);
  dff f2 (clk,d[1],rst,q[1]);
  dff f3 (clk,d[2],rst,q[2]);
  dff f4 (clk,d[3],rst,q[3]);
  dff f5 (clk,d[4],rst,q[4]);
  dff f6 (clk,d[5],rst,q[5]);
  dff f7 (clk,d[6],rst,q[6]);
  dff f8 (clk,d[7],rst,q[7]);
endmodule


module dff4(d,clk,rst,q);
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