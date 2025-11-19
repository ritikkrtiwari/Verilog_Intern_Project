`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2025 01:37:07 AM
// Design Name: 
// Module Name: cyclic_lamp
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


//module cyclic_lamp( clock,light);
//input clock;
//output reg [2:0] light;

//parameter s0=0, s1=1, s2=2;
//parameter RED=3'b100, GREEN=3'b010, YELLOW=3'b001;
//reg [1:0] state;

//always @(posedge clock)
//case (state)
//    s0: begin
//        light <= GREEN;   // light bhi flop me store ho rahi hai
//        state <= s1;      // next state
//    end
    
//    s1: begin
//        light <= YELLOW;
//        state <= s2;
//    end
    
//    s2: begin
//        light <= RED;
//        state <= s0;
//    end
    
//    default: begin
//        light <= RED;
//        state <= s0;
//    end
//endcase
    
//endmodule


module cyclic_lamp( clock,light);
input clock;
output reg [2:0] light;
parameter s0=0,s1=1,s2=2;
parameter RED=3'b100,GREEN=3'b010,YELLOW=3'b001;
reg [1:0] state;

always @(posedge clock)
case (state)
    s0:state<=s1;
    s1:state<=s2;
    s2:state<=s0;
    default : state<=s0;
endcase

always @ (state)
    case(state)
        s0:light=RED;
        s1:light=GREEN;
        s2:light=YELLOW;
        default:light=RED; 
    endcase
    
endmodule
