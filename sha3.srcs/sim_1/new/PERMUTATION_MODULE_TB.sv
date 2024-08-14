
`timescale 1ns / 1ps



module PERMUTATION_MODULE_TB();

localparam STATE_SIZE = 1600;
localparam R_BLOCK_SIZE = 1152;
logic [0:STATE_SIZE-1] out, out_conv; 

logic [0:R_BLOCK_SIZE-1] in,in_conv;
logic CLK, A_RST, CE;
logic valid_mess;

integer i,j;
function [STATE_SIZE-1:0] ConvertData1600; 
	input [STATE_SIZE-1:0] in_f;
	for (i = 0; i < STATE_SIZE/8; i++) begin
		for (j = 0; j < 8; j++) begin
			ConvertData1600[i*8+j] = in_f[(i+1)*8-j-1];
		end
	end
endfunction

function [R_BLOCK_SIZE-1:0] ConvertDataRBlock; 
	input [R_BLOCK_SIZE-1:0] in_f;
	for (i = 0; i < R_BLOCK_SIZE/8; i++) begin
		for (j = 0; j < 8; j++) begin
			ConvertDataRBlock[i*8+j] = in_f[(i+1)*8-j-1];
		end
	end
endfunction

PERMUTATION_MODULE #(
	.R_BLOCK_SIZE(R_BLOCK_SIZE)
	) UUT1 (
	.IN(in_conv),
	.OUT(out_conv),
	.CLK(CLK),
	.A_RST(A_RST),
	.CE(CE),
	.VALID_MESSAGE_FROM_PADDING(valid_mess)
);

assign in_conv = ConvertDataRBlock(in);
assign out = ConvertData1600(out_conv);

initial begin
	#0 $monitor("TIME = %0t \n in = %h \n in_conv = %h \n out = %h ",$time, in, in_conv, out);
	#5 in	<= {{40'h53587B9901},{{R_BLOCK_SIZE-48}{1'b0}},{8'h80}};
end

initial begin
    CE = 1'b1;
	CLK = 1'b1;
	forever 
	#5 CLK = ~CLK;
end

initial begin
	A_RST = 1'b1;
	valid_mess = 1'b0;
	#50 A_RST = 1'b0;
	#50 valid_mess = 1'b1;
	#10 valid_mess = 1'b0;
	#300 $finish;
end 


endmodule
