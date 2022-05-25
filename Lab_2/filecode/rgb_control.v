`timescale 1ns / 1ps

module rgb_control(led4, led5, switch0, switch1, in_but);
    input switch0, switch1;
    input [3:0]in_but;
    output reg [2:0]led4, led5;
    
    always@ (switch0, switch1, in_but) begin
        if (switch0 == 1'b0) begin
            if (switch1 == 1'b0) begin
                case (in_but)
                    4'b0001: led5 = 3'b001;
                    4'b0010: led5 = 3'b010;
                    4'b0100: led5 = 3'b100;
                    4'b1000: led5 = 3'b111;
                    default: led5 = 3'b000;
                endcase
            end
            else begin
                case (in_but)
                    4'b0001: led4 = 3'b001;
                    4'b0010: led4 = 3'b010;
                    4'b0100: led4 = 3'b100;
                    4'b1000: led4 = 3'b111;
                    default: led4 = 3'b000;
                endcase
            end  
        end
        else if (switch0 == 1'b1) begin
            if (switch1 == 1'b0) begin
                case (in_but)
                    4'b1000: begin
                        led5 = 3'b111;
                        led4 = 3'b111;
                    end
                    default: begin 
                        led5 = in_but[2:0];
                        led4 = in_but[2:0];
                    end
                endcase
            end
            else begin
                case (in_but)
                    4'b0001: begin
                        led5 = 3'b011;
                        led4 = 3'b011;
                    end
                    4'b0010: begin
                        led5 = 3'b110;
                        led4 = 3'b110;
                    end
                    4'b0100: begin
                        led5 = 3'b101;
                        led4 = 3'b101;
                    end
                    4'b1000: begin
                        led5 = 3'b111;
                        led4 = 3'b111;
                    end
                    default: begin 
                        led5 = 3'b000;
                        led4 = 3'b000;
                    end 
                endcase
            end 
        end
    end

endmodule
