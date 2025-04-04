module mHalfSubtractor(
	input iA,
	input iB, 
	output oDiff, 
	output oBorrow
	);

assign oBorrow = ~iA & iB;
assign oDiff = iA ^ iB;

endmodule
