`timescale 1ns / 1ps
`define BUFFER_DEPTH 128
`define PERMUTATION_WIDTH 1600

module SHA3_256_IN_32W #(
    localparam DATA_INPUT_WIDTH = 32,
    localparam OUTPUT_HASH_SIZE = 256,
    localparam PERMUTATION_INPUT_WORD_WIDTH = `PERMUTATION_WIDTH - 2 * OUTPUT_HASH_SIZE,
    localparam IN_OUT_RATIO = PERMUTATION_INPUT_WORD_WIDTH/DATA_INPUT_WIDTH
    //,localparam CLK_CYCLES_TO_COLLECT_DATA = PERMUTATION_INPUT_WORD_WIDTH / DATA_INPUT_WIDTH  
)   (
    input logic [DATA_INPUT_WIDTH-1:0] DATA_IN_SEQ,
    output logic [OUTPUT_HASH_SIZE-1:0] HASH_OUT,
    input logic CLK,
    input logic A_RST,
    input logic CE,
    input logic DATA_IN_VALID,
    output logic HASH_OUT_VALID 
    );

logic [PERMUTATION_INPUT_WORD_WIDTH-1:0] padding_out, permutation_in;
logic valid_mess;
logic [`PERMUTATION_WIDTH-1:0] output_reg;
logic last_mess;

PADDING_MODULE  #(
    .WRITE_DATA_WIDTH(DATA_INPUT_WIDTH),
    .READ_DATA_WIDTH(PERMUTATION_INPUT_WORD_WIDTH),
    .DEPTH(2*IN_OUT_RATIO)
)  PADDING_PART (
    .CLK(CLK),
    .A_RST(A_RST),
    .CE(CE),
    .WRITE_DATA(DATA_IN_SEQ),
    .WRITE_VALID(DATA_IN_VALID),
    .READ_DATA(padding_out),
    .VALID_MESSAGE_FROM_PADDING(valid_mess),
    .CTRL_LAST_MESSAGE_FROM_PADDING(last_mess)
);

PERMUTATION_MODULE #(
    .R_BLOCK_SIZE(PERMUTATION_INPUT_WORD_WIDTH)
)   PERMUTATION_PART (
    .CLK(CLK),
    .A_RST(A_RST),
    .CE(CE),
    .IN(permutation_in),
    .OUT(output_reg),
    .VALID_MESSAGE_FROM_PADDING(valid_mess),
    .HASH_VALID(HASH_OUT_VALID),
    .LAST_MESSAGE_FROM_PADDING(last_mess) 
); 

//genvar i;
//generate
//    for(i=0; i < PERMUTATION_INPUT_WORD_WIDTH; i++) begin
//        assign permutation_in[i] = padding_out[PERMUTATION_INPUT_WORD_WIDTH - i - 1];
//    end
//endgenerate


assign permutation_in = padding_out;

//assign HASH_OUT = output_reg[PERMUTATION_INPUT_WORD_WIDTH-1:PERMUTATION_INPUT_WORD_WIDTH-1-OUTPUT_HASH_SIZE];

genvar i;
generate
    for (i = 0; i < OUTPUT_HASH_SIZE; i = i +1) begin
        assign HASH_OUT[OUTPUT_HASH_SIZE - 1 - i] = output_reg[`PERMUTATION_WIDTH - 1 - i];
    end
endgenerate

endmodule
