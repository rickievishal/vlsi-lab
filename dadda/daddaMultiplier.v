
module dadda(a,b,p);
  input [3:0]a;
  input [3:0]b;
  output [8:1]p;
  
  
  wire [15:0]m;
 
  
  wire [10:2]s;
  wire [12:0]d;
  wire cc,cc1;
   product p1(a,b,m,p[1]);
  
  fulladd f1(m[0],m[6],1'b0,p[2],d[1]);
  fulladd f2(m[1],m[7],d[1],s[2],d[2]);
  fulladd f3(m[2],m[8],d[2],s[3],d[3]);
  fulladd f4(m[3],m[9],d[3],s[4],d[4]);
  fulladd f5(m[4],m[10],d[4],s[5],d[5]);
  fulladd f6(m[5],1'b0,d[5],s[6],p[8]);
  
  fulladd f7(m[11],s[2],1'b0,p[3],d[7]);
  fulladd f8(m[12],s[3],d[7],s[8],d[8]);
  fulladd f9(m[13],s[4],d[8],s[9],d[9]);
  fulladd f10(1'b0,s[5],d[9],s[10],d[10]);
  fulladd f11(1'b0,s[6],d[10],p[7],cc);
  
  fulladd f12(m[14],s[8],1'b0,p[4],d[11]);
  fulladd f13(1'b0,s[9],d[11],p[5],d[12]);
  fulladd f14(1'b0,s[10],d[12],p[6],cc1);
  
endmodule 



module fulladd(a,b,cin,s,c);
  input a,b,cin;
  output s,c;
  assign s=a^b^cin;
  assign c=(a&b)|(b&cin)|(a&cin);
endmodule

module product (a,b,m,p1);
  input [3:0]a;
  input [3:0]b;
  output p1;
  output [15:0]m;
  
  assign p1 = a[0] & b[0];
  assign m[6] = a[0] & b[1];
  assign m[11] = a[0] & b[2];
  assign m[14] = a[0] & b[3];
  
  assign m[0] = a[1] & b[0];
  assign m[7] = a[1] & b[1];
  assign m[12] = a[1] & b[2];
  assign m[13] = a[1] & b[3];
  
  assign m[1] = a[2] & b[0];
  assign m[8] = a[2] & b[1];
  assign m[9] = a[2] & b[2];
  assign m[10] = a[2] & b[3];
  
  assign m[2] = a[3] & b[0];
  assign m[3] = a[3] & b[1];
  assign m[4] = a[3] & b[2];
  assign m[5] = a[3] & b[3];
  
endmodule

