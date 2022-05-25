`timescale 1ns / 1ps

module ripple_adder_4bit_tb;
// Inputs
 reg [3:0] t_a;
 reg [3:0] t_b;
 reg t_cin;
 // Outputs
 wire [3:0] t_sum;
 wire t_cout;
 ripple_adder_4bit uut(.a(t_a), .b(t_b), .cin(t_cin), .sum(t_sum), .cout(t_cout));
 initial begin
   // Initialize Inputs
   t_a = 0;
   t_b = 0;
   t_cin = 0;
   // Wait 100 ns for global reset to finish
   #100;        
   // Add stimulus here
   t_a=4'b0001;t_b=4'b0000;t_cin=1'b0;
   #10 t_a=4'b1010;t_b=4'b0011;t_cin=1'b0;
   #10 t_a=4'b1101;t_b=4'b1010;t_cin=1'b1;
  end 
  initial begin
   $monitor("time=",$time,, "A=%b B=%b Cin=%b : Sum=%b Cout=%b",t_a,t_b,t_cin,t_sum,t_cout); 
  end
endmodule
