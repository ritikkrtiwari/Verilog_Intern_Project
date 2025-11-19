`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2025 01:45:34 AM
// Design Name: 
// Module Name: test_cyclic_lamp
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


module test_cyclic_lamp;
reg clk;
wire [2:0] light;

cyclic_lamp LAMP(clk ,light);

always #5 clk=~clk;

initial
    begin
    clk=1'b0;
    #100 $finish;
    end
    
 initial 
        begin
        $monitor($time,"RGY:%b",light);
        end
endmodule
