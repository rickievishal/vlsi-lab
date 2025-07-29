module ex1(a,b,d,bo);
  input a,b;
  output d,bo;
  reg d,bo;
  always @(a or b)
  begin
    case({a,b}) 
        2'b00 : 
        begin
          d = 1'b0;
          bo = 1'b0;
        end 
        2'b01 : 
        begin
          d = 1'b1;
          bo = 1'b1;
        end 
        2'b10 : 
        begin
          d = 1'b1;
          bo = 1'b0;
        end
        2'b11 : 
        begin
          d = 1'b0;
          bo = 1'b0;
        end
      endcase
    end
  endmodule 