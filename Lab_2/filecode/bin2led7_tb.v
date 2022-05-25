`timescale 1ns / 1ps

module bin2led7_tb();
reg en;
reg [0:3] in;
wire [0:6] out;


bin2led7 test(en, in, out);

initial begin
	en = 1;
	for (in = 0; in < 15; in = in + 1) #30;
	en = 0;
	#30;
end
endmodule