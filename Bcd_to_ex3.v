module BCD_To_EX3(a,b,c,d,w,x,y,z);
  input a,b,c,d;
  output w,x,y,z;
  wire w1,w2,w3,w4,w5,w6,w7,w8,w9;
  not(w1,a);
  not(w2,b);
  not(w3,c);
  and(w5,b,d);
  and(w6,b,c);
  or(w,a,w5,w6);
  and(w7,~c,~d);
  xnor(x,b,w7);
  xnor(y,c,d);
  not(z,d);
endmodule
  
  