module mCarryFlag(input iD,
			input iClock,
			input iReset,
			output reg oQ);

always @ (posedge iClock or negedge iReset)
begin
	if(iReset == 1'b0)
		oQ <= 1'b0;
	else
		oQ <= iD;
end

endmodule