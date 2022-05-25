`timescale 1ns / 1ps

module two_bit_reduction_operator(out, in);
    output [3:0]out;
    input [1:0]in;
    
    assign out[0] = ~^in;
    assign out[1] = ^in;
    assign out[2] = ~|in;
    assign out[3] = &in;
endmodule
