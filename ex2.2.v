module ex1(a,b,y);
  input a,b;
  output y;
  reg y;
  always @(a or b)
  begin
    case({a,b})
      2'b00:y=1'b0;
      2'b01:y=1'b1;
      2'b10:y=1'b1;
      2'b11:y=1'b1;
    endcase
  end
endmodule
      