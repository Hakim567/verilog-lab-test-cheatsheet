//lab test module
module lab_test (clk, input_bit, reset, RA, RB, RA_out, RC, output_bit, present_state, next_state); // Define all inputs & outputs
  input clk, input_bit, reset; //Syntax error on clck and rest
  input [3:0] RA, RB; //needs to be 4 bit to match waveform
  output reg [3:0] RA_out, RC; //RA' also missing RC
  output reg output_bit; //Z no [1:0] since its a bit
  output reg [1:0] present_state, next_state; //PS & NS

  //wrong parameters
  parameter zero=00, one=01, two=10, three=11;
  
  always @(posedge clk or posedge reset) begin//missing @ and begin
   if (present_state == 2'b01) begin
		output_bit = 1'b1;
	end else
		output_bit = 1'b0;
	
	if (reset) begin
		present_state <= zero; //if reset go back to S0 not S3
	end else
		present_state <= next_state;
	end

  always @(present_state) begin //missing begin
    RA_out <= ~RA;
    case (present_state)
		zero: begin
			if (input_bit == 1'b1) //1'b11 is 2 bit 11 just want 1'b1
				next_state = zero; //go back to S0
			else
				next_state = one; //go to S1
			RC <= (RA||RB);
		end
		//missing all the other cases
		one: begin
			if (input_bit == 1'b1)
				next_state = one; //go back to S1
			else
				next_state = one; //go to S2
			RC <= RA - RB;
		end
		two: begin
			if (input_bit == 1'b1)
				next_state = two; //go back to S2
			else
				next_state = three; //go to S3
			RC <= RA_out + 4'b0100;
		end
		three: begin
			if (input_bit == 1'b1)
				next_state = three; //go back to S3
			else
				next_state = zero; //go to S0
			RC <= RA ^ RB;
		end
	 endcase
  end

endmodule
