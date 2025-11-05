`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: OWN PROJECT
// Engineer: RITIK KUMAR TIWARI
// 
// Create Date: 11/05/2025 07:21:02 PM
// Design Name: Structural Design
// Module Name: mux16to1
// Project Name: 16 to 1 Mux using Structural Modelling
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

//-----------------------------//
// 2-to-1 Multiplexer Module
//-----------------------------//

module mux2to1
(
    input [1:0] in, //two input lines
    input sel,//select lines
    output out //output
    );
    wire t1,t2,t3; //internal connections
    
    not G1(t1,sel); //t1=NOT(sel)
    and G2(t2,in[0],t1); // t2 = in[0] AND NOT(sel)
    and G3(t3,in[1],sel); //// t3 = in[1] AND sel
    or G4(out,t2,t3); // out = t2 OR t3
    
endmodule


//-----------------------------//
// 4-to-1 Multiplexer Module
//-----------------------------//


module mux4to1(in,sel,out);
    input[3:0] in; // 4 input lines
    input[1:0] sel; // 2-bit select line
    output out; // 1 output line
    wire [1:0] t; // internal wires to connect between muxes
    
    // Instantiate two 2-to-1 muxes for first stage and one for final stage    
    mux2to1 M0 (in[1:0],sel[0],t[0]); // Select between in[0] and in[1] → output t[0]
    mux2to1 M1 (in[3:2],sel[0],t[1]); // Select between in[2] and in[3] → output t[1]
    mux2to1 M2 (t,sel[1],out);  // Select between t[0] and t[1] → final output
        
endmodule

//-----------------------------//
// 16-to-1 Multiplexer Module
//-----------------------------//

module mux16to1(in,sel,out);
input [15:0] in; // 16 input lines
input [3:0] sel; // 4-bit select line
output out; // 1 output line
wire[3:0]t; // internal outputs from 4-to-1 muxes

// Instantiate four 4-to-1 muxes for first stage
    mux4to1 M0 (in[3:0],   sel[1:0], t[0]);   // handles inputs 0-3
    mux4to1 M1 (in[7:4],   sel[1:0], t[1]);   // handles inputs 4-7
    mux4to1 M2 (in[11:8],  sel[1:0], t[2]);   // handles inputs 8-11
    mux4to1 M3 (in[15:12], sel[1:0], t[3]);   // handles inputs 12-15

    // Final stage: one 4-to-1 mux selects among outputs of M0-M3
    mux4to1 M4 (t, sel[3:2], out);
    
endmodule
