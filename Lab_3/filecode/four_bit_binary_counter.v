`timescale 1ns / 1ps

module four_bit_binary_counter(input button, input clk, input rst, output reg [3:0]out);
    wire raising_edge;
    
    edge_detector button_detect(button, clk, rst, raising_edge);
    
    always @ (posedge raising_edge) begin
        if (rst)
            out <= 4'b0000;
        else
            out <= out + 1;
    end
endmodule
