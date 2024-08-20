`timescale 1ns / 1ps
`define BUFFER_DEPTH 128


module SHA3_224_IN_32W #(
    localparam DATA_INPUT_WIDTH = 32,
    localparam OUTPUT_HASH_SIZE = 224,
    localparam PERMUTATION_INPUT_WORD_WIDTH = 1600 - 2 * OUTPUT_HASH_SIZE
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
logic [PERMUTATION_INPUT_WORD_WIDTH-1:0] output_reg;
logic last_mess;

PADDING_MODULE  #(
    .WRITE_DATA_WIDTH(DATA_INPUT_WIDTH),
    .READ_DATA_WIDTH(PERMUTATION_INPUT_WORD_WIDTH),
    .DEPTH(`BUFFER_DEPTH)
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

genvar i;
generate
    for(i=0; i < PERMUTATION_INPUT_WORD_WIDTH; i++) begin
        assign permutation_in[i] = padding_out[PERMUTATION_INPUT_WORD_WIDTH - i - 1];
    end
endgenerate

assign HASH_OUT = output_reg[PERMUTATION_INPUT_WORD_WIDTH-1:PERMUTATION_INPUT_WORD_WIDTH-1-OUTPUT_HASH_SIZE];

endmodule
