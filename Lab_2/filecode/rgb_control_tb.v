`timescale 1ns / 1ps

module rgb_control_tb();
reg switch0,switch1;
reg [3:0] in_but;
wire [2:0]led4,led5;


rgb_control test(led4, led5, switch0, switch1,in_but );

initial begin
	switch0 <= 0; // 1 led
	switch1 <= 0; //led5
	for (in_but = 0; in_but < 15; in_but = in_but + 1) #5;
	#5;
	
	switch0 <=0; //1 led
	switch1 <=1; //led4
	for (in_but = 0; in_but < 15; in_but = in_but + 1) #5;
	#5;
	
	switch0 <=1; //2 led
    switch1 <=0; //1 color
    for (in_but = 0; in_but < 15; in_but = in_but + 1) #5;
    #5;
	
	switch0 <=1; //2 led
    switch1 <=1; //mix 2 color
    for (in_but = 0; in_but < 15; in_but = in_but + 1) #5;
    #5;
    $stop;   
end
endmodule
