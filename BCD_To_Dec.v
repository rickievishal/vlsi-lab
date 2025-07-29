module BCD_TO_DEC(a,b,c,d,y);
  input a,b,c,d;
  output [9:0]y;
  wire w1,w2,w3,w4;
  not(w1,a);
  not(w2,b);
  not(w3,c);
  not(w4,d);
  
  and(y[0],w1,w2,w3,w4);
  and(y[1],a,w2,w3,w4);
  and(y[2],w1,b,w3,w4);
  and(y[3],a,b,w3,w4);
  and(y[4],w1,w2,c,w4);
  and(y[5],w1,b,w3,d);
  and(y[6],w1,w2,c,d);
  and(y[7],w1,b,c,d);
  and(y[8],a,w2,w3,w4);
  and(y[9],a,w2,w3,d);
endmodule
  