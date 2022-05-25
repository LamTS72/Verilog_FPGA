`timescale 1ns / 1ps

module clock_divider_tb;
 // Inputs
 reg clock_in;
 // Outputs
 wire clock_out;
 // Instantiate the Unit Under Test (UUT)
 // Test the clock divider in Verilog
 Clock_divider uut (.clk(clock_in), .c_out(clock_out)
 );
 initial begin
  // Initialize Inputs
  clock_in = 0;
  // create input clock 125MHz
        forever #100 clock_in = ~clock_in;
 end
      
endmodule