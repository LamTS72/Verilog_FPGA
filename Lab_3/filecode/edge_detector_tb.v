`timescale 1ns / 1ps

module edge_detector_tb;
	reg sig;
	reg clk, rst;
	wire raising_edge;
	
	edge_detector ped0(sig, clk, rst, raising_edge);

	always #5 clk = ~clk;           
	
	// Drive stimulus to the design
	initial begin
		clk <= 0;
		sig <= 0;
		rst <= 1;
		#6 rst <= 0;
		#13 sig <= 1;
		#28 sig <= 0;
		#13 sig <= 1;
		#18 sig <= 0;
		#18 $finish;
	end	
endmodule
