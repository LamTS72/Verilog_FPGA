`timescale 1ns / 1ps

module four_bit_comparator(output A_lt_B, A_eq_B, A_gt_B, input[3:0] A, B);
    wire l1, l2, e1, e2, g1, g2;
    wire w1, w2;
    
    two_bit_comparator comp1(l2, e2, g2, A[3:2], B[3:2]);
    two_bit_comparator comp2(l1, e1, g1, A[1:0], B[1:0]);
    
    // A less than B output
    and and_0(w1, e2, l1);
    or or_0(A_lt_B, l2, w1);
    
    // A equal B output
    and and_1(A_eq_B, e1, e2);
    
    // A greater than B output
    and and_2(w2, e2, g1);
    or or_1(A_gt_B, g2, w2);
    
endmodule
