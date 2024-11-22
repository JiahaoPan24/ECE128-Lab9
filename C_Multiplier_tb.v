`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/14 22:00:19
// Design Name: 
// Module Name: C_Multiplier_tb
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


module C_Multiplier_tb();
reg [3:0] a;
reg [3:0] b;
wire [7:0] p;

C_Multiplier uut(a, b, p);

initial begin
    #2 
    a = 4'b0000;
    b = 4'b0000;
    #20
    a = 4'b0011;
    b = 4'b0010;
    #30
    $stop;
    end
endmodule