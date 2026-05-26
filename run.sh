#!/bin/bash
echo "Compiling and running standalone module simulation..."
# iverilog -g2012 -I src -o test/sim.vvp src/project.v test/tb.v   # PATH CHANGES HERE

# make sure to be in the root directory of the project. Else paths will be different.
iverilog -g2012 -I src -o src/basic-test/sim.vvp src/basics-modules/basic-module1.v src/basics-testbenches/basic-testbench1.v

# note that for different files, the test bench and module arguments will change.

vvp src/basic-test/sim.vvp
echo "Done! Click on the .vcd file to view waveforms."


# USE THE ABOVE COMMANDS TO compile and run the simulation


