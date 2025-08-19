module tff(clk,t,rst,q);
input t,clk,rst;
output q;
reg q;
always@(posedge clk)
begin
if(rst==1)
q=0;
else
begin
if(t==0)
q=q;
else if(t==1)
q=~q;
end
end
endmodule
  