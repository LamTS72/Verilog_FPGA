`timescale 1ns / 1ps

module two_bit_comparator(A_lt_B, A_eq_B, A_gt_B, A,B);
    output A_lt_B, A_eq_B, A_gt_B;
    input[1:0] A, B;
    wire w1, w2, w3, w4, w5, w6, w7;
    
    // A less than B output
    assign w1 = ~(A[1]) & B[1];
    assign w2 = ~(A[0]) & ~(A[1]) & B[0];
    assign w3 = ~(A[0]) & B[0] & B[1];
    assign A_lt_B = w1 | w2 | w3;
    
    // A = B output   
    xnor xnor_0(w4, A[1], B[1]);
    xnor xnor_1(w5, A[0], B[0]);
    and and_3(A_eq_B, w4, w5);
    
    // A greater than B output
    nor nor_0(A_gt_B, A_lt_B, A_eq_B);
endmodule   
