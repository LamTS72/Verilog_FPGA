`timescale 1ns / 1ps



module full_adder(a, b, cin, sum, cout);
input a, b, cin;
output sum, cout;
wire c1, c2, s1;

half_adder PARTSUM(a, b, s1, c1);
half_adder SUM(s1, cin, sum, c2);
or(cout, c2, c1); 

endmodule
