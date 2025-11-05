`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2025 08:07:24 PM
// Design Name: 
// Module Name: tb_mux16to1
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

//=============================================================
// Testbench for 16-to-1 Multiplexer (tb_mux16to1)
//=============================================================

module tb_mux16to1;

    // Declare test signals
    reg [15:0] A;   // 16-bit input bus for MUX (in)
    reg [3:0]  S;   // 4-bit select line for MUX (sel)
    wire F;         // Output wire from MUX (out)

    // Instantiate the Design Under Test (DUT)
    // Connect testbench signals to the MUX module
    mux16to1 M (.in(A), .sel(S), .out(F));

    // Test sequence
    initial
    begin
        // Display signal values whenever they change during simulation
        $monitor($time, "  A = %h  S = %h  F = %b", A, S, F);

        // Apply different test vectors with delays
        #5  A = 16'h3F0A;  S = 4'h0;   // After 5 ns, set A and S=0
        #5  S = 4'h6;                 // After 10 ns, select input 6
        #5  S = 4'hC;                 // After 15 ns, select input 12
        #5  $finish;                  // End simulation after 20 ns
    end
// wave from look like
 //0  A=xxxx  S=x  F=x
 //5  A=3f0a  S=0  F=0
 //10 A=3f0a  S=6  F=0
 //15 A=3f0a  S=c  F=1
endmodule
