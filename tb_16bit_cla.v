`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2025 03:55:41 AM
// Design Name: 
// Module Name: tb_16bit_cla
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
// Testbench for 16-bit Carry Look-Ahead Adder
//=============================================================
`timescale 1ns/1ps

module tb_cla16;

    reg  [15:0] A, B;   // Inputs to DUT
    reg         Cin;
    wire [15:0] S;      // Output sum
    wire        Cout;   // Output carry

    // ---------------------------------------------------------
    // DUT (Device Under Test)
    // ---------------------------------------------------------
    cla16 dut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S),
        .Cout(Cout)
    );

    // ---------------------------------------------------------
    // Stimulus
    // ---------------------------------------------------------
    initial begin
        $monitor($time,
                 " | A=%h  B=%h  Cin=%b  ->  S=%h  Cout=%b",
                 A, B, Cin, S, Cout);

        Cin = 0;

        #5  A = 16'h1234; B = 16'h1001;
        #5  A = 16'hFFFF; B = 16'h0001;   // Overflow case
        #5  A = 16'h0F0F; B = 16'h00FF;
        #5  A = 16'hAAAA; B = 16'h5555;   // Alternating bits
        #5  $finish;
    end

endmodule

