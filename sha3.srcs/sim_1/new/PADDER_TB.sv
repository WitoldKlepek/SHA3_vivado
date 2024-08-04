`timescale 1ns / 1ps

module PADDER_TB();

localparam DATA_WIDTH = 64;
localparam DATA_PART_WIDTH = 16;

logic [DATA_WIDTH-1:0] in, out;
logic [2:0] ptr;

PADDER #(
    .DATA_WIDTH(DATA_WIDTH),
    .DATA_PART_WIDTH(DATA_PART_WIDTH)
)   UUT1   (
    .PADDER_IN(in),
    .PADDER_OUT(out),
    .PAD_PTR(ptr)
);

initial begin
	#0 $monitor("TIME = %0t \n in = %h \n ptr = %h \n out = %h ",$time, in, ptr, out);
	#5 in	<= 64'h00001111000011110000111100001111;
	   ptr  <= 3'b001;
	#5 ptr  <= 3'b000;
	#5 in	<= 64'h22223333222233332222333322223333;
	   ptr  <= 3'b010;
	#5 ptr  <= 3'b000;
	#5 in	<= 64'h44445555444455554444555544445555;
	   ptr  <= 3'b011;
	#5 ptr  <= 3'b000;
	#5 in	<= 64'h66667777666677776666777766667777;
	   ptr  <= 3'b100;
	   ptr  <= 3'b000;
	#5 in	<= 64'hFFFFAAAAFFFFAAAAFFFFAAAAFFFFAAAA;
	   ptr  <= 3'b010;
	#5 ptr  <= 3'b000;  
    
end

initial
    #100 $finish;


endmodule
