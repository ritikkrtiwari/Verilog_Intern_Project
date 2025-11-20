`timescale 1ns / 1ps
module serial_adder (
    input clk,
    input reset,
    input a,
    input b,
    output reg sum
);
    parameter ZERO = 1'b0; // carry = 0
    parameter ONE  = 1'b1; // carry = 1

    reg PS, NS;
    // State update on clock
    always @(posedge clk or posedge reset) begin
        if (reset)
            PS <= ZERO;
        else
            PS <= NS;
    end
    // Next-state and output logic (Mealy)
    always @(PS, a, b) begin
        case (PS)

            ZERO: begin
                sum = a ^ b;              // carry = 0 => sum = a xor b
                if (a & b)
                    NS = ONE;             // 1+1 = carry
                else
                    NS = ZERO;            // no carry
            end

            ONE: begin
                sum = a ^ b ^ 1'b1;       // carry = 1
                if ((a & b) | (a ^ b))
                    NS = ONE;             // carry remain 1
                else
                    NS = ZERO;            // carry removed
            end

        endcase
    end

endmodule

