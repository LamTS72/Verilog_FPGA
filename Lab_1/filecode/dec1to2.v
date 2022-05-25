module dec1to2(out1, out2, in);
input  wire in;
output wire out1;
output wire out2;

// Structural
// module_name instance_name(port list);
not not0(out1, in);

// Continuous Assignment
assign out2 = in;

endmodule 
