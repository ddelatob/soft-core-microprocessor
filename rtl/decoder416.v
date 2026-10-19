module decoder416(
    input [3:0] in,
    input en,
    output [15:0] out
);

wire not_in3, not_in3_and_en, in3_and_en;
not n0 (not_in3, in[3]);

and a0 (not_in3_and_en, not_in3, en);
and a1 (in3_and_en, in[3], en);

decoder38 d0(
    .in(in[2:0]),
    .en(not_in3_and_en),
    .out(out[7:0])
);

decoder38 d1(
    .in(in[2:0]),
    .en(in3_and_en),
    .out(out[15:8])
);


endmodule