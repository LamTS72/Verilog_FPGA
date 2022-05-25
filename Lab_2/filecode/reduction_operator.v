`timescale 1ns / 1ps

module four_bit_reduction_operator(out, in);
    output [3:0]out;
    input [3:0]in;
    wire [3:0]w1, w2;
    
    two_bit_reduction_operator check_higher(w1, in[3:2]);
    two_bit_reduction_operator check_lower(w2, in[1:0]);
    
    assign out[0] = (w1[0] & w2[0]) | ~(w1[0] | w2[0]);
    assign out[1] = w1[1] ^ w2[1];
    assign out[2] = w1[2] & w2[2];
    assign out[3] = w1[3] & w2[3];
endmodule
