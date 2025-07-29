module fs(a,b,bin,d,bo);
  input a,b,bin;
  output d,bo;
  wire w1,w2,w3;
  halfSub h1(a,b,w1,w2);
  halfSub h2(bin,w1,d,w3);
  or (bo,w2,w3);
endmodule

module halfSub(a,b,d,bo);
  input a,b ;
  output d,bo;
  xor (d,a,b);
  and (bo,~a,b);
endmodule 