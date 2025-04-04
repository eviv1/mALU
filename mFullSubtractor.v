module mFullSubtractor(input iA, input iB, input iC, output oDiff, output oBorrow);

    wire n1, n2, n3;

    mHalfSubtractor HalfSub_0(
        .iA(iA), 
        .iB(iB), 
        .oDiff(n1), 
        .oBorrow(n2)
    );
    mHalfSubtractor HalfSub_1(
        .iA(n1), 
        .iB(iC), 
        .oDiff(oDiff), 
        .oBorrow(n3)
    );

    assign oBorrow = n2 | n3;
endmodule
