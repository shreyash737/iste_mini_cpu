// testbench will be written here

`timescale 1ns / 1ps

module basic_testbench1;
    reg a;
    reg b;
    wire sum;
    wire carry;

    firstmodule uut (
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );

    initial begin
        $dumpfile("basics_sim.vcd"); 
        $dumpvars(0, basic_testbench1); 

        $display("time\ta\tb\tsum\tcarry");
        $monitor("%0dns\t%b\t%b\t%b\t%b", $time, a, b, sum, carry);

        a = 0; b = 0;
        #10;
        a = 0; b = 1;
        #10;
        a = 1; b = 0;
        #10;
        a = 1; b = 1;
        #10;

        $finish;
    end
endmodule