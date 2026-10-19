module decoder532(
    input [4:0] in,
    input en,
    output [31:0] out
);

wire not_in4, not_in4_and_en, in4_and_en;

not n (not_in4, in[4]);
and a0 (not_in4_and_en, not_in4, en);
and a1 (in4_and_en, in[4], en);

decoder416 d0(
    .in(in[3:0]),
    .en(not_in4_and_en),
    .out(out[15:0])
);

decoder416 d1(
    .in(in[3:0]),
    .en(in4_and_en),
    .out(out[31:16])
);


endmodule