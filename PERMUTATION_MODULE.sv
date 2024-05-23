`define STATE_SIZE 1600
`define Z_WIDTH 64

module PERMUTATION_MODULE #(
	parameter R_BLOCK_SIZE = 1152
	) (
	input logic [0:R_BLOCK_SIZE-1] IN,
	output logic [0:`STATE_SIZE-1] OUT,
	input logic CLK,
	input logic A_RST
	//input IN_VALID,
	//output OUT_VALID
	);

	
logic [0:`STATE_SIZE-1]  rnd_out;
logic [0:`STATE_SIZE-1] rnd_in, s_reg;
logic first_rnd;
logic [0:`Z_WIDTH-1] round_constant;

assign rnd_in = first_rnd ? {IN ^ s_reg[0:R_BLOCK_SIZE-1] ,s_reg[R_BLOCK_SIZE:`STATE_SIZE-1]} : s_reg; 

RND RND1(
	.IN(rnd_in),
	.OUT(rnd_out),
	.RND_CONST(round_constant)
);

ROUND_CONSTANT_COUNTER RND_CNT (
	.CLK(CLK),
	.A_RST(A_RST),
	.OUT(round_constant),
	.FIRST_ROUND(first_rnd)
	);
	
	
always@(posedge CLK, posedge A_RST)
begin
	if(A_RST)
		s_reg	<=	{`STATE_SIZE{1'b0}};
	else
		if(CLK)
			s_reg	<=	rnd_out;
end

assign OUT = s_reg;

endmodule

	
