module mux21 (
    input [1:0] in,
    input sel,
    output out
);
    wire not_sel;
    wire w1, w2;

    not u1 (not_sel, sel);
    and u2 (w1, in[0], not_sel);
    and u3 (w2, in[1], sel);
    or u4 (out, w1, w2);
endmodule
