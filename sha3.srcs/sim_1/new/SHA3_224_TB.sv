`timescale 1ns / 1ps

module SHA3_224_TB();

localparam DATA_INPUT_WIDTH = 32;
localparam OUTPUT_HASH_SIZE = 224;
localparam PERMUTATION_INPUT_WORD_WIDTH = 1600 - 2 * OUTPUT_HASH_SIZE;

logic [DATA_INPUT_WIDTH-1:0] data_in_seq;
logic [OUTPUT_HASH_SIZE-1:0] hash_out;
logic clk, a_rst, ce, data_in_valid, hash_out_valid;

SHA3_224_IN_32W UUT (
    .DATA_IN_SEQ(data_in_seq),
    .HASH_OUT(hash_out),
    .CLK(clk),
    .A_RST(a_rst),
    .CE(ce),
    .DATA_IN_VALID(data_in_valid),
    .HASH_OUT_VALID(hash_out_valid) 
);

initial begin
	#0 clk = 1'b1;
	forever 
	#5 clk = ~clk;
end

initial begin
    #0 a_rst       =  1'b1;
    ce          =  1'b0;
    data_in_valid   =  1'b0;
    #50 a_rst   =  1'b0;
    #50 ce      =  1'b1;
    #50 data_in_valid =1'b1;
    #500 data_in_valid =1'b0;
    #1000 $finish;
    
end

initial begin
    #0 data_in_seq      =  {4{8'hF0}};
    #150 data_in_seq    =  {4{8'hC5}};
    //#10 data_in_seq    =  {4{8'hC4}};
    //#10 data_in_seq    =  {4{8'hC5}};
    #500 data_in_seq   =   {4{8'hF0}};
    //#500 data_in_seq   =   {4{8'hF0}};
end

endmodule
