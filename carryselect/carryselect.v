module rca0 (a,b,s,c4);
  input [3:0]a,b;
  output [3:0]s;
  output c4 ;
  
  wire c1,c2,c3;
  
  fulladd f1(a[0],b[0],0,s[0],c1);
  fulladd f2(a[1],b[1],c1,s[1],c2);
  fulladd f3(a[2],b[2],c2,s[2],c3);
  fulladd f4(a[3],b[3],c3,s[3],c4);
endmodule

module rca1 (a,b,s,cy);
  input [3:0]a,b;
  output [3:0]s;
  output cy;
  wire c5,c6,c7;
  fulladd f1(a[0],b[0],1,s[0],c5);
  fulladd f2(a[1],b[1],c5,s[1],c6);
  fulladd f3(a[2],b[2],c6,s[2],c7);
  fulladd f4(a[3],b[3],c7,s[3],cy);
endmodule

module fulladd(a,b,cin,s,c);
  input a,b,cin;
  output s,c;
  assign s=a^b^cin;
  assign c=(a&b)|(b&cin)|(a&cin);
endmodule

module muxx(s0,d0,d1,y);
  input s0,d0,d1;
  output y;
  assign y=((~s0 & d0) | (s0 & d1));
endmodule
  
module carselect(a,b,cin,cy,s,s1,s2);
  input [3:0]a;
  input [3:0]b;
  input cin;
  output [3:0]s;
  output cy;
  output [3:0]s1;
  output [3:0]s2;
  wire y1,y2;
  rca0 r0(a,b,s1,y1);
  rca1 r1(a,b,s2,y2);
  muxx m0(cin,s1[0],s2[0],s[0]);
  muxx m1(cin,s1[1],s2[1],s[1]);
  muxx m2(cin,s1[2],s2[2],s[2]);
  muxx m3(cin,s1[3],s2[3],s[3]);
  muxx m4(cin,y1,y2,cy);
endmodule
  
  