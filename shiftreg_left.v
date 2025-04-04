module shiftreg_left(
    input [7:0] In,
    input clk,
    input reset,
    input linshiftleft,
    output reg [7:0] outQ
);

always @(posedge clk or negedge reset) begin
    if (reset == 1'b0) begin
        outQ <= 8'b00000000;  
    end
    else if (linshiftleft == 1'b1) begin
        outQ <= outQ << 1;  
    end
    else begin
        outQ <= In;  
    end
end

endmodule