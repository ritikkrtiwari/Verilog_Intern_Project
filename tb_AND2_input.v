`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/03/2025 07:03:02 PM
// Design Name: 
// Module Name: tb_AND2_input
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

module tb_AND2_input;
    //Input
    reg a; //here we take input in testbench code as reg 
    reg b;
    
    //output
    wire c; //we take output as wire in test bench
    
    //Instantiate the unit under test (UUT)
    AND2_input uut(
    .a(a), // here ".a" means "a" from the AND2_input file and "(a)" means "a" of tb_AND2_input because we can not write module inside the module so wi intantiate it.
    .b(b),
    .c(c)
    );   
    
    initial begin
    //Initialize input
    a=0;
    b=0;
    // Monitor changes
        $monitor("Time=%0d: a=%b b=%b c=%b", $time, a, b, c);
    
    //some certain delay keep changing the value of a and b and that is done by "#"
        #10; a=0; b=0;
        #10; a=0; b=1;
        #10; a=1; b=0;
        #10; a=1; b=1;
        #10; // wait extra time to see last output
         $finish; // end simulation  
           
    end
endmodule
