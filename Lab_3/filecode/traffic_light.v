`timescale 1ns / 1ps


module traffic_light(clk,rst,ledb1,ledb2,ledg1,ledg2,ledr1,ledr2);
input clk,rst;
output reg ledb1,ledb2,ledg1,ledg2,ledr1,ledr2;
reg [27:0]counter = 28'd0;
parameter DIVISON= 28'd125000000;
always @(posedge clk) begin
    counter <= counter + 28'd1;
    if(counter >= (DIVISON-1)) counter <= 28'd0;
    ledr1 <= (counter < DIVISON/2)?1:0;
    ledr2 <= (counter < DIVISON/2)?0:1;
    ledb1 <= (counter < DIVISON/3)?0:1;
    ledb2 <= (counter < DIVISON/3)?1:0;
    if( ledr1 ==0 && ledb1 ==0) ledg1 =1;
    if( ledr2 ==0 && ledb2 ==0) ledg2 =1;
    
end
endmodule