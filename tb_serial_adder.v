`timescale 1ns / 1ps

`timescale 1ns/1ps

module tb_serial_adder();

    reg clk, reset, a, b;
    wire sum;

    serial_adder DUT (clk, reset, a, b, sum);

    reg [3:0] A = 4'b0110;
    reg [3:0] B = 4'b0010;

    integer i;

    // Generate clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $display("\n*** SERIAL ADDER TEST START ***\n");

        reset = 1;
        #10;
        reset = 0;

        for (i = 0; i < 4; i = i + 1) begin
            a = A[i];        // LSB first
            b = B[i];
            #10;
            $display("Bit %0d:  A=%b  B=%b  SUM=%b  CARRY_STATE=%b", 
                       i, a, b, sum, DUT.PS);
        end

        #20;
        $display("\n*** TEST COMPLETE ***\n");
        $stop;
    end

endmodule
