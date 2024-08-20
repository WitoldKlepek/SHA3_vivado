`timescale 1ns / 1ps

module BUFFER_TB();

logic  CLK, A_RST, CE;
logic [31:0] WRITE_DATA;
logic WRITE_EN;
logic [127:0] READ_DATA;
logic READ_EN;
logic FULL, EMPTY;

BUFFER #(
    .WRITE_DATA_WIDTH(32),
    .READ_DATA_WIDTH(128),
    .DEPTH(16)
)   UUT (
    .CLK(CLK),
    .CE(CE),
    .A_RST(A_RST),
    .WRITE_EN(WRITE_EN),
    .WRITE_DATA(WRITE_DATA),
    .READ_EN(READ_EN),
    .READ_DATA(READ_DATA),
    .FULL(FULL),
    .EMPTY(EMPTY)
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
    #0 WRITE_EN     <=  1'b0;
    READ_EN         <=  1'b0;
    WRITE_DATA      <=  32'h11111111;
    #80 WRITE_DATA  <=  32'h22222222;
    #20 WRITE_EN    <=  1'b1;
    #10 WRITE_DATA  <=  32'h33333333;
    #10 WRITE_DATA  <=  32'h44444444;
    WRITE_EN        <=  1'b0;
    #50 WRITE_EN    <=  1'b1;
    WRITE_DATA      <=  32'h55555555;
    #20 READ_EN         <= 1'b1;
    #10 READ_EN     <=  1'b0;
    #10 WRITE_DATA  <=  32'h66666666;
    #10 WRITE_DATA  <=  32'h77777777;
    #10 WRITE_DATA  <=  32'h88888888;
    #10 WRITE_EN    <=  1'b0;
    READ_EN         <=  1'b1;
    #10 READ_EN     <=  1'b0;
    #100 $finish; 
end


endmodule
