module tb_decoder21;
reg [1:0] test_in;
wire [3:0] test_out;

decoder24 uut(
    .in(test_in),
    .out(test_out)
);

initial begin
    test_in = 2'b00; #10;

    assert (test_out == 4'b0001) else $error("Error: Input: 00, got %b, expected 0001", test_out);

    test_in = 2'b01; #10;
    assert (test_out == 4'b0010) else $error("Error: Input: 01, got %b, expected 0010", test_out);
    $finish;
end


endmodule;