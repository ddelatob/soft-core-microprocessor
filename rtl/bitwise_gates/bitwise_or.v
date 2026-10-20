module bitwise_or #(
    WIDTH = 32
)(
    input [WIDTH-1:0] in0,
    input [WIDTH-1:0] in1,
    output [WIDTH-1:0] out
);
genvar i;
generate
    for(i = 0; i < WIDTH; i = i + 1) begin : and_gen
        or a_inst(out[i], in0[i], in1[i]);
    end
endgenerate

endmodule