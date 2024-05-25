`timescale 1ns / 1ps
`define OUTPUT_RESET_STATE 1'b0
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.05.2024 11:55:43
// Design Name: 
// Module Name: PADDING_MODULE
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


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
    output logic READ_VALID
);

logic [READ_DATA_WIDTH-1:0] buffer_out;
logic ctrl_read_en, ctrl_write_en, ctrl_pad;
logic [PTR_SIZE-1:0] ctrl_pad_byte_ptr;
logic [READ_DATA_WIDTH-1:0] read_data_reg;

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
    .READ_DATA(buffer_out),
    .READ_EN(ctrl_read_en)
);

PADDING_CTRL_UNIT  #(
    .PTR_SIZE(PTR_SIZE)
) pad_ctrl_unit  (
    .CLK(CLK),
    .CE(CE),
    .A_RST(A_RST),
    .CTRL_WRITE_EN(ctrl_write_en),
    .CTRL_READ_EN(ctrl_read_en),
    .CTRL_PAD(ctrl_pad),
    .CTRL_PAD_BYTE_PTR(ctrl_pad_byte_ptr)
);

assign READ_DATA = read_data_reg;

always@(posedge CLK or posedge A_RST) begin
    if(A_RST == 1'b1)
        read_data_reg   <=  {READ_DATA_WIDTH{`OUTPUT_RESET_STATE}};
    else
        if(CE == 1'b1) begin
            if(ctrl_pad == 1'b0)
                read_data_reg   <=  buffer_out;
            else begin
                read_data_reg[READ_DATA_WIDTH-1:READ_DATA_WIDTH-(ctrl_pad_byte_ptr)*WRITE_DATA_WIDTH]   <= buffer_out[READ_DATA_WIDTH-1:READ_DATA_WIDTH-(ctrl_pad_byte_ptr)*WRITE_DATA_WIDTH]; 
                read_data_reg[READ_DATA_WIDTH-(ctrl_pad_byte_ptr)*WRITE_DATA_WIDTH-1:0] <= {3'b101,{(READ_DATA_WIDTH-(ctrl_pad_byte_ptr*WRITE_DATA_WIDTH)-4){1'b0}},1'b1};
            end
        end
end


endmodule
