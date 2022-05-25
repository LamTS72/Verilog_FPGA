`timescale 1ns / 1ps

module four_bit_comparator_tb;
    reg [3:0] A, B;
    wire A_lt_B, A_eq_B, A_gt_B;
    integer i, j;
    
    // unit under test
    four_bit_comparator uut(A_lt_B, A_eq_B, A_gt_B, A, B);
    
    initial begin
        for (i=0; i<16; i=i+1) begin
            A = i;
            for (j=0; j<16; j=j+1) begin
                B = j;
                #2;
            end
        end
    end
endmodule
