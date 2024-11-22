`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/14 21:45:13
// Design Name: 
// Module Name: C_Multiplier
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


module C_Multiplier(a, b, p);
    input [3:0] a, b;
    output [7:0] p;
    
    wire [3:0] m0, m1, m2, m3;
    wire [7:0] s1, s2, s3;
    
    assign m0 = a & {4{b[0]}};
    assign m1 = a & {4{b[1]}};
    assign m2 = a & {4{b[2]}};
    assign m3 = a & {4{b[3]}};
    

    assign s1 = {m1, 1'b0} + {4'b0, m0}; 
    assign s2 = {m2, 2'b00} + s1;
    assign s3 = {m3, 3'b000} + s2;
    
    assign p = s3;
    
endmodule