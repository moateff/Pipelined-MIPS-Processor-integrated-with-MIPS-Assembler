module hazard (
	input      [4:0] rsD, rtD, rsE, rtE, 
	input      [4:0] writeregE, writeregM, writeregW,
	input            regwriteE, regwriteM, regwriteW,
	input            memtoregE, memtoregM, branchD,
	output           forwardaD, forwardbD,
	output reg [1:0] forwardaE, forwardbE,
	output           stallF, stallD, flushE
);

	wire lwstallD, branchstallD;

	// forwarding sources to D stage (branch equality)
	assign forwardaD = ((rsD != 0) & (rsD == writeregM) & regwriteM);
	assign forwardbD = ((rtD != 0) & (rtD == writeregM) & regwriteM);

	// forwarding sources to E stage (ALU)
	always @(*) begin
		forwardaE = 2'b00; forwardbE = 2'b00;
		if (rsE != 0) begin
			if ((rsE == writeregM) & regwriteM) begin 
				forwardaE = 2'b10;
			end else if ((rsE == writeregW) & regwriteW) begin
				forwardaE = 2'b01;
			end
		end
		if (rtE != 0) begin
			if ((rtE == writeregM) & regwriteM) begin
				forwardbE = 2'b10;
			end else if ((rtE == writeregW) & regwriteW) begin
				forwardbE = 2'b01;
			end
		end
	end

	// stalls  
	assign lwstallD = memtoregE & ((rtE == rsD) | (rtE == rtD));
	assign branchstallD = branchD & 
			(regwriteE & (writeregE == rsD | writeregE == rtD) |
			memtoregM & (writeregM == rsD | writeregM == rtD));

	assign stallD = lwstallD | branchstallD;
	assign stallF = stallD; // stalling D stalls all previous stages
	assign flushE = stallD; // stalling D flushes next stage

	// *** not necessary to stall D stage on store if source comes from load;
	// *** instead, another bypass network could be added from W to M
	
endmodule

