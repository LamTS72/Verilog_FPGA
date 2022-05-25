`timescale 1ns / 1ps

module fifo_sim();
localparam WIDTH = 8;
localparam ADDR_BIT = 4;

localparam DEPTH = 2**ADDR_BIT;

reg  clk;
reg  rst;
reg  rd_en;
reg  wr_en;
reg [WIDTH-1:0] in;
wire [WIDTH-1:0] out;
wire empty;
wire full;
wire almost_full;
wire [ADDR_BIT:0] count;
integer i;

    fifo #(.ADDR_BIT(ADDR_BIT), .WIDTH(WIDTH)) uut(clk, rst,rd_en,wr_en,in,out,empty, full, almost_full, count);
    
    always #10 clk = ~clk; 
    initial begin   
        rst <= 0;
        #5
        rst<=1;
        
        clk <= 0;
        
        wr_en <= 0;
        rd_en <= 0;
        in <= 0;
        #20;
        rst <= 0;
        for(i = 1; i <= 20; i = i+ 1) begin
            in <= i;
            wr_en <= 1;
            #10;
            wr_en<= 0;
            #10;
        end
        for(i = 1; i <= 20; i = i+ 1) begin
            rd_en <= 1;
            #10;
            rd_en<= 0;
            #10;
        end
    end
endmodule