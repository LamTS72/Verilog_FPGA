`timescale 1ns / 1ps
module Clock_divider(clk,c_out);
input clk; // input clock on FPGA
reg clock_out; // output clock after dividing the input clock by divisor
output reg [1:0]c_out;
reg[27:0] counter=28'd0;
parameter DIVISOR = 28'd125000000;

always @(posedge clk) begin
counter <= counter + 28'd1;
if(counter>=(DIVISOR-1))
    counter <= 28'd0;
clock_out <= (counter<DIVISOR/2)?1'b1:1'b0;
c_out <= (clock_out>0)? 2'b10:2'b01;
end
endmodule