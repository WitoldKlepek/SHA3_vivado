`timescale 1ns / 1ps

module PADDER #(
    parameter DATA_WIDTH = 128,
    parameter DATA_PART_WIDTH = 32,
    localparam RATIO = DATA_WIDTH/DATA_PART_WIDTH,
    localparam PTR_SIZE = $clog2(RATIO + 1) 
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
        assign PADDER_OUT[(i+1)*DATA_PART_WIDTH-1:i*DATA_PART_WIDTH] = 
            i <= PAD_PTR ? PADDER_IN[(i+1)*DATA_PART_WIDTH-1:i*DATA_PART_WIDTH] 
                        : (i+1 == PAD_PTR ?
                            (PAD_PTR == 1   ? {2'b11,{(DATA_PART_WIDTH-3){1'b0}},1'b1} 
                                            : {2'b11,{(DATA_PART_WIDTH-2){1'b0}}})       
                        : (i == 0 ? {{(DATA_PART_WIDTH-1){1'b0}},1'b1}
                        : {DATA_PART_WIDTH{1'b0}})
                        );   
    end
endgenerate
//to check !!!! 03 07 2024

endmodule
