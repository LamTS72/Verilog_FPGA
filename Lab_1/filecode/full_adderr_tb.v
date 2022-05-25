`timescale 1ns / 1ns 
module full_adder_tb; 
wire t_sum, t_carry; 
reg t_a, t_b, t_c; 
full_adder uut(.a(t_a), .b(t_b), .cin(t_c), .sum(t_sum), .cout(t_carry)); 
initial begin
   $monitor("time=",$time,, "A=%b B=%b Cin=%b : Sum=%b Cout=%b",t_a,t_b,t_c,t_sum,t_carry); 
end
initial begin 
// 1 
t_a = 1'b0; 
t_b = 1'b0; 
t_c = 1'b0;
#5 //2 
t_a = 1'b0; 
t_b = 1'b0; 
t_c = 1'b1;
#5 //3 
t_a = 1'b0; 
t_b = 1'b1; 
t_c = 1'b0;
#5 //4 
t_a = 1'b0; 
t_b = 1'b1; 
t_c = 1'b1;
#5 //5 
t_a = 1'b1; 
t_b = 1'b0; 
t_c = 1'b0;
#5 //6 
t_a = 1'b1; 
t_b = 1'b0; 
t_c = 1'b1;
#5 //7 
t_a = 1'b1; 
t_b = 1'b1; 
t_c = 1'b0;
#5 //8
t_a = 1'b1; 
t_b = 1'b1; 
t_c = 1'b1;
end 
endmodule