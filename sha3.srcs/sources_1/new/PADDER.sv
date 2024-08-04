`timescale 1ns / 1ps

module PADDER #(
    parameter DATA_WIDTH = 128,
    parameter DATA_PART_WIDTH = 32,
    localparam RATIO = DATA_WIDTH/DATA_PART_WIDTH,
    localparam PTR_SIZE = $clog2(RATIO + 1)
    //pointer have to be so width to reprezent a RATIO+1 values
    //bcs this signal is representanting RATION number of values which represent
    //from which word module should start padding and also one more which means
    //that padding is not required 
)   (  
    input logic [DATA_WIDTH-1:0] PADDER_IN,
    output logic [DATA_WIDTH-1:0] PADDER_OUT,
    input logic [PTR_SIZE-1:0]  PAD_PTR
);

//always_comb begin
//    if(PAD_PTR == RATIO - 1) begin
//        PADDER_OUT  =   {PADDER_IN[DATA_WIDTH - 1:DATA_PART_WIDTH],
//                        2'b11,
//                        {(DATA_PART_WIDTH-3){1'b0}},
//                        1'b1};  
//    end else begin
//        PADDER_OUT  =   {PADDER_IN[DATA_WIDTH - 1:DATA_PART_WIDTH*PAD_PTR],
//                        2'b11,
//                        {(DATA_PART_WIDTH-3){1'b0}},
//                        1'b1};
//    end
//end

genvar i;
generate
    for(i = 0; i < RATIO; i = i + 1) begin
        //generating a padded (or not) responde, bit width a same like in a permutation module input
        //in each iteration of 'for' loop output connection is determined by ratio local param
        //but logic value of value is determined by PTR_SIZE values and obviously input
        assign PADDER_OUT[(i+1)*DATA_PART_WIDTH-1:i*DATA_PART_WIDTH] = 
            i + PAD_PTR < RATIO ? PADDER_IN[(i+1)*DATA_PART_WIDTH-1:i*DATA_PART_WIDTH]
            //if 'i+PAD_PTR' result is equal less than RATIO it means that
            //padding shouldn't been applied yet to this word or
            //generralny not this part of output message (PAD_PTR == 0)
                : (i + PAD_PTR == RATIO ?
                //this case is about first part of padding
                //valid message finished and now should be padded
                    (PAD_PTR == 1   ? {1'b1,{(DATA_PART_WIDTH-4){1'b0}},2'b11,1'b0}
                    //this nested case is about padding applied only to one word
                    //means that last bits of product contains also logic values
                    //identifing end of padding               
                    : {{(DATA_PART_WIDTH-3){1'b0}},2'b11,1'b0})
                    //in the remaining cases padding starts, but not finish in this word       
                : (i == RATIO - 1 ? {1'b1,{(DATA_PART_WIDTH-1){1'b0}}}
                //here are other case of last word of padding, 
                //but without PAD_PTR = 1; it was covered in previous cases
                : {DATA_PART_WIDTH{1'b0}})
                //the default case is about "zeros" beetwen words starting padding
                //and finishing padding
                );   
    end
endgenerate
//to check !!!! 03 07 2024

endmodule
