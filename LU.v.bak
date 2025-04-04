module LU (inA, inB, accumulator, opcode, zero_flag);

input [7:0] inA, inB, opcode;
output reg [7:0] accumulator;
output reg zero_flag;

always @(inA or inB or opcode) 
begin
    zero_flag = 1'b0;

    if (opcode == 8'b00000000) 
	 begin
        // 0000 - AND
        accumulator <= inA & inB;
    end
    else if (opcode == 8'b00000001) 
	 begin
        // 0001 - OR
        accumulator <= inA | inB;
    end
    else if (opcode == 8'b00000010) 
	 begin
        // 0010 - XOR
        accumulator <= inA ^ inB;
    end
    else if (opcode == 8'b00000011) 
	 begin
        // 0011 - NOT A
        accumulator <= ~inA;
    end
    else if (opcode == 8'b00000100) 
	 begin
        // 0100 - NOT B
        accumulator <= ~inB;
    end
    else begin
        // Default case for unknown opcode
        accumulator <= 8'b00000000;
    end

    if (accumulator == 8'b00000000) 
	 begin
        zero_flag = 1'b1;
    end
    else 
	 begin
        zero_flag = 1'b0;
    end
end

endmodule
	
	