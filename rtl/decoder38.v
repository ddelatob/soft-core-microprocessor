module decoder38(
    input [2:0] in,
    input en,
    output [7:0] out
);

wire not_in2, not_in2_and_en, in2_and_en;
not n0 (not_in2, in[2]);

and a0 (not_in2_and_en, not_in2, en);
and a1 (in2_and_en, in[2], en);

decoder24 d0(
    .in(in[1:0]),
    .out(out[3:0]),
    .en(not_in2_and_en)
);

decoder24 d1(
    .in(in[1:0]),
    .out(out[7:4]),
    .en(in2_and_en)
);

endmodule