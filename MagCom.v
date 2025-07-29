module MagCom(a,b,x,y,z);
  input [3:0]a,b;
  output x,y,z;
  wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12;
  and(w1,a[3],~b[3]);
  and(w2,a[2],~b[2],w5);
  and(w3,a[1],~b[1],w6);
  and(w4,a[0],~b[0],w5,w6,w7);
  or(x,w1,w2,w3,w4);
  
  xnor(w5,a[3],b[3]);
  xnor(w6,a[2],b[2]);
  xnor(w7,a[1],b[1]);
  xnor(w8,a[0],b[0]);
  and(y,w5,w6,w7,w8);
  
  and(w9,~a[3],b[3]);
  and(w10,~a[2],b[2],w5);
  and(w11,~a[1],b[1],w5,w6);
  and(w12,~a[0],b[0],w5,w6,w7);
  or(z,w9,w10,w11,w12);
endmodule
  
    
  
  
  
  