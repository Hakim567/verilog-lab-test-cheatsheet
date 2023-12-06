//shift n bit registers
module wk4_task3b #(parameter n = 4) // Define n as bits for n-bit register
(
  input wire [n-1:0] D_in, //Input parallel data
  input wire S0, S1, //Control signal S0 & S1
  input wire clk, //Clock timing
  output reg [n-1:0] R1 //Output from the n-bit register
);

  always @(posedge clk) begin
    if (S0 == 1'b0 && S1 == 1'b0)     // S0=0, S1=0, Load parallel data
      R1 <= D_in; 
    else if (S0 == 1'b1 && S1 == 1'b0) // S0=1, S1=0, Shift left
      R1 <= R1<<1;
    else if (S0 == 1'b0 && S1 == 1'b1) // S0=0, S1=1, Shift right
      R1 <= R1>>1;
    else
	   R1 <= R1; // S0=1, S1=1, No change
  end

endmodule
