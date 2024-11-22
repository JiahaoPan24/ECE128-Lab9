`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/12 14:56:20
// Design Name: 
// Module Name: S_Multi
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module S_Multi(
    input clk,
    input reset,
    input [3:0] multiplicand,
    input [3:0] multiplier,
    output reg [7:0] product
);


parameter S0_idle = 0, S1_multiply = 1, S2_update_result = 2, S3_done = 3;
reg [2:0] CS, NS;
reg [7:0] partial_product;
reg [3:0] shift_count;
reg [3:0] operand_aa, operand_bb;

always @(*) begin
    NS = CS;
    case (CS)
        S0_idle: begin
            NS = S1_multiply;
        end

        S1_multiply: begin
            if (shift_count < 4)
                NS = S2_update_result;
            else
                NS = S3_done;
        end

        S2_update_result: begin
            if (shift_count == 4)
                NS = S3_done;
            else
                NS = S1_multiply;
        end

        S3_done: NS = S0_idle;

        default: NS = S0_idle;
    endcase
end

always @(posedge clk or posedge reset) begin
    if (reset) 
        begin
        CS <= S0_idle;
        partial_product <= 8'b0;
        shift_count <= 4'b0;
        operand_aa <= multiplicand;
        operand_bb <= multiplier;
        product <= 8'b0;
        end 
    else begin
        CS <= NS;
        case (CS)
            S0_idle: begin
                partial_product <= 8'b0;
                shift_count <= 4'b0;
                operand_aa <= multiplicand;
                operand_bb <= multiplier;
            end
            
            S1_multiply: begin
                if (operand_bb[0] == 1'b1) begin
                    partial_product <= partial_product + operand_aa;
                    operand_aa <= operand_aa << 1;
                end
                operand_bb <= operand_bb >> 1;
                shift_count <= shift_count + 1;
            end
            
            S2_update_result: begin
                if (shift_count == 4)
                    product <= partial_product;
            end
            
            S3_done: begin
            end
        endcase
    end
end
endmodule

