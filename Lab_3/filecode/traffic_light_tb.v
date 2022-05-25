`timescale 1ns / 1ps


module traffic_light_tb;
// Inputs
 reg clock_in;
 reg rst;
 // Outputs
 wire ledb1,ledb2,ledg1,ledg2,ledr1,ledr2;
 // Instantiate the Unit Under Test (UUT)
 // Test the clock divider in Verilog
 traffic_light uut (.clk(clock_in), .rst(rst), 
 .ledb1(ledb1), .ledb2(ledb2), .ledg1(ledg1), 
 .ledg2(ledg2), .ledr1(ledr1), .ledr2(ledr2));
 
initial
 begin
     clock_in=1'b0;
     forever #(100) clock_in=~clock_in;
 end
 //    initial
 //    $stop;//to add ps
 initial
 begin
     rst=0;
     #100;
     rst=1;
     #100;
     rst=0;
     #(100);
     $finish;
     end
      
endmodule

