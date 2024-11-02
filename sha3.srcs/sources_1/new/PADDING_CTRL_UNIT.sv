`timescale 1ns / 1ps



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
    output logic [PAD_CNT_SIZE-1:0] CTRL_PAD_PTR,
    input logic PERMUTATION_READY,
    output logic CTRL_LAST_MESSAGE_FROM_PADDING
    );

typedef enum {  INIT, 
                COUNTING, 
                READ_NEXT, 
                WAIT_FOR_PERM_FINISH_PROCESSING,
                READ_NEXT_AFTER_WAIT,
                WAIT_FOR_PERM_AND_COUNTING,
                READ_NEXT_AFTER_WAIT_AND_COUNTING} padding_ctrl_states;

logic [BUF_CNT_SIZE-1:0] read_en_counter;
//logic read_en_det;

logic [PAD_CNT_SIZE-1:0] /*ctrl_pad,*/ pad_ptr_counter;    
//logic pad_en;

logic padding_req_flag;
//logic ctrl_last_mes_f_pad;
padding_ctrl_states STATE;

//write_en comb. logic   
//assign CTRL_BUF_WRITE_EN = DATA_IN_VALID && !BUF_FULL;



always@(posedge CLK, posedge A_RST)
begin
    if(A_RST == 1'b1)  begin
        STATE   <=  INIT;
    end
        else if(CE == 1'b1) begin
            case(STATE)
                INIT    :   
                    if(DATA_IN_VALID == 1'b1) begin
                        STATE           <=  COUNTING;
                    end
                COUNTING    : begin 
                    if(read_en_counter == IN_OUT_RATIO - 2 ) begin
                    //possible that for edge values like IN_OUT_RATIO-2 vali OFF not works
                    //and need to precise if instruction, to test 18.10
                        STATE           <=  READ_NEXT;                   
                    end else if(DATA_IN_VALID == 1'b0)begin
                        if(PERMUTATION_READY == 1'b0)
                            STATE           <=  READ_NEXT; 
                        else
                            STATE           <=  WAIT_FOR_PERM_FINISH_PROCESSING; 
                    end
                end 
                WAIT_FOR_PERM_FINISH_PROCESSING : begin
                    if(PERMUTATION_READY == 1'b0)
                        STATE           <=  READ_NEXT_AFTER_WAIT;
                    else if(DATA_IN_VALID == 1'b1)
                        STATE           <=  WAIT_FOR_PERM_AND_COUNTING;
                end
                WAIT_FOR_PERM_AND_COUNTING : begin
                    if(PERMUTATION_READY == 1'b0)
                        STATE           <=  READ_NEXT_AFTER_WAIT_AND_COUNTING; 
                    else if(DATA_IN_VALID == 1'b0)
                        STATE           <=  WAIT_FOR_PERM_FINISH_PROCESSING; //maybe to block? output notready                                                                         
                end        
                READ_NEXT   : begin
                    //read_en_counter <=  0;
                    if(DATA_IN_VALID == 1'b1)
                        STATE   <=  COUNTING;
                    else
                        STATE   <=  INIT;
                end 
                READ_NEXT_AFTER_WAIT : begin
                    if(DATA_IN_VALID == 1'b1)
                        STATE   <=  COUNTING;
                    else
                        STATE   <=  INIT;
                end
                READ_NEXT_AFTER_WAIT_AND_COUNTING : begin
                     if(DATA_IN_VALID == 1'b1)
                        STATE   <=  COUNTING;
                    else
                        STATE   <=  INIT;
                end      
                default : 
                    STATE   <=  INIT;
            endcase
        end
end 

always_comb
begin
    if(BUF_FULL == 1'b0)
        case(STATE)
            INIT :
                CTRL_BUF_WRITE_EN   <=  1'b0;
            COUNTING :
                //if(DATA_IN_VALID)
                    CTRL_BUF_WRITE_EN   <=  1'b1;
                //else
                    //CTRL_BUF_WRITE_EN   <=  1'b0;
            WAIT_FOR_PERM_FINISH_PROCESSING :
                //if(DATA_IN_VALID)
                    //CTRL_BUF_WRITE_EN   <=  1'b1;
                //else
                    CTRL_BUF_WRITE_EN   <=  1'b0;
            WAIT_FOR_PERM_AND_COUNTING :
                CTRL_BUF_WRITE_EN   <=  1'b1;
            READ_NEXT :
                if(DATA_IN_VALID)
                    CTRL_BUF_WRITE_EN   <=  1'b1;
                else
                    CTRL_BUF_WRITE_EN   <=  1'b0;
            READ_NEXT_AFTER_WAIT :
                if(DATA_IN_VALID)
                    CTRL_BUF_WRITE_EN   <=  1'b1;
                else
                    CTRL_BUF_WRITE_EN   <=  1'b0;
            READ_NEXT_AFTER_WAIT_AND_COUNTING :
                if(DATA_IN_VALID)
                    CTRL_BUF_WRITE_EN   <=  1'b1;
                else
                    CTRL_BUF_WRITE_EN   <=  1'b0;       
            default :
                CTRL_BUF_WRITE_EN   <=  1'b0;
        endcase
    else
        CTRL_BUF_WRITE_EN   <=  1'b0;
end

always@(posedge CLK, posedge A_RST)
begin
    if(A_RST == 1'b1) begin
        CTRL_BUF_READ_EN    <=  1'b0;
    end else
        if(CE == 1'b1) begin
            if(STATE == READ_NEXT)
                CTRL_BUF_READ_EN    <=  1'b1;          
            else if(STATE == READ_NEXT_AFTER_WAIT)
                CTRL_BUF_READ_EN    <=  1'b1;
            else if(STATE == READ_NEXT_AFTER_WAIT_AND_COUNTING)
                CTRL_BUF_READ_EN    <=  1'b1;
            else
                CTRL_BUF_READ_EN    <=  1'b0;
        end
end

//always@(posedge CLK, posedge A_RST)
//begin
//    if(A_RST == 1'b1) begin
//        read_en_counter    <=  1'b0;
//    end else
//        if(CE == 1'b1) begin
//            if(STATE == READ_NEXT && BUF_FULL == 1'b0)
//                CTRL_BUF_READ_EN    <=  1'b1;
//            else
//                CTRL_BUF_READ_EN    <=  1'b0;
//        end
//end

//read_en seq. logic
always@(posedge CLK, posedge A_RST)
begin
    if(A_RST == 1'b1) begin
        read_en_counter     <= 0;
        pad_ptr_counter     <= IN_OUT_RATIO - 1;
    end
        else if(CE == 1'b1) begin
            case(STATE)
                INIT : begin
                    read_en_counter     <= 0;
                    pad_ptr_counter     <= IN_OUT_RATIO - 1;
                end
                COUNTING : begin
                    read_en_counter     <= read_en_counter + 1;
                    if(DATA_IN_VALID == 1'b1) 
                        pad_ptr_counter     <= pad_ptr_counter - 1;
                end
                WAIT_FOR_PERM_FINISH_PROCESSING : begin
                    //read_en_counter     <= read_en_counter + 1;
                    /*if(DATA_IN_VALID == 1'b1)  begin
                        pad_ptr_counter     <=  pad_ptr_counter - 1;
                        read_en_counter     <= read_en_counter + 1;
                    end else*/ if(PERMUTATION_READY == 1'b1) begin
                        pad_ptr_counter     <=  IN_OUT_RATIO - 1;
                        read_en_counter     <=  0;
                    end
                end
                WAIT_FOR_PERM_AND_COUNTING : begin
                    read_en_counter     <= read_en_counter + 1;
                    if(DATA_IN_VALID == 1'b1)
                        pad_ptr_counter     <=  pad_ptr_counter - 1;                   
                end                               
                READ_NEXT : begin
                    read_en_counter     <= 0;
                    pad_ptr_counter     <= IN_OUT_RATIO - 1;
                end
                READ_NEXT_AFTER_WAIT : begin
                    /*if(DATA_IN_VALID == 1'b1) begin
                        read_en_counter     <= read_en_counter + 1;
                        if(DATA_IN_VALID == 1'b1) 
                            pad_ptr_counter     <= pad_ptr_counter - 1;
                        end*/
                    read_en_counter     <= 0;
                    pad_ptr_counter     <= IN_OUT_RATIO - 1;
                end
                READ_NEXT_AFTER_WAIT_AND_COUNTING : begin                   
                    if(DATA_IN_VALID == 1'b1) begin
                        pad_ptr_counter     <= pad_ptr_counter - 1;
                        read_en_counter     <= read_en_counter + 1;
                    end else begin
                        read_en_counter     <= 0;
                        pad_ptr_counter     <= IN_OUT_RATIO - 1;
                    end                    
                end
                default: begin
                    read_en_counter <= 0;
                    pad_ptr_counter <= IN_OUT_RATIO - 1;
               end     
            endcase
        end
end    

//assign CTRL_BUF_READ_EN = read_en_det;
//assign CTRL_BUF_READ_EN = (DATA_IN_VALID == 1'b1 && BUF_EMPTY == 1'b0 && read_en_counter == IN_OUT_RATIO - 1) ? 1'b1 : 1'b0;

//padding detecting
//always@(posedge CLK, posedge A_RST)
//begin
//    if(A_RST == 1'b1) begin
//        pad_ptr_counter <=  1;
//        pad_en          <=  1'b0;
//    end
//        else begin
//            if(CE == 1'b1) begin 
//                if(DATA_IN_VALID == 1'b1 && BUF_FULL == 1'b0) begin
//                    if(pad_ptr_counter == IN_OUT_RATIO) begin
//                        pad_ptr_counter    <=  1;
//                        pad_en             <=  1'b0;
//                    end else begin
//                        pad_ptr_counter     <=  pad_ptr_counter + 1;    
//                    end
//                end else begin
//                    if(DATA_IN_VALID == 1'b0)
//                        pad_en  <= 1'b1;
//                end
//            end      
//        end
//end

//pad_ptr seq. logic
always@(posedge CLK, posedge A_RST)
begin
    if(A_RST == 1'b1) begin
        CTRL_PAD_PTR        <=  0;
        //padding_req_flag    <= 1'b1;
    end
       else if(CE == 1'b1) begin
                if(STATE == READ_NEXT ) begin
                    //if(padding_req_flag == 1'b1) 
                        CTRL_PAD_PTR    <=  pad_ptr_counter;
                    //padding_req_flag    <=  1'b1;
                end
                else if(STATE == COUNTING && DATA_IN_VALID == 1'b0 && PERMUTATION_READY == 1'b1) begin
                    CTRL_PAD_PTR        <=  pad_ptr_counter;
                    //padding_req_flag    <=  1'b0;
                end
            end
   
end

always@(posedge CLK, posedge A_RST)
begin
    if(A_RST == 1'b1)
        CTRL_LAST_MESSAGE_FROM_PADDING <= 1'b0;
    else
        if(CE == 1'b1) begin
            if((STATE == WAIT_FOR_PERM_FINISH_PROCESSING 
            || STATE == WAIT_FOR_PERM_AND_COUNTING
            || (STATE == READ_NEXT && DATA_IN_VALID == 1'b0)
            ) && PERMUTATION_READY == 1'b0)
                CTRL_LAST_MESSAGE_FROM_PADDING  <=  1'b1;
            else
                CTRL_LAST_MESSAGE_FROM_PADDING  <=  1'b0;
                //posible that this not cover case when message legnth is dividable by IN_OUT_RATIO
        end
end
endmodule
