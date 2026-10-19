module mux21 (
    input a,
    input b,
    input sel,
    output out
);
    wire not_sel;
    wire w1, w2;

    not u1 (not_sel, sel);
    and u2 (w1, a, not_sel);
    and u3 (w2, b, sel);
    or u4 (out, w1, w2);
endmodule
