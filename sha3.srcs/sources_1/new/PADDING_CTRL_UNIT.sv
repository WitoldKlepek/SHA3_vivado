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
    localparam BUF_CNT_SIZE = $clog2(IN_OUT_RATIO),
    localparam PAD_CNT_SIZE = $clog2(IN_OUT_RATIO+1) 
    //pad_counter has one more state (which represenent nothing ToDo)
) (
    input logic CLK,
    input logic CE,
    input logic A_RST,
    input logic DATA_IN_VALID, 
    output logic CTRL_BUF_READ_EN,
    output logic CTRL_BUF_WRITE_EN,
    input logic BUF_FULL,
    input logic BUF_EMPTY,
    output logic [PAD_CNT_SIZE-1:0] CTRL_PAD_PTR 
    );

logic [BUF_CNT_SIZE-1:0] read_en_counter;
logic read_en_det;

logic [PAD_CNT_SIZE-1:0] ctrl_pad, pad_ptr_counter;    
logic pad_en;


//write_en comb. logic   
assign CTRL_BUF_WRITE_EN = DATA_IN_VALID && !BUF_FULL;


//read_en seq. logic
always@(posedge CLK, posedge A_RST)
begin
    if(A_RST == 1'b1) begin
        read_en_counter     <= 0;
        read_en_det         <= 1'b0;
    end
        else begin
            if(CE == 1'b1) begin
                if(DATA_IN_VALID == 1'b1 && BUF_EMPTY == 1'b0) begin
                    if(read_en_counter == IN_OUT_RATIO - 1) begin
                        read_en_counter <=  0;
                        read_en_det     <=  1'b1;
                    end else begin
                        read_en_counter     <=  read_en_counter + 1;
                        read_en_det         <=  1'b0;
                    end
                end else begin
                    read_en_det     <=  1'b0;
                end
            end
        end
end    

assign CTRL_BUF_READ_EN = read_en_det;


//padding detecting
always@(posedge CLK, posedge A_RST)
begin
    if(A_RST == 1'b1) begin
        pad_ptr_counter <=  1;
        pad_en          <=  1'b0;
    end
        else begin
            if(CE == 1'b1) begin 
                if(DATA_IN_VALID == 1'b1 && BUF_FULL == 1'b0) begin
                    if(pad_ptr_counter == IN_OUT_RATIO) begin
                        pad_ptr_counter    <=  1;
                        pad_en             <=  1'b0;
                    end else begin
                        pad_ptr_counter     <=  pad_ptr_counter + 1;    
                    end
                end else begin
                    if(DATA_IN_VALID == 1'b0)
                        pad_en  <= 1'b1;
                end
            end      
        end
end

//pad_ptr seq. logic
always@(posedge CLK, posedge A_RST)
begin
    if(A_RST == 1'b1) begin
        ctrl_pad    <=  0;
    end
        else begin
            if(CE == 1'b1) begin
                //ptr value change for every new part of data
                if(read_en_det == 1'b1) begin
                    if(pad_en == 1'b1)
                        ctrl_pad    <=  pad_ptr_counter;
                    else
                        ctrl_pad    <=  0;        
                end
            end
        end
end

assign CTRL_PAD_PTR = ctrl_pad;

endmodule
