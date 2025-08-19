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
     