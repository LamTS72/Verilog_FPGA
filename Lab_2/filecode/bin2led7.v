module bin2led7 (enable, bin_in, led_out);
input enable;
input [3:0] bin_in;
output reg [6:0] led_out;


always@* begin

	if (enable == 1) begin
		case(bin_in)
			(4'd1): led_out = (7'b0110000);
			(4'd2): led_out = (7'b1101101);
			(4'd3): led_out = (7'b1111001);
			(4'd4): led_out = (7'b0110011);
			(4'd5): led_out = (7'b1011011);
			(4'd6): led_out = (7'b1011111);
			(4'd7): led_out = (7'b1110000);
			(4'd8): led_out = (7'b1111111);
			(4'd9): led_out = (7'b1111011);
			(4'd0): led_out = (7'b1111110);
			default: led_out = (7'b1001001);
		endcase
	end
	else 
	begin
		led_out = (7'b0000000);
	end
end
endmodule

		
		