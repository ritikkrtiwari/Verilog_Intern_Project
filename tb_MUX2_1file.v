`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2025 01:05:33 AM
// Design Name: 
// Module Name: tb_MUX2_1file
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


`timescale 1ns/1ps

module tb_MUX2_1file;

    // Testbench variables
    reg a;
    reg b;
    reg sel;
    wire dout;

    // Instantiate the DUT (Design Under Test)
    MUX2_1file uut (
        .a(a),
        .b(b),
        .sel(sel),
        .dout(dout)
    );

    initial begin
        // Display header
        $display("Time\ta b sel | dout");

        // Monitor values
        $monitor("%0t\t%b %b  %b  |  %b", $time, a, b, sel, dout);

        // Apply different test vectors
        a=0; b=0; sel=0; #10;
        a=0; b=0; sel=1; #10;
        a=1; b=0; sel=0; #10;
        a=1; b=0; sel=1; #10;
        a=0; b=1; sel=0; #10;
        a=0; b=1; sel=1; #10;
        a=1; b=1; sel=0; #10;
        a=1; b=1; sel=1; #10;

        // Finish simulation
        $finish;
    end

endmodule

