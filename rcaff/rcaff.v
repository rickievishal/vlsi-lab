module rcaff(clk,rst,vcc,q,qb);
  input clk,rst,vcc;
  wire co;
  output [3:0]q,qb;
  div d1(clk,rst,co);
    jkff ff1(co,rst,vcc,vcc,q[0],qb[0]);
    jkff ff2(q[0],rst,vcc,vcc,q[1],qb[1]);
    jkff ff3(q[1],rst,vcc,vcc,q[2],qb[2]);
    jkff ff4(q[2],rst,vcc,vcc,q[3],qb[3]);
  endmodule
  
  
  
  
module jkff(clk,rst,j,k,q,qb);
input j,k,clk,rst;
output q,qb;
reg q;
reg qb;
always@(negedge clk)
begin
if(rst==1)
begin
q<=0;
qb<=1;
end
else
begin
case({j,k})
2'b00:
begin
q<=q;
qb<=qb;
end
2'b01:
begin
q<=0;
qb<=1;
end
2'b10:
begin
q<=1;
qb<=0;
end
2'b11:
begin
q<=~q;
qb<=~qb;
end
endcase
end
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
    assign co=sig[24];
  endmodule