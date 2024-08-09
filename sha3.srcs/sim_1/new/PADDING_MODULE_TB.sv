`timescale 1ns / 1ps

`define WRITE_DATA_WIDTH 64
`define READ_DATA_WIDTH 576
`define DEPTH 32
`define IN_OUT_RATIO (`READ_DATA_WIDTH / `WRITE_DATA_WIDTH)

module PADDING_MODULE_TB();

logic CLK, A_RST, CE;
logic [`WRITE_DATA_WIDTH-1:0] WRITE_DATA;
logic WRITE_VALID;
logic [`READ_DATA_WIDTH-1:0] READ_DATA;
logic READ_VALID;

PADDING_MODULE #(
    .WRITE_DATA_WIDTH(`WRITE_DATA_WIDTH),
    .READ_DATA_WIDTH(`READ_DATA_WIDTH),
    .DEPTH(`DEPTH)
) UUT (
    .CLK(CLK),
    .CE(CE),
    .A_RST(A_RST),
    .WRITE_DATA(WRITE_DATA),
    .WRITE_VALID(WRITE_VALID),
    .READ_DATA(READ_DATA)
    //,.READ_VALID(READ_VALID)
);

initial begin
	CLK = 1'b1;
	CE = 1'b1;
	forever 
	#5 CLK = ~CLK;
end

initial begin
	A_RST = 1'b1;
	#50 A_RST = 1'b0;
end

initial begin
    WRITE_DATA      <=   0;
    forever
    #10 WRITE_DATA  <=  WRITE_DATA + 1;   
end

initial begin
    WRITE_VALID         <=   1'b1;
    #300 WRITE_VALID    <=   1'b0;
    #50 $finish;
end
//initial begin
//    READ_EN <=  1'b0;
//    #50
//    forever begin
//        #(10*(`IN_OUT_RATIO-1)) READ_EN <=  1'b1;
//        #10 READ_EN <=  1'b0;
//    end
//end


endmodule
