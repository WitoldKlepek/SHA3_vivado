
`timescale 1ns / 1ps
`define OUTPUT_RESET_STATE 1'b0

module PADDING_MODULE #(
    parameter WRITE_DATA_WIDTH = 32,
    parameter READ_DATA_WIDTH = 32,
    parameter DEPTH = 16,
    localparam IN_OUT_RATIO = READ_DATA_WIDTH/WRITE_DATA_WIDTH,
    localparam PTR_SIZE = $clog2(IN_OUT_RATIO)
)   (    
    input logic CLK,
    input logic CE,
    input logic A_RST,
    input logic [WRITE_DATA_WIDTH-1:0] WRITE_DATA,
    input logic WRITE_VALID,
    output logic [READ_DATA_WIDTH-1:0] READ_DATA,
    output logic VALID_MESSAGE_FROM_PADDING,
    output logic CTRL_LAST_MESSAGE_FROM_PADDING
);

logic [READ_DATA_WIDTH-1:0] buffer_out_padder_in;
logic ctrl_read_en, ctrl_write_en;
logic [PTR_SIZE-1:0] ctrl_padder_ptr;
logic [READ_DATA_WIDTH-1:0] padder_out;
logic ctrl_buf_empty, ctrl_buf_full;

BUFFER #(
    .WRITE_DATA_WIDTH(WRITE_DATA_WIDTH),
    .READ_DATA_WIDTH(READ_DATA_WIDTH),
    .DEPTH(DEPTH)
) buffer1 (
    .CLK(CLK),
    .CE(CE),
    .A_RST(A_RST),
    .WRITE_DATA(WRITE_DATA),
    .WRITE_EN(ctrl_write_en),
    .READ_DATA(buffer_out_padder_in),
    .READ_EN(ctrl_read_en),
    .FULL(ctrl_buf_full),
    .EMPTY(ctrl_buf_empty)
);

PADDER #(
    .DATA_WIDTH(READ_DATA_WIDTH),
    .DATA_PART_WIDTH(WRITE_DATA_WIDTH)
) padder1 (
    .PADDER_IN(buffer_out_padder_in),
    .PADDER_OUT(padder_out),
    .PAD_PTR(ctrl_padder_ptr)
);

//assign CTRL_READ_EN = ctrl_read_en;
always@(posedge CLK, posedge A_RST)
begin
    if(A_RST == 1'b1) begin
        VALID_MESSAGE_FROM_PADDING  <=  1'b0;
    end
		else if(CE == 1'b1)
		  if(ctrl_read_en == 1'b1)
		      VALID_MESSAGE_FROM_PADDING  <= 1'b1;
		  else
		      VALID_MESSAGE_FROM_PADDING  <= 1'b0;
end

assign READ_DATA = padder_out;

PADDING_CTRL_UNIT  #(
    .IN_OUT_RATIO(IN_OUT_RATIO)
) pad_ctrl_unit  (
    .CLK(CLK),
    .CE(CE),
    .A_RST(A_RST),
    .DATA_IN_VALID(WRITE_VALID),
    .CTRL_BUF_WRITE_EN(ctrl_write_en),
    .CTRL_BUF_READ_EN(ctrl_read_en),
    .CTRL_PAD_PTR(ctrl_padder_ptr),
    .BUF_EMPTY(ctrl_buf_empty),
    .BUF_FULL(ctrl_buf_full)
);

assign CTRL_LAST_MESSAGE_FROM_PADDING = (ctrl_padder_ptr == 0) ? 1'b0 : 1'b1;

endmodule
