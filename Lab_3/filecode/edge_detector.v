`timescale 1ns / 1ps

module edge_detector (input signal, input clk, input rst, output raising_edge);
    reg sig_delay;
    reg q0, q1;
    
    always @ (posedge clk) begin
        if (rst) begin
            q0 <= 1'b0;
            q1 <= 1'b0;
        end else begin
            q0 <= signal;
            q1 <= q0;
        end
    end
    
    assign raising_edge = ~q1 & q0;            
endmodule 
