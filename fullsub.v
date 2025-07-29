module fullsub(a,b,bin,d,bout);
  input a,b,bin;
  output d,bout;
  wire w1,w2,w3;
  assign d=(a^b^bin);
  assign w1=(b&bin);
  assign w2=(b&(~a));
  assign w3=(bin&(~a));
  assign bout=(w1|w2|w3);
endmodule  