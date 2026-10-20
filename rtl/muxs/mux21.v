module mux21 #(
    parameter WIDTH = 32
)(
    input [WIDTH-1:0] in [1:0],
    input sel,
    output [WIDTH-1:0] out
);
    wire not_sel;
    not u0 (not_sel, sel);

    wire [WIDTH-1:0] w [1:0];
    wire [WIDTH-1:0] expanded_sel;
    wire [WIDTH-1:0] expanded_not_sel;

    fanout #(
        .WIDTH(WIDTH)
    ) f0 (
        .in(sel),
        .out(expanded_sel)
    );

    fanout #(
        .WIDTH(WIDTH)
    ) f1 (
        .in(not_sel),
        .out(expanded_not_sel)
    );

    
    bitwise_and #(
        .WIDTH(WIDTH)
    ) u1 (
        .in0(in[0]),
        .in1(expanded_not_sel),
        .out(w[0])
    );

    bitwise_and #(
        .WIDTH(WIDTH)
    ) u2 (
        .in0(in[1]),
        .in1(expanded_sel),
        .out(w[1])
    );

    bitwise_or #(
        .WIDTH(WIDTH)
    ) u4 (
        .in0(w[0]),
        .in1(w[1]),
        .out(out)
    );
endmodule
