module alu (
	input      [31:0] a, b, 
   	input      [2:0]  alucont, 
	output reg [31:0] result
);

	wire [31:0] b2, sum, slt;

	// adder/subtractor (alucont[2] ? (a - b) : (a + b))
	assign b2 = alucont[2] ? ~b : b; 
	assign sum = a + b2 + alucont[2];
	
	// slt = (a - b) > 0 
	assign slt = sum[31]; 

	always@(*) begin
		case(alucont)            
            3'b000: result = a & b;    
            3'b001: result = a | b;   
            3'b010: result = sum;    
            3'b110: result = sum;   
            3'b101: result = a * b;   
            3'b111: result = slt; 
            default: result = 32'b0;    
        endcase
	end

endmodule
