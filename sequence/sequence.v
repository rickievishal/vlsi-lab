module seq(din,clk,rst,out,x);
  input din,clk,rst;
  output out;
  output x;
  reg out;
  wire x;
  wire co;
  div div1(clk,rst,co);
  assign x=co;
  parameter s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100;
  reg [2:0]ps,ns;
  always@(posedge co or posedge rst)
  begin
    if(rst==1'b1)
      ps=s0;
    else
      ps=ns;
  end
  always @(ps,din)
  begin 
    case(ps)
      s0 : if(din == 1'b1)
      begin 
        ns=s1;
        out = 1'b0;
      end 
    else 
      begin 
        ns = s0;
        out = 1'b0;
      end 
       s1 : if(din == 1'b0)
       begin 
        ns=s2;
        out = 1'b0;
        end 
    else 
      begin 
        ns = s1;
        out = 1'b0;
      end 
       s2 : if(din == 1'b1)
       begin 
        ns=s3;
        out = 1'b0;
      end 
      else 
      begin 
        ns = s0;
        out = 1'b0;
      end 
       s3 : if(din == 1'b0)
       begin 
        ns=s4;
        out = 1'b0;
       end 
    else 
      begin 
        ns = s1;
        out = 1'b0;
      end 
       s4 : if(din == 1'b1)
      begin 
        ns=s3;
        out = 1'b1;
      end 
    else 
      begin 
        ns = s0;
        out = 1'b0;
      end 
    endcase 
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
    assign co=sig[27];
  endmodule