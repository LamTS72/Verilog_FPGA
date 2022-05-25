`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//module fifo(clk, rst, rd_en, wr_en, in, out, empty, full, almost_full);//using for fpga
module fifo(clk, rst, rd_en, wr_en, in, out, empty, full, almost_full,count);
////////////////////////////////////////////////////////////////////////////////
parameter WIDTH = 3; //width of bit in each element
parameter ADDR_BIT = 3; //bit address space to write 1 element in fifo
////////////////////////////////////////////////////////////////////////////////
localparam DEPTH = 2**ADDR_BIT; // buffer length(8 elements )
////////////////////////////////////////////////////////////////////////////////
input   wire                    clk;
input   wire                    rst;
input   wire                    rd_en;
input   wire                    wr_en;
input   wire    [WIDTH-1:0]     in;
output  reg     [WIDTH-1:0]     out;
output  wire                    empty;
output  wire                    full;
output  wire                    almost_full;
output  wire    [ADDR_BIT:0]    count; //[ADDR_BIT:0]: to be able to display (max value of [ADDR_BIT-1:0]) + 1
////////////////////////////////////////////////////////////////////////////////
reg [WIDTH-1:0]     mem [DEPTH-1:0]; ////array of 8 8-bit values
reg [ADDR_BIT:0]    cnt; //[ADDR_BIT:0]: to be able to display (max value of [ADDR_BIT-1:0]) + 1
reg [ADDR_BIT-1:0]  frontAddr;//read ptr
reg [ADDR_BIT-1:0]  rearAddr;//write ptr

////////////////////////////////////////////////////////////////////////////////

assign empty = (cnt == 0);
assign almost_full = (cnt == DEPTH-1);
assign full = (cnt == DEPTH)? 1 : 0;
assign count = cnt;
integer i;

////////////////////////////////////////////////////////////////////////////////
//wire clk_div; //using for fpga
//Clock_divider clk_div_1(clk, clk_div); //using for fpga

// counter control(read -> --cnt, write -> ++cnt)
//always @(posedge clk_div, posedge rst) begin //using for fpga
always @(posedge clk, posedge rst) begin
    if(rst) begin
        cnt <= 0;
    end
	else if((!empty && rd_en)&&(!full && wr_en)) begin
		cnt <= cnt;
	end
    else if(!empty && rd_en) begin
        cnt <= cnt - 1;
    end
    else if(!full && wr_en) begin
        cnt <= cnt + 1;
    end
end

// write to rear(control write to mem)
//always @(posedge clk_div, posedge rst) begin //using for fpga
always @(posedge clk, posedge rst) begin
    if(rst) begin
        for(i = 0; i < DEPTH; i = i + 1) begin
            mem[i] <= 0;
        end
        rearAddr <= 0;
    end
	else if((!full && wr_en) && (!empty && rd_en)) begin
		mem[rearAddr] <= mem[rearAddr];// unchange value if write and read at the same time
        	rearAddr <= rearAddr;
	end
    else if(!full && wr_en) begin
        mem[rearAddr] <= in;
        rearAddr <= rearAddr + 1; //update ptr of rear(write ptr)
    end
end

// read from front(control write to mem)
//always @(posedge clk_div, posedge rst) begin //using for fpga
always @(posedge clk, posedge rst) begin
    if(rst) begin
        out <= 0;
        frontAddr <=0;
    end
	else if((!full && wr_en) && (!empty && rd_en)) begin
		out <= mem[frontAddr]; //// unchange value if write and read at the same time
        frontAddr <= frontAddr;
	end
    else if(!empty && rd_en) begin
        out <= mem[frontAddr];
        frontAddr <= frontAddr + 1;//update ptr or front(read ptr)
    end
end

endmodule