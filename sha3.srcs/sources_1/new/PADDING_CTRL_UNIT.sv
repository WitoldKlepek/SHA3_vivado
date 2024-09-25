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
    output logic [PAD_CNT_SIZE-1:0] CTRL_PAD_PTR 
    );

typedef enum {INIT, COUNTING, READ_NEXT} padding_ctrl_states;

logic [BUF_CNT_SIZE-1:0] read_en_counter;
//logic read_en_det;

logic [PAD_CNT_SIZE-1:0] /*ctrl_pad,*/ pad_ptr_counter;    
//logic pad_en;

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
                    if(read_en_counter == IN_OUT_RATIO - 2) begin
                        STATE           <=  READ_NEXT;                   
                    end
                end        
                READ_NEXT   : begin
                    read_en_counter <=  0;
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
                CTRL_BUF_WRITE_EN   <=  1'b1;
            READ_NEXT :
                CTRL_BUF_WRITE_EN   <=  1'b1;
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
            else
                CTRL_BUF_READ_EN    <=  1'b0;
        end
end

always@(posedge CLK, posedge A_RST)
begin
    if(A_RST == 1'b1) begin
        read_en_counter    <=  1'b0;
    end else
        if(CE == 1'b1) begin
            if(STATE == READ_NEXT && BUF_FULL == 1'b0)
                CTRL_BUF_READ_EN    <=  1'b1;
            else
                CTRL_BUF_READ_EN    <=  1'b0;
        end
end

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
                READ_NEXT : begin
                    read_en_counter     <= 0;
                    pad_ptr_counter     <= IN_OUT_RATIO - 1;
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
        CTRL_PAD_PTR    <=  0;
    end
       else if(CE == 1'b1) begin
                if(STATE == READ_NEXT) 
                    if(pad_ptr_counter == 0)
                        CTRL_PAD_PTR    <=  0;
                    else
                        CTRL_PAD_PTR    <=  pad_ptr_counter;
            end
   
end

endmodule
