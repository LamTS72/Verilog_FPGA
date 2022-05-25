module test(
input clk, rst,
input button0,button1,button2,button3,
output [3:0]leds
    );
    
//    reg clk=0, rst=1;
//    reg button0=0,button1=0,button2=0,button3=0;
//    wire [3:0]leds;
    
parameter PERIOD = 27'b111_0111_0011_0101_1001_0100_0000; // 125000000
//parameter PERIOD = 27'b000_0000_0000_0000_0000_0000_0010;
localparam MODE_RESET       = 2'd0;
localparam MODE_SHIFT_LEFT  = 2'd1;
localparam MODE_SHIFT_RIGHT = 2'd2;
localparam MODE_PAUSE       = 2'd3;
//////////////////////////////////////////////////////////////////////////////////////
    reg [26:0] counter;
    wire one_sec_flag;
    
    assign one_sec_flag = (counter == PERIOD);
    
    always@(posedge clk) begin
        if(rst) begin
            counter <= 0;
        end
        else begin
            if(one_sec_flag) begin
                counter <= 0;
            end
            else begin
                counter <= counter + 1;
            end
        end
    end
//////////////////////////////////////////////////////////////////////////////////////
    
    
    reg [1:0]state_reg, state_next;
    always@(posedge clk) begin
        if(rst) begin
            state_reg <= MODE_RESET;
        end
        else begin
            state_reg <= state_next;
        end
    end
    
    always@(*) begin
        if(button0)
            state_next <= MODE_RESET;
        else if(button1)
            state_next <= MODE_SHIFT_LEFT;
        else if(button2)
            state_next <= MODE_SHIFT_RIGHT;
        else if(button3)
            state_next <= MODE_PAUSE;
        else
            state_next <= state_reg;
    end
//////////////////////////////////////////////////////////////////////////////////////
   
    reg [3:0]leds_reg, leds_next;
    assign leds = leds_reg;
    always@(posedge clk) begin
        if(rst)
            leds_reg <= 4'b0011;
        else if(one_sec_flag) begin
            leds_reg <= leds_next;
        end
    end
    
    always@(*) begin
        case(state_reg)
            MODE_RESET: begin
                leds_next <= 4'b0011;
            end
            MODE_SHIFT_LEFT: begin
                leds_next <= {leds_reg[2:0], leds_reg[3]};
            end
            MODE_SHIFT_RIGHT: begin
                leds_next <= {leds_reg[0], leds_reg[3:1]};
            end
            MODE_PAUSE: begin
                leds_next <= leds_reg;
            end
            default: begin
                leds_next <= leds_reg;
            end
        endcase
    end
    

endmodule