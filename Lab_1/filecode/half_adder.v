`timescale 1ns / 1ps



module half_adder(a, b, sum, cout);
input a, b;
output sum, cout;
xor sum1(sum, a, b);
and carry(cout, a, b);

endmodule
