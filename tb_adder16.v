`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ritik Kumar Tiwari
// 
// Create Date: 11/08/2025 08:07:38 PM
// Design Name: 16-bit Ripple Carry Adder
// Module Name: tb_adder16
// Project Name: 16-bit Adder (Structural Model)
// Target Devices: Artix-7 (for simulation)
// Tool Versions: Vivado 2023.x
// Description: Testbench to verify functionality of 16-bit adder
// 
// Dependencies: adder16.v (includes adder4 and fulladder)
// 
// Revision 0.01 - File Created
// Additional Comments: 
// This testbench applies various input patterns to the 16-bit adder
// and displays the output sum and flag values (sign, carry, zero, parity, overflow).
//////////////////////////////////////////////////////////////////////////////////

module tb_adder16;
    // Input stimulus
    reg [15:0] x, y;          // 16-bit operands for addition

    // Output wires from DUT (Device Under Test)
    wire [15:0] z;            // 16-bit sum output
    wire S;                   // Sign flag
    wire ZR;                  // Zero flag
    wire CY;                  // Carry flag
    wire P;                   // Parity flag
    wire V;                   // Overflow flag

    // Instantiate the 16-bit adder module (DUT)
    adder16 ADD (x, y, z, S, ZR, CY, P, V);

    // Apply test vectors
    initial begin
        // Monitor will continuously display signals whenever they change
        $monitor($time, " ns  x=%h  y=%h  z=%h  S=%b  CY=%b  ZR=%b  P=%b  V=%b",
                  x, y, z, S, CY, ZR, P, V);
        
        // Test cases
        #5  x = 16'h8FFF; y = 16'h8000;   // Negative + Negative
        #5  x = 16'h8AFF; y = 16'h0002;   // Negative + Small positive
        #5  x = 16'hFFFE; y = 16'hA000;   // Large + Negative
        #5  x = 16'hAAAA; y = 16'h5555;   // Alternating bits
        #5  x = 16'h8FFF; y = 16'h7700;   // Random pattern
        #5  $finish;                      // End simulation
    end
endmodule
