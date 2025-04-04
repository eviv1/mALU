module Arithmetic_LU(
    input [7:0] iA, // First Input
    input [7:0] iB, // Second Input
    input iClk, // Clock
    input iReset, // reset
    input [3:0] iOpCode, // Operational Code
    input iLinshiftright, // For shifting to the right
    input iLinshiftleft, // For shifting to the left
    output [7:0] oQ_leftA, // A Shifted to the left
    output [7:0] oQ_leftB, // B Shifted to the left
    output [7:0] oQ_rightA, // A Shifted to the Right
    output [7:0] oQ_rightB, // B Shifted to the Right
    output reg [7:0] oAccu, // Accumulator Output (output of the operations)
    output reg [7:0] SubPos, // Storage for positive differences
    output reg [7:0] SubNeg, // Storage for negative differences
    output reg [7:0] Equal, // If both minuend and subtrahend difference equals to zero
    output reg [7:0] oDiff, // Difference Output
    output reg oCarryFlag, // Carry Flag
    output reg oZeroFlag // Zero Flag
);

wire enLShiftA, enRShiftA, enLShiftB, enRShiftB; // To enable shifting
wire oenLShiftA, oenRShiftA, oenLShiftB, oenRShiftB;
wire enReset; // Reset
wire enCin; // Carry In Wire
wire [7:0] oADD;
wire [7:0] oADDwCarry;
wire nCarryFlagIn; // For Carry Flag
wire [7:0] oSUB; // for Subtractor

// Definition of Op Codes
// Logic Operations
`define opAND 4'b0000
`define opOR 4'b0001
`define opXOR 4'b0010
`define opNOTA 4'b0011
`define opNOTB 4'b0100

// Arithmetic Operations
`define opADD 4'b0101
`define opADDwCarry 4'b0110
`define opSUB 4'b0111

// Shift Operations
`define opShiftLeft 4'b1000
`define opShiftRight 4'b1001

// Shifting of Input A and Input B
shiftreg_right ShiftRight_A(
    .In(iA[7:0]),
    .clk(iClk),
    .reset(iReset),
    .linshiftright(iLinshiftright),
    .outQ(oQ_rightA[7:0])
);

shiftreg_right ShiftRight_B(
    .In(iB[7:0]),
    .clk(iClk),
    .reset(iReset),
    .linshiftright(iLinshiftright),
    .outQ(oQ_rightB[7:0])
);

shiftreg_left ShiftLeft_A(
    .In(iA[7:0]),
    .clk(iClk),
    .reset(iReset),
    .linshiftleft(iLinshiftleft),
    .outQ(oQ_leftA[7:0])
);

shiftreg_left ShiftLeft_B(
    .In(iB[7:0]),
    .clk(iClk),
    .reset(iReset),
    .linshiftleft(iLinshiftleft),
    .outQ(oQ_leftB[7:0])
);

// Enabling Shifting of Inputs
assign enLShiftA = (iOpCode == `opShiftLeft) ? oenLShiftA : 0;
assign enLShiftB = (iOpCode == `opShiftLeft) ? oenLShiftB : 0;
assign enRShiftA = (iOpCode == `opShiftRight) ? oenRShiftA : 0;
assign enRShiftB = (iOpCode == `opShiftRight) ? oenRShiftB : 0;

// Reset
assign enReset = (iOpCode == `opADD) ? 1 : 0;
assign nReset = iReset & enReset;

// Carry In
assign enCin = (iOpCode == `opADD) ? 1 : 0;

// 8 Bit Adder
m8BitAddition m8BitADD(
    .iA(iA[7:0]),
    .iB(iB[7:0]),
    .iC(iCin),
    .oSum(oADD),
    .oCarry(oCarry)
);

// 8 Bit Add w Carry
m8BitAddition m8BitADDwCarry(
    .iA(iA[7:0]),
    .iB(iB[7:0]),
    .iC(nAdderCin),
    .oSum(oADDwCarry[7:0]),
    .oCarry(nCarryFlagIn)
);

// Carry Flag
mCarryFlag(
    .iD(nCarryFlagIn),
    .iClock(iClk),
    .iReset(iReset),
    .oQ(nCarryFlagOut)
);

// Assignation for addition + carry input
assign nAdderCin = enCin & nCarryFlagOut;

// 8 Bit Subtractor
m8BitSubtractor m8BitSUB(
    .iA(iA[7:0]),
    .iB(iB[7:0]),
    .iC(nSubCin),
    .oDiff(oSUB[7:0]),
    .oBorrow(oBorrow)
);

// Zero Flag
always @ (oAccu)
    if (oAccu == 8'b00000000)
        oZeroFlag <= 1'b1;
    else
        oZeroFlag <= 1'b0;

// Operational Code
always @ (iA or iB or iOpCode or iReset)
begin
    case(iOpCode)
        `opAND:
            oAccu <= iA[7:0] & iB[7:0];
        `opOR:
            oAccu <= iA[7:0] | iB[7:0];
        `opXOR:
            oAccu <= iA[7:0] ^ iB[7:0];
        `opNOTA:
            oAccu <= ~iA[7:0];
        `opNOTB:
            oAccu <= ~iB[7:0];
        `opADD: begin
            oAccu <= oADD[7:0];
            oCarryFlag <= oCarry;
        end
        `opADDwCarry: begin
            oAccu <= oADDwCarry[7:0];
            oCarryFlag <= nCarryFlagOut;
        end
        `opSUB: begin
            oAccu <= oSUB[7:0];
            oCarryFlag <= oBorrow;
            
            // For Avoiding Negative Values
            SubPos <= (iA > iB) ? iA - iB : 8'b00000000;
            SubNeg <= (iA < iB) ? 8'b00000000 : 8'b00000000; // Use 0 for indeterminate
            Equal <= (iA == iB) ? 8'b00000000 : 8'b00000000;
            oDiff <= (SubPos[7:0] | Equal[7:0]);
        end
        default:	
            oAccu <= 8'b00000000;
    endcase
	 end

endmodule

