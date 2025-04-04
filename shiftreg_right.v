module shiftreg_right(
    input [7:0] In,
    input clk,
    input reset,
    input linshiftright,
    output reg [7:0] outQ
);

always @(posedge clk or negedge reset) begin
    if (reset == 1'b0) begin
        outQ <= 8'b00000000;  
    end
    else if (linshiftright == 1'b1) begin
        outQ <= outQ >> 1;  
    end
    else begin
        outQ <= In;  
    end
end

endmodule