module acu(clk,a,rst,s,c);
  input [7:0]a;
  input clk;
  input rst;
  wire [7:0]p;
  output [7:0]s;
  output [7:0]c;
  
  pipo p1 (clk,s,rst,p);
  
  fulladd f1 (a[0],p[0],1'b0,s[0],c[0]);
  fulladd f2 (a[1],p[1],c[0],s[1],c[1]);
  fulladd f3 (a[2],p[2],c[1],s[2],c[2]);
  fulladd f4 (a[3],p[3],c[2],s[3],c[3]);
  
  fulladd f5 (a[4],p[4],c[3],s[4],c[4]);
  fulladd f6 (a[5],p[5],c[4],s[5],c[5]);
  fulladd f7 (a[6],p[6],c[5],s[6],c[6]);
  fulladd f8 (a[7],p[7],c[6],s[7],c[7]);
  
  
endmodule
  
module fulladd(a,b,cin,s,c);
  input a,b,cin;
  output s,c;
  assign s=a^b^cin;
  assign c=(a&b)|(b&cin)|(a&cin);
endmodule
  
  
  
module pipo(clk,a,rst,q);
  input clk,rst;
  input [7:0]a;
  output [7:0]q;
  dff d1(clk,a[0],rst,q[0]);
  dff d2(clk,a[1],rst,q[1]);
  dff d3(clk,a[2],rst,q[2]);
  dff d4(clk,a[3],rst,q[3]);


  dff d5(clk,a[4],rst,q[4]);
  dff d6(clk,a[5],rst,q[5]);
  dff d7(clk,a[6],rst,q[6]);
  dff d8(clk,a[7],rst,q[7]);
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
  