module queue(clk,rst,datain,rw,dataout,full,empty);
  input clk,rst,rw;
  input [7:0] datain;
  reg [7:0] readptr;
  reg[7:0] writeptr;
  output reg full,empty;
  output reg[7:0]dataout;
  reg[7:0] mem[255:0];
  always @(posedge clk)
  begin 
    if (rst ==1)
      begin dataout = 0;
        readptr = 0;
        writeptr = 0;
      end 
    else if (rw==1 && writeptr < 255)
      begin 
        mem[writeptr] = datain;
        writeptr = writeptr +1;
      end
    else if (rw == 1 && writeptr == 255)
      full = 0 ;
    else if (rw ==0 && readptr < 255)
      begin 
        dataout = mem[readptr];
        readptr = readptr + 1;
    end
  else 
    empty = 1;
  end
endmodule
