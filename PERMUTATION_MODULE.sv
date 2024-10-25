
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
	input logic VALID_MESSAGE_FROM_PADDING,
	input logic LAST_MESSAGE_FROM_PADDING,
	output logic HASH_VALID,
	output logic PERMUTATION_PROCESSING
	);

	
logic [0:`STATE_SIZE-1]  rnd_out;
logic [0:`STATE_SIZE-1] rnd_in, s_reg;
logic [0:`Z_WIDTH-1] round_constant;
logic wait_for_n_mess;
//logic initial_state_bef_first_word;
logic hash_valid_sig;

assign PERMUTATION_PROCESSING = !wait_for_n_mess;

RND RND1(
	.IN(rnd_in),
	.OUT(rnd_out),
	.RND_CONST(round_constant)
);

assign rnd_in = VALID_MESSAGE_FROM_PADDING ? {IN ^ s_reg[0:R_BLOCK_SIZE-1] ,s_reg[R_BLOCK_SIZE:`STATE_SIZE-1]} : s_reg;
assign HASH_VALID = hash_valid_sig;
//always@(posedge CLK, posedge A_RST)
//begin
//    if(A_RST == 1'b1) begin
//        rnd_in  <=  0;
//    end
//		else if(CE == 1'b1)
//		  if(VALID_MESSAGE_FROM_PADDING == 1'b1)
//		      rnd_in  <=  {IN ^ s_reg[0:R_BLOCK_SIZE-1] ,s_reg[R_BLOCK_SIZE:`STATE_SIZE-1]};
//		  else
//		      rnd_in  <=  s_reg;
//end


PERMUTATION_CTRL_UNIT PERM_CTRL_CNT (
	.CLK(CLK),
	.A_RST(A_RST),
	.CE(CE),
	.CONSTANT_VALUE(round_constant),
	.VALID_NEW_MESSAGE_FROM_PADDING(VALID_MESSAGE_FROM_PADDING),
	.WAIT_FOR_NEW_MESSAGE(wait_for_n_mess),
	.LAST_MESSAGE_FROM_PADDING(LAST_MESSAGE_FROM_PADDING),
	.HASH_VALID(hash_valid_sig)
	);
	
	
always@(posedge CLK, posedge A_RST)
begin
	if(A_RST == 1'b1)
		s_reg	<=	{`STATE_SIZE{1'b0}};
	else
		if(CE == 1'b1)
		  if(hash_valid_sig == 1'b1)
		      s_reg	<=	{`STATE_SIZE{1'b0}};    
		  else if(wait_for_n_mess == 1'b0)
		      s_reg	<=	rnd_out;
end

//always@(posedge CLK, posedge A_RST)
//begin
//	if(A_RST == 1'b1)
//		initial_state_bef_first_word  <= 1'b1;
//	else
//		if(CE == 1'b1)
		  
			
//end

assign OUT = s_reg;

endmodule

	
