module rca (a,b,s,cy);
  input [3:0]a,b;
  output [3:0]s;
  output cy;
  
  wire c1,c2,c3;
  
  fulladd f1(a[0],b[0],0,s[0],c1);
  fulladd f2(a[1],b[1],c1,s[1],c2);
  fulladd f3(a[2],b[2],c2,s[2],c3);
  fulladd f4(a[3],b[3],c3,s[3],cy);
endmodule

module fulladd(a,b,cin,s,c);
  input a,b,cin;
  output s,c;
  assign s=a^b^cin;
  assign c=(a&b)|(b&cin)|(a&cin);
endmodule
  
  
  