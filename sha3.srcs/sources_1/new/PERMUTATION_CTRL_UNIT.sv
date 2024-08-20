`timescale 1ns / 1ps
`define Z_WIDTH 64

module PERMUTATION_CTRL_UNIT(
	input logic CLK,
	input logic A_RST,
	input logic CE,
	output logic [0:`Z_WIDTH-1] CONSTANT_VALUE,
	input logic VALID_NEW_MESSAGE_FROM_PADDING,
	output logic WAIT_FOR_NEW_MESSAGE,
	input logic LAST_MESSAGE_FROM_PADDING,
	output logic HASH_VALID
    );

logic h_val;
logic wait_f_new_mess;

ROUND_CONSTANT_COUNTER RND_CONST_CNT (
    .CLK(CLK),
    .A_RST(A_RST),
    .CE(CE),
    .CONSTANT_VALUE(CONSTANT_VALUE),
    .COUNTER_RESET(VALID_NEW_MESSAGE_FROM_PADDING),
    .WAIT_FOR_NEW_MESSAGE(wait_f_new_mess)
);

assign WAIT_FOR_NEW_MESSAGE = wait_f_new_mess & !VALID_NEW_MESSAGE_FROM_PADDING;

always @(posedge CLK, posedge A_RST)
begin
    if(A_RST == 1'b1) begin
        h_val   <=  1'b0;
    end
        else
            if(CE == 1'b1) begin
                if(wait_f_new_mess == 1'b1 && LAST_MESSAGE_FROM_PADDING == 1'b1)
                    h_val   <=  1'b1;
                else
                    h_val   <=  1'b0;   
            end
end

assign HASH_VALID = h_val;

endmodule
