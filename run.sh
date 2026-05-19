#!/bin/bash
echo "Compiling and running standalone module simulation..."
# iverilog -g2012 -I src -o test/sim.vvp src/project.v test/tb.v   # PATH CHANGES HERE
iverilog -g2012 -I src -o test/sim.vvp src/basics-modules/basic-module1.v src/basics-testbenches/basic-testbench1.v

# note that for different files, the test bench and module arguments will change.

vvp test/sim.vvp
echo "Done! Click on the .vcd file to view waveforms."



# NOTE- > to run this , run these commands on the github codespace terminal by creating a codespace terminal on this branch.
# cd test/ 
# bash run.sh 