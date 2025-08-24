module maindec(
	input  [5:0] op,
	output       memtoreg, memwrite,
	output       branch, alusrc,
	output       regdst, regwrite,
	output       jump,
	output [1:0] aluop
);

	reg [9:0] controls;

	// regwrite = write alu_result into regfile (R-type, LW, ADDI)
	// regdst = instruction has destination register (rd) (R-type)
	// alusrc = choose between temporary register (rt) and immediate data as srcB (LW, SW, ADDI)
	// branch = branch instruction (BEQ)
	// memwrite = write into datamem (SW)
	// memtoreg = write datamem output to regfile (LW)
	// jump = jump instruction (J)
	// aluop = select alu operation like calc addr for datamem read/write, 
	// 			check equality for branching or regular behavior

	assign {regwrite, regdst, alusrc, branch, memwrite,
	  	memtoreg, jump, aluop} = controls;

	always @(*) begin
		case(op)
			6'b000000: controls = 9'b110000010; //R-type
			6'b100011: controls = 9'b101001000; //LW
			6'b101011: controls = 9'b001010000; //SW
			6'b000100: controls = 9'b000100001; //BEQ
			6'b001000: controls = 9'b101000000; //ADDI
			6'b000010: controls = 9'b000000100; //J
			default:   controls = 9'bxxxxxxxxx; //???
		endcase
	end
	
endmodule
