module fanout #(
    parameter WIDTH = 32
)(
    input in,
    output [WIDTH-1:0] out
);
genvar i;
generate
    for (i = 0; i < WIDTH; i = i + 1) begin : buf_gen
        buf b_inst(out[i], in);
    end
endgenerate 
endmodule