module mux (s, d, y);
  input [3:0]s;       
  input [15:0]d;      
  output y;            

  wire [15:0] w;       

 assign w[0]  = (~s[3] & ~s[2] & ~s[1] & ~s[0]) & d[0];
  assign w[1]  = (~s[3] & ~s[2] & ~s[1] &  s[0]) & d[1];
  assign w[2]  = (~s[3] & ~s[2] &  s[1] & ~s[0]) & d[2];
  assign w[3]  = (~s[3] & ~s[2] &  s[1] &  s[0]) & d[3];
  assign w[4]  = (~s[3] &  s[2] & ~s[1] & ~s[0]) & d[4];
  assign w[5]  = (~s[3] &  s[2] & ~s[1] &  s[0]) & d[5];
  assign w[6]  = (~s[3] &  s[2] &  s[1] & ~s[0]) & d[6];
  assign w[7]  = (~s[3] &  s[2] &  s[1] &  s[0]) & d[7];
  assign w[8]  = ( s[3] & ~s[2] & ~s[1] & ~s[0]) & d[8];
  assign w[9]  = ( s[3] & ~s[2] & ~s[1] &  s[0]) & d[9];
  assign w[10] = ( s[3] & ~s[2] &  s[1] & ~s[0]) & d[10];
  assign w[11] = ( s[3] & ~s[2] &  s[1] &  s[0]) & d[11];
  assign w[12] = ( s[3] &  s[2] & ~s[1] & ~s[0]) & d[12];
  assign w[13] = ( s[3] &  s[2] & ~s[1] &  s[0]) & d[13];
  assign w[14] = ( s[3] &  s[2] &  s[1] & ~s[0]) & d[14];
  assign w[15] = ( s[3] &  s[2] &  s[1] &  s[0]) & d[15];

  
  assign y = w[0]|w[1]|w[2]|w[3]|w[4]|w[5]|w[6]|w[7]|w[8]|w[9]|w[10]|w[11]|w[12]|w[13]|w[14]|w[15];
endmodule