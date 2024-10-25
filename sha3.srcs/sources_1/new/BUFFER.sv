`timescale 1ns / 1ps

module BUFFER #(
    parameter WRITE_DATA_WIDTH  =   32,
    parameter READ_DATA_WIDTH   =   32,
    parameter DEPTH             =   16,
    localparam IN_OUT_RATIO     =   READ_DATA_WIDTH/WRITE_DATA_WIDTH,
    localparam PTR_SIZE         =   $clog2(DEPTH)
)   (
    input logic CLK,
    input logic A_RST,
    input logic CE,
    input logic [WRITE_DATA_WIDTH-1:0] WRITE_DATA,
    input logic WRITE_EN,
    output logic [READ_DATA_WIDTH-1:0] READ_DATA,
    input logic READ_EN,
    output logic FULL,
    output logic EMPTY
);

logic [WRITE_DATA_WIDTH-1:0] mem[DEPTH];
logic [PTR_SIZE:0] wrPtr/*, wrPtrNext*/;
logic [PTR_SIZE:0] rdPtr/*, rdPtrNext*/;
logic [READ_DATA_WIDTH-1:0] rdData;

integer i;
always_ff @(posedge CLK, posedge A_RST) begin
    if(A_RST == 1'b1) begin
        wrPtr   <=  0;
        rdPtr   <=  0;
        for (i=0;i<DEPTH;i=i+1) begin
            mem[i]  <=  0;
        end
    end else 
        begin
        if(CE == 1'b1) begin
            if(WRITE_EN) begin          
                //wrPtr = wrPtr + 1;
                if(wrPtr[PTR_SIZE-1:0] + 1 == DEPTH) begin
                    wrPtr[PTR_SIZE] = ~wrPtr[PTR_SIZE];
                    wrPtr[PTR_SIZE-1:0] = 0;
                end else
                    wrPtr = wrPtr + 1;
            end else begin
                if(!(wrPtr[PTR_SIZE-1:0] == rdPtr[PTR_SIZE-1:0]))
                    if(rdPtr[PTR_SIZE-1:0] + IN_OUT_RATIO >= DEPTH)
                        wrPtr = rdPtr + IN_OUT_RATIO - DEPTH;
                    else
                        wrPtr = rdPtr + IN_OUT_RATIO;
                else
                    wrPtr = rdPtr;
            end                      
            //end else
                //wrPtr = rdPtr;
            if (READ_EN) begin
                //rdPtr = rdPtr + IN_OUT_RATIO;
                if(rdPtr[PTR_SIZE-1:0] + IN_OUT_RATIO >= DEPTH) begin
                    rdPtr[PTR_SIZE] = ~rdPtr[PTR_SIZE];
                    rdPtr[PTR_SIZE-1:0] = rdPtr[PTR_SIZE-1:0] + IN_OUT_RATIO - DEPTH;
                end else
                    //if(wrPtr[PTR_SIZE-1:0] < rdPtr[PTR_SIZE-1:0] + IN_OUT_RATIO)
                        //rdPtr[PTR_SIZE-1:0] = wrPtr[PTR_SIZE-1:0];
                    //else
                    rdPtr = rdPtr + IN_OUT_RATIO;
            end
        end
    end
    mem[wrPtr[PTR_SIZE-1:0]]    <=  WRITE_DATA;
end 


genvar j;
generate
    for (j=0; j<IN_OUT_RATIO;j=j+1) begin
        //assign rdData[(j+1)*WRITE_DATA_WIDTH-1:j*WRITE_DATA_WIDTH] = mem[rdPtr[PTR_SIZE-1:0]+j];
        assign rdData[(IN_OUT_RATIO-j)*WRITE_DATA_WIDTH-1:(IN_OUT_RATIO-j-1)*WRITE_DATA_WIDTH] = mem[rdPtr[PTR_SIZE-1:0]+j];
    end
endgenerate

always_ff @(posedge CLK, posedge A_RST) 
begin
    if(A_RST == 1'b1) begin
        READ_DATA   <=  0;
    end
        else begin
            if(CE == 1'b1) begin
                if(READ_EN == 1'b1)
                    READ_DATA <= rdData;
            end
        end
end

assign EMPTY = (wrPtr[PTR_SIZE] == rdPtr[PTR_SIZE]) && (wrPtr[PTR_SIZE-1:0] == rdPtr[PTR_SIZE-1:0]);
assign FULL = (wrPtr[PTR_SIZE] != rdPtr[PTR_SIZE]) && (wrPtr[PTR_SIZE-1:0] == rdPtr[PTR_SIZE-1:0]);

endmodule
