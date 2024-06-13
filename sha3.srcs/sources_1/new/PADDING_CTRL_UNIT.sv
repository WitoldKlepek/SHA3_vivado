`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2024 00:37:09
// Design Name: 
// Module Name: PADDING_CTRL_UNIT
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


module PADDING_CTRL_UNIT #(
    parameter IN_OUT_RATIO = 8,
    localparam CNT_SIZE = $clog2(IN_OUT_RATIO)
) (
    input logic CLK,
    input logic CE,
    input logic A_RST,
    output logic CTRL_READ_EN,
    output logic CTRL_WRITE_EN,
    input logic BUF_FULL,
    input logic BUF_EMPTY,
    input logic DATA_IN_VALID
    );

logic [CNT_SIZE-1:0] read_en_counter;
    
assign CTRL_WRITE_EN = A_RST && DATA_IN_VALID; //&& !BUF_FULL;

always@(posedge CLK, posedge A_RST)
begin
    if(A_RST == 1'b1) begin
        read_en_counter     <=  0;
        CTRL_WRITE_EN       <=  1'b0;
    end else
        if(CE == 1'b1) begin
            if(DATA_IN_VALID) begin
                if(read_en_counter == IN_OUT_RATIO - 1) begin
                    CTRL_WRITE_EN   <=  1'b1;
                    read_en_counter <=  0;
                end else begin
                    CTRL_WRITE_EN   <=  1'b0;
                    read_en_counter <=  read_en_counter + 1;
                end  
            end
        end
end    


endmodule
