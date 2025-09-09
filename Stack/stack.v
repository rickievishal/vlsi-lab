module stack(clk,rst,datain,rw,dataout,full,empty);
  input clk,rst,rw;
  input [7:0]datain;
  reg [7:0]ptr;
  output reg [7:0]dataout;
  reg[7:0] mem[255:0];
  output reg full,empty;
  always @(posedge clk)
  begin if (rst == 1)
  begin 
  dataout = 0;
  ptr = 0;
end
else if (rw == 1 && ptr <255)
begin 
mem[ptr]=datain;
ptr = ptr + 1;
empty =0;
end 
else if (rw==1 && ptr < 255)
begin
  full =1;
  empty =0;
end 
else if (rw==0 && ptr<255)
begin
dataout = mem[ptr];
ptr = ptr - 1;
end 
else 
empty = 1;
end 
endmodule