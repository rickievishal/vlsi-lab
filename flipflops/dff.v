module dff(clk,d,rst,q);
input d,clk,rst;
output q;
reg q;
always@(posedge clk)
begin
if(rst==1)
q=0;
else
q=d;
end
endmodule
  