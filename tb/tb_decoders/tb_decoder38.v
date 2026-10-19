module tb_decoder38;
integer i;
reg [7:0] target_out;

reg [2:0] test_in;
reg test_en;
wire [7:0] test_out;

decoder38 d(
    .in(test_in),
    .en(test_en),
    .out(test_out)
);

initial begin
    target_out = 8'b00000001;
    test_en = 1;

    for (i = 0; i < 8; i = i + 1) begin
        test_in = i[2:0];
        #10;
        assert(test_out == target_out) else $error("Error: test_in = %b, en = 1, target_out = %b, test_out = %b", test_in, target_out, test_out);
        target_out = target_out << 1;
    end

    target_out = 8'b00000000;
    test_en = 0;

    for (i = 0; i < 8; i = i + 1) begin
        test_in = i[2:0];
        #10;
        assert(test_out == target_out) else $error("Error: test_in = %b, en = 0, target_out = %b, test_out = %b", test_in, target_out, test_out);
    end
    $finish;
end

endmodule