`timescale 1ns/1ps
 
module alu_register_tb ();
 
    localparam WIDTH = 8;
 
    reg              clk_i;
    reg              rst_i;
    reg  [WIDTH-1:0] first_i;
    reg  [WIDTH-1:0] second_i;
    reg  [2:0]       opcode_i;
    wire [WIDTH-1:0] result_o;
 
    alu_register #(.WIDTH(WIDTH))
        alu_register_inst
        (
            .clk_i(clk_i),
            .rst_i(rst_i),
            .first_i(first_i),
            .second_i(second_i),
            .opcode_i(opcode_i),
            .result_o(result_o)
        );
 
    always
    begin
        clk_i = 1'b0; #1;
        clk_i = 1'b1; #1;
    end
 
    initial
    begin
        $dumpvars;
        rst_i = 1'b0;
        #2;
        rst_i = 1'b1;
        @(posedge clk_i); #0.5;
        rst_i = 1'b0;
        @(posedge clk_i); #0.5;
 
        first_i = 8'b10101010;
        second_i = 8'b00000011;
        opcode_i = 3'b000;
        @(posedge clk_i); #0.5;
        opcode_i = 3'b001;
        @(posedge clk_i); #0.5;
        opcode_i = 3'b010;
        @(posedge clk_i); #0.5;
        opcode_i = 3'b011;
        @(posedge clk_i); #0.5;
        opcode_i = 3'b100;
        @(posedge clk_i); #0.5;
        opcode_i = 3'b101;
        @(posedge clk_i); #0.5;
        opcode_i = 3'b110;
        @(posedge clk_i); #0.5;
        opcode_i = 3'b111;
        @(posedge clk_i); #0.5;
        first_i = 8'd5;
        second_i = 8'd10;
        opcode_i = 3'b111;
        @(posedge clk_i); #0.5;
        $finish;
    end
 
endmodule
