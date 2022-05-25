`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module four_bit_reduction_operator_tb;
    wire [3:0]out;
    reg [3:0]in;
    integer i;
    
    // unit under test
    four_bit_reduction_operator uut(out, in);
    
    initial begin
        for (i=0; i<16; i=i+1) begin
            in = i;
            #5;
        end
    end
endmodule
