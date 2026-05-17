`include "defines.v"

`default nettype none

module alu #(
    parameter BIT_WIDTH_REG = 8
)(
    input  wire [BIT_WIDTH_REG-1:0] in1,
    input  wire [BIT_WIDTH_REG-1:0] in2,
    input  wire [2:0]               op,
    output reg  [BIT_WIDTH_REG-1:0] out,
    output reg                      c
);


    reg [BIT_WIDTH_REG:0] temp_sum;


// ALL the operations ALU_NOT, ALU_AND, ALU_OR, ALU_ADD, ALU_SUB, ALU_XOR, ALU_INC, and ALU_DEC are from the defines.v file . 
    always @(*) begin
        case(op)
            `ALU_NOT: begin
                out = ~in1;
                c   = 1'b0;
                temp_sum = 9'bX;
            end
            `ALU_AND: begin
                out = in1 & in2;
                c   = 1'b0;
                temp_sum = 9'bX;
            end
            `ALU_OR: begin
                out = in1 | in2;
                c   = 1'b0;
                temp_sum = 9'bX;
            end
            `ALU_ADD: begin
                temp_sum = {1'b0, in1} + {1'b0, in2};
                out      = temp_sum[BIT_WIDTH_REG-1:0];
                c        = temp_sum[BIT_WIDTH_REG]; // 9th bit is the carry
            end
            `ALU_SUB: begin
                out = in1 - in2;
                c   = (in1 < in2); // Borrow flag goes high if subtracting a larger number
                temp_sum = 9'bX;
            end
            `ALU_XOR: begin
                out = in1 ^ in2;
                c   = 1'b0;
                temp_sum = 9'bX;
            end
            `ALU_INC: begin
                out = in1 + 1'b1;
                c   = (in1 == 8'hFF); // Carry goes high if we roll over from 255 to 0
                temp_sum = 9'bX;
            end
            `ALU_DEC: begin
                out = in1 - 1'b1;
                c   = (in1 == 8'h00); // Borrow goes high if we roll under from 0 to 255
                temp_sum = 9'bX;
            end
            default: begin
                out = {BIT_WIDTH_REG{1'b0}};
                c   = 1'b0;
                temp_sum = 9'bX;
            end
        endcase
    end

endmodule


