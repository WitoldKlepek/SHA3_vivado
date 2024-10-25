`timescale 1ns / 1ps
`define Z_WIDTH 64

module PERMUTATION_CTRL_UNIT(
	input logic CLK,
	input logic A_RST,
	input logic CE,
	output logic [0:`Z_WIDTH-1] CONSTANT_VALUE,
	input logic VALID_NEW_MESSAGE_FROM_PADDING,
	output logic WAIT_FOR_NEW_MESSAGE,
	input logic LAST_MESSAGE_FROM_PADDING,
	output logic HASH_VALID
    );
    
typedef enum {INIT, NEW_MESS, COUNTING,  WAIT_FOR_NEXT_MESS, VALID} permutation_ctrl_states;

logic h_val;
logic wait_f_new_mess;
logic [4:0] twenty_four_counter;
permutation_ctrl_states state;
logic last_perm_for_mess;


//ROUND_CONSTANT_COUNTER RND_CONST_CNT (
//    .CLK(CLK),
//    .A_RST(A_RST),
//    .CE(CE),
//    .CONSTANT_VALUE(CONSTANT_VALUE),
//    .COUNTER_RESET(VALID_NEW_MESSAGE_FROM_PADDING),
//    .WAIT_FOR_NEW_MESSAGE(wait_f_new_mess)
//);

ROUND_CONSTANT_COUNTER RND_CONST_CNT (
    .CONSTANT_VALUE(CONSTANT_VALUE),
    .COUNTER(twenty_four_counter)
);


always@ (posedge CLK, posedge A_RST)
begin
    if(A_RST == 1'b1)
        last_perm_for_mess  <=  1'b0;
    else
        if(CE == 1'b1)
            if(LAST_MESSAGE_FROM_PADDING == 1'b1)
                last_perm_for_mess  <=  1'b1;
            else if(h_val == 1'b1)
                last_perm_for_mess  <=  1'b0;
            
end
//change name !!!!
assign WAIT_FOR_NEW_MESSAGE = wait_f_new_mess & !VALID_NEW_MESSAGE_FROM_PADDING;

always @(posedge CLK, posedge A_RST)
begin
    if(A_RST == 1'b1) begin
        state   <=  INIT;
        twenty_four_counter   <=  0;       
    end
        else if(CE == 1'b1) begin
                case(state)
                    INIT : begin
                        if(VALID_NEW_MESSAGE_FROM_PADDING == 1'b1) begin
                            state   <=  COUNTING;
                            twenty_four_counter   <=  1;
                        end else
                            twenty_four_counter   <=  0;
                    end
//                    NEW_MESS : begin
//                        state   <=  COUNTING;
//                    end
                    COUNTING :
                        if(twenty_four_counter  == 23) begin
                            if(last_perm_for_mess == 1'b1)
                                state   <=  VALID;
                            else
                                state   <=  WAIT_FOR_NEXT_MESS;                   
                            twenty_four_counter   <=  0;
                        end else 
                            twenty_four_counter   <=  twenty_four_counter + 1 ;
                        
                    WAIT_FOR_NEXT_MESS :
                        if(VALID_NEW_MESSAGE_FROM_PADDING == 1'b1) begin
                            state   <=  COUNTING;
                            twenty_four_counter   <=  1;
                        end
                    VALID :
                        state   <= WAIT_FOR_NEXT_MESS; 
                    default :
                        state   <=  INIT;
                endcase
            end
end

//always @(posedge CLK, posedge A_RST)
//begin
//    if(A_RST == 1'b1) begin
//        twenty_four_counter   <=  0;
//    end
//        else if(CE == 1'b1)
//            if(state == NEW_MESS || state == VALID || state == INIT)
//                twenty_four_counter <=  0;
//            else if(state == COUNTING)
//                twenty_four_counter <=  twenty_four_counter + 1;
//end

always_comb
begin
    if(state == VALID)
        h_val <=    1'b1;
    else
        h_val <=    1'b0;
end

always_comb
begin
    if(state == WAIT_FOR_NEXT_MESS || state == INIT || state == VALID)
        wait_f_new_mess =    1'b1;
    else
       wait_f_new_mess =    1'b0;
end

//always @(posedge CLK, posedge A_RST)
//begin
//    if(A_RST == 1'b1) begin
//        h_val   <=  1'b0;
//    end
//        else
//            if(CE == 1'b1) begin
//                if(wait_f_new_mess == 1'b1 && LAST_MESSAGE_FROM_PADDING == 1'b1)
//                    h_val   <=  1'b1;
//                else
//                    h_val   <=  1'b0;   
//            end
//end

assign HASH_VALID = h_val;

endmodule
