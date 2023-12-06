//CO : R2 <- 0;
//C1 : R2 <- R2';
//C2 : R2 <- R1;

module wk4_task2(clk, R1, R2, S0, S1);
  //define input and output ports
  input clk, S0, S1, R1;
  output reg R2;
  always @(posedge clk) begin
  if (S0 == 0 && S1 == 0)
    R2 <= 1'b0;
  else if (S0 == 0 && S1 == 1)
    R2 <= ~R2;
  else if (S0 == 1 && S1 == 0)
    R2 <= R1;
  else
    R2 <= R2;
  end
endmodule
