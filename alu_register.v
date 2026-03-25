module alu_register #(parameter WIDTH = 8)
(
    input              clk_i,
    input              rst_i,
    input  [WIDTH-1:0] first_i,
    input  [WIDTH-1:0] second_i,
    input  [2:0]       opcode_i,
    output [WIDTH-1:0] result_o
);
 
    reg [WIDTH-1:0] result;
 
    always @(posedge clk_i)
    begin
        if(rst_i)
        begin
            result <= {WIDTH{1'b0}};
        end
        else
        begin
            case (opcode_i)
                3'b000: result <= ~(first_i & second_i);
                3'b001: result <= first_i ^ second_i;
                3'b010: result <= first_i + second_i;
                3'b011: result <= $signed(first_i) >>> second_i;
                3'b100: result <= first_i | second_i;
                3'b101: result <= first_i << second_i;
                3'b110: result <= ~first_i;
                3'b111: result <= {{(WIDTH-1){1'b0}}, (first_i < second_i)};
            endcase
        end
    end
 
    assign result_o = result;
 
endmodule
