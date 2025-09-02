module fsm(clk,rst,en,num);
  input clk,rst,en;
  output [2:0]num;
  reg[2:0]ps,ns;
  parameter s0=0,s1=1,s2=2,s3=3,s4=4,s5=5,s6=6,s7=7;
  wire co;
  div div1(clk,rst,co);
  always @(posedge co)
  begin 
    if(rst)
      ps<=s0;
    else
      ps<=ns;
    end
    always @(*)
    begin 
      if(en)
        case(ps)
          s0 : ns<=s1;
          s1 : ns<=s2;
          s2 : ns<=s3;
          s3 : ns<=s4;
          s4 : ns<=s5;
          s5 : ns<=s6;
          s6 : ns<=s7;
          s7 : ns<=s0;
        endcase
      
    end 
    assign num = ps;
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
    assign co=sig[24];
  endmodule         