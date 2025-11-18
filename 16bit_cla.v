`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2025 03:54:22 AM
// Design Name: 
// Module Name: 16bit_cla
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
// 4-bit Carry Look-Ahead Adder (Base Block)
//=============================================================
module cla4(
    input  [3:0] A, B,     // 4-bit inputs
    input        Cin,      // Input carry
    output [3:0] S,        // 4-bit Sum Output
    output       Cout      // Carry out
);

    // Internal generate (G) and propagate (P) logic signals
    wire [3:0] G, P;

    // Internal carries for bit1, bit2, bit3
    wire c1, c2, c3;

    // ---------------------------------------------------------
    // Generate (G) and Propagate (P) signals
    // G[i] = A[i] & B[i]
    // P[i] = A[i] ^ B[i]
    // ---------------------------------------------------------
    assign G = A & B;
    assign P = A ^ B;

    // ---------------------------------------------------------
    // Carry Look-Ahead Logic
    // c1 = G0 + P0*Cin
    // c2 = G1 + P1*G0 + P1*P0*Cin
    // c3 = G2 + P2*G1 + P2*P1*G0 + P2*P1*P0*Cin
    // Cout = G3 + P3*c3
    // ---------------------------------------------------------
    assign c1   = G[0] | (P[0] & Cin);
    assign c2   = G[1] | (P[1] & G[0]) | (P[1] & P[0] & Cin);
    assign c3   = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) |
                             (P[2] & P[1] & P[0] & Cin);
    assign Cout = G[3] | (P[3] & c3);

    // ---------------------------------------------------------
    // Sum Generation
    // S[i] = P[i] XOR Carry(i)
    // ---------------------------------------------------------
    assign S[0] = P[0] ^ Cin;
    assign S[1] = P[1] ^ c1;
    assign S[2] = P[2] ^ c2;
    assign S[3] = P[3] ^ c3;

endmodule

//=============================================================
// 16-bit Carry Look-Ahead Adder using four 4-bit CLA blocks
//=============================================================
module cla16(
    input  [15:0] A, B,   // 16-bit operands
    input         Cin,    // External carry input
    output [15:0] S,      // 16-bit sum output
    output        Cout    // Final carry out
);

    // Internal carry wires between 4-bit blocks
    wire c1, c2, c3;

    // ---------------------------------------------------------
    // Four 4-bit CLA blocks connected in cascade
    // ---------------------------------------------------------
    cla4 C0 (A[3:0],   B[3:0],   Cin, S[3:0],   c1);   // Block0
    cla4 C1 (A[7:4],   B[7:4],   c1,  S[7:4],   c2);   // Block1
    cla4 C2 (A[11:8],  B[11:8],  c2,  S[11:8],  c3);   // Block2
    cla4 C3 (A[15:12], B[15:12], c3,  S[15:12], Cout); // Block3

endmodule

