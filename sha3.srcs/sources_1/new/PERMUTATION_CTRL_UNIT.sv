`timescale 1ns / 1ps
`define Z_WIDTH 64

module PERMUTATION_CTRL_UNIT(
	input logic CLK,
	input logic A_RST,
	input logic CE,
	output logic [0:`Z_WIDTH-1] CONSTANT_VALUE,
	input logic VALID_NEW_MESSAGE_FROM_PADDING,
	output logic WAIT_FOR_NEW_MESSAGE
    );
    
ROUND_CONSTANT_COUNTER RND_CONST_CNT (
    .CLK(CLK),
    .A_RST(A_RST),
    .CE(CE),
    .CONSTANT_VALUE(CONSTANT_VALUE),
    .COUNTER_RESET(VALID_NEW_MESSAGE_FROM_PADDING),
    .WAIT_FOR_NEW_MESSAGE(WAIT_FOR_NEW_MESSAGE)
);
endmodule
