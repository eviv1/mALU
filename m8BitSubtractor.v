module m8BitSubtractor( 
    input [7:0] iA,     // 4-bit Minuend
    input [7:0] iB,     // 4-bit Subtrahend
    input [7:0] iC,     // 4-bit Borrow-in
    output [7:0] oDiff, // 4-bit Difference
    output oBorrow,     // Final Borrow-out
    output ZeroFlag    // Zero Flag
);
    wire [7:0] Borrow;

    // Instantiate 1-bit subtracters for each bit
    mFullSubtractor FullSubtractor_0 (
        .iA(iA[0]), 
        .iB(iB[0]), 
        .iC(1'b0),   // No initial borrow for the least significant bit
        .oDiff(oDiff[0]), 
        .oBorrow(Borrow[0])
    );
    mFullSubtractor FullSubtractor_1 (
        .iA(iA[1]), 
        .iB(iB[1]), 
        .iC(Borrow[0]),  // Borrow from previous stage
        .oDiff(oDiff[1]), 
        .oBorrow(Borrow[1])
    );
    mFullSubtractor FullSubtractor_2 (
        .iA(iA[2]), 
        .iB(iB[2]), 
        .iC(Borrow[1]),  // Borrow from previous stage
        .oDiff(oDiff[2]), 
        .oBorrow(Borrow[2])
    );
    mFullSubtractor FullSubtractor_3 (
        .iA(iA[3]), 
        .iB(iB[3]), 
        .iC(Borrow[2]),  // Borrow from previous stage
        .oDiff(oDiff[3]), 
        .oBorrow(Borrow[3])  // Final borrow output
    );
	 
    mFullSubtractor FullSubtractor_4 (
        .iA(iA[4]), 
        .iB(iB[4]), 
        .iC(Borrow[4]),  // Borrow from previous stage
        .oDiff(oDiff[4]), 
        .oBorrow(Borrow[4])  // Final borrow output
    );	 
	 
    mFullSubtractor FullSubtractor_5 (
        .iA(iA[5]), 
        .iB(iB[5]), 
        .iC(Borrow[5]),  // Borrow from previous stage
        .oDiff(oDiff[5]), 
        .oBorrow(Borrow[5])  // Final borrow output
    );
	 
    mFullSubtractor FullSubtractor_6 (
        .iA(iA[6]), 
        .iB(iB[6]), 
        .iC(Borrow[6]),  // Borrow from previous stage
        .oDiff(oDiff[6]), 
        .oBorrow(Borrow[6])  // Final borrow output
    );
	 
	 
    mFullSubtractor FullSubtractor_7 (
        .iA(iA[7]), 
        .iB(iB[7]), 
        .iC(Borrow[6]),  // Borrow from previous stage
        .oDiff(oDiff[7]), 
        .oBorrow(oBorrow)  // Final borrow output
    );

    // Zero Flag: True if all difference bits are zero
    assign ZeroFlag = ~(|oDiff);


endmodule 