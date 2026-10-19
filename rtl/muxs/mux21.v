module mux21 #(
    parameter WIDTH = 32
)(
    input [WIDTH-1:0] in [1:0],
    input sel,
    output [WIDTH-1:0] out
);
    wire not_sel;
    wire w1, w2;

    not u1 (not_sel, sel);
    and u2 (w1, in[0], not_sel);
    and u3 (w2, in[1], sel);
    or u4 (out, w1, w2);
endmodule
