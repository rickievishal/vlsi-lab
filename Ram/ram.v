module ram(q,a,d,we,clk,x);
  input [7:0]d;
  input [6:0]a;
  input we,clk;
  output reg [7:0]q;
  output x;
  reg [7:0] mem[127:0];
  div div1(clk,rst,co);
  assign x=co;
  always @ (posedge co)
  begin
    if(we)
      mem[a]<=d;
    else
      q=mem[a];
    end
  endmodule
  
  
  module div(clk,rst,co);
  input clk,rst;
  output co;
  reg [27:0]sig;
  always@(posedge clk)
  begin
    if(rst==1)
      sig=28'b0;
    else if(rst==0)
      sig=sig+1;
    end
    assign co=sig[25];
  endmodule