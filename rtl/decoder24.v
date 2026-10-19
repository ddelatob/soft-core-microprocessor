module decoder24 (
    input [1:0] in,
    output [3:0] out
);

wire not_in0, not_in1;

not n0 (not_in0, in[0]);
not n1 (not_in1, in[1]);

and a0(out[0], not_in0, not_in1);
and a1(out[1], in[0], not_in1);
and a2(out[2], not_in0, in[1]);
and a3(out[3], in[0], in[1]);

endmodule