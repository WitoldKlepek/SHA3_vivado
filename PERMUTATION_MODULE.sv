
`define STATE_SIZE 1600
`define Z_WIDTH 64

module PERMUTATION_MODULE #(
	parameter R_BLOCK_SIZE = 1152
	) (
	input logic [0:R_BLOCK_SIZE-1] IN,
	output logic [0:`STATE_SIZE-1] OUT,
	input logic CLK,
	input logic A_RST,
	input logic CE,
	input VALID_MESSAGE_FROM_PADDING
	//output OUT_VALID
	);

	
logic [0:`STATE_SIZE-1]  rnd_out;
logic [0:`STATE_SIZE-1] rnd_in, s_reg;
logic first_rnd;
logic [0:`Z_WIDTH-1] round_constant;
logic wait_for_n_mess;


RND RND1(
	.IN(rnd_in),
	.OUT(rnd_out),
	.RND_CONST(round_constant)
);

PERMUTATION_CTRL_UNIT PERM_CTRL_CNT (
	.CLK(CLK),
	.A_RST(A_RST),
	.CE(CE),
	.CONSTANT_VALUE(round_constant),
	.VALID_NEW_MESSAGE_FROM_PADDING(VALID_MESSAGE_FROM_PADDING),
	.WAIT_FOR_NEW_MESSAGE(wait_for_n_mess)
	);
	
	
always@(posedge CLK, posedge A_RST)
begin
	if(A_RST == 1'b1)
		s_reg	<=	{`STATE_SIZE{1'b0}};
	else
		if(CE == 1'b1)
		  if(wait_for_n_mess == 1'b0)
			s_reg	<=	rnd_out;
end

assign OUT = s_reg;

endmodule

	
