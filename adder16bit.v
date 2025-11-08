//===========================================================
// 16-bit Ripple Carry Adder using Structural Modeling
// Designed by: Ritik Kumar Tiwari
//===========================================================

//-----------------------------------------------------------
// 1. Full Adder Module (1-bit adder)
//-----------------------------------------------------------
module fulladder(s, cout, a, b, c);
    input a, b, c;          // a, b = input bits; c = carry-in
    output s, cout;         // s = sum, cout = carry-out
    wire s1, c1, c2;        // internal wires for partial results

    // Logic implementation using gates
    xor G1(s1, a, b);       // First XOR gives partial sum
    xor G2(s, s1, c);       // Second XOR adds carry-in
    and G3(c1, a, b);       // AND for first carry term
    and G4(c2, s1, c);      // AND for second carry term
    or  G5(cout, c1, c2);   // OR combines carry terms for final carry-out
endmodule


//-----------------------------------------------------------
// 2. 4-bit Ripple Carry Adder (using 4 Full Adders)
//-----------------------------------------------------------
module adder4(s, cout, A, B, Cin);
    input [3:0] A, B;       // 4-bit input operands
    input Cin;               // Carry-in for the 4-bit block
    output [3:0] s;          // 4-bit sum output
    output cout;             // Carry-out of the 4-bit block
    wire c1, c2, c3;         // Internal carry signals between full adders

    // Instantiate 4 full adders, each adds one bit
    fulladder FA0 (s[0], c1, A[0], B[0], Cin);   // LSB adder
    fulladder FA1 (s[1], c2, A[1], B[1], c1);    // Next bit
    fulladder FA2 (s[2], c3, A[2], B[2], c2);    // Next bit
    fulladder FA3 (s[3], cout, A[3], B[3], c3);  // MSB adder
endmodule


//-----------------------------------------------------------
// 3. 16-bit Ripple Carry Adder (using 4 adder4 modules)
//-----------------------------------------------------------
module adder16(x, y, z, sign, zero, carry, parity, overflow);
    input [15:0] x, y;       // 16-bit input operands
    output [15:0] z;         // 16-bit sum output
    output sign, zero, carry, parity, overflow; // Status flags
    wire [3:1] c;            // Internal carry wires between 4-bit blocks

    // Generate status flags based on result 'z'
    assign sign = z[15];                           // Sign bit (MSB of result)
    assign zero = ~|z;                             // Zero flag (1 if z = 0)
    assign parity = ~^z;                           // Parity flag (1 if even number of 1's)
    assign overflow = (x[15] & y[15] & ~z[15]) |   // Overflow detection for signed addition
                      (~x[15] & ~y[15] & z[15]);

    // Instantiate four 4-bit adders to create a 16-bit adder
    adder4 A0 (z[3:0],   c[1],  x[3:0],   y[3:0],   1'b0);   // Bits [3:0]
    adder4 A1 (z[7:4],   c[2],  x[7:4],   y[7:4],   c[1]);   // Bits [7:4]
    adder4 A2 (z[11:8],  c[3],  x[11:8],  y[11:8],  c[2]);   // Bits [11:8]
    adder4 A3 (z[15:12], carry, x[15:12], y[15:12], c[3]);   // Bits [15:12]
endmodule
