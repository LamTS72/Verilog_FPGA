module mux2to1(out, in0, in1, select);
input  wire in0, in1;
input  wire select;
output wire out;

wire dec_out0, dec_out1;
wire and_out0, and_out1;

// Instantiate an instance of a module
// module_name instance_name (port list);
dec1to2 dec1to2_0(dec_out0, dec_out1, select);

and and0(and_out0, dec_out0, in0);
and and1(and_out1, dec_out1, in1);

or  or0 (out, and_out0, and_out1);

endmodule 