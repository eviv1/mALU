module mFullAdder(input iA, input iB, input iC, output oSum, output oCarry);

    wire n1, n2, n3;

    mHalfAdder HalfAdder_0(
        .iA(iA), 
        .iB(iB), 
        .oSum(n1), 
        .oCarry(n2)
    );
    mHalfAdder HalfAdder_1(
        .iA(n1), 
        .iB(iC), 
        .oSum(oSum),
		  .oCarry(n3)
    );

    assign oCarry = n2 | n3;
endmodule
