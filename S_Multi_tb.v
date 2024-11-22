`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/12 15:53:30
// Design Name: 
// Module Name: S_Multi_tb
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


module S_Multi_tb();
reg clk;
reg reset;
reg [3:0] A;
reg [3:0] B;
wire [7:0] product;

S_Multi uut(clk, reset, A, B, product);

always 
begin
    #2 clk = ~clk;
end

initial begin
    // Initialize signals
    clk = 0;
    #10 reset = 0;
    #10 reset = 1;
    #10 reset = 0;
    #10 A = 4'b0000;
    B = 4'b0000;
    #100 A = 4'b0011;
    B = 4'b0010;
    #100 A = 4'b0101;
    B = 4'b0100;
    #300 reset = 1;
    #100
    $stop;
    end
endmodule
