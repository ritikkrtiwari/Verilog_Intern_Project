`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/31/2025 11:49:30 PM
// Design Name: 
// Module Name: MUX2_1file
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


module MUX2_1file(
    input a,
    input b,
    input sel,
    output reg dout
    );
    
    always @(*)
    begin
    if(sel)
        dout = b;
    else
        dout = a;
    end    
endmodule
