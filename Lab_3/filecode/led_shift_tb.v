`timescale 1ns / 1ps

module led_shift_tb;
// simulation
    reg clk,rst;
    reg button0,button1,button2,button3;
    wire [3:0]leds;
 test uut(.clk(clk),.rst(rst), .button0(button0), .button1(button1),.button2(button2),.button3(button3),.leds(leds));
always #10 clk = ~clk;
    
initial begin
    #20;
    rst <= 0;
    #20;
    button1 <= 1;
    #20;
    button1 <= 0;
    #100;
    button2 <= 1;
    #20;
    button2 <= 0;
    #120;
    button3 <= 1;
    #20;
    button3 <= 0;
    #100;
    button0 <= 1;
    #20;
    button0 <= 0;
//    
end
endmodule
