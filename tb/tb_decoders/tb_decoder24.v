module tb_decoder21;
reg [1:0] test_in;
reg test_en;
wire [3:0] test_out;


decoder24 uut(
    .in(test_in),
    .out(test_out),
    .en(test_en)
);

initial begin
    test_en = 1'b1;

    test_in = 2'b00; #10;
    assert (test_out == 4'b0001) else $error("Error: Input: 00, got %b, expected 0001", test_out);

    test_in = 2'b01; #10;
    assert (test_out == 4'b0010) else $error("Error: Input: 01, got %b, expected 0010", test_out);

    test_in = 2'b10; #10;
    assert (test_out == 4'b0100) else $error("Error: Input: 01, got %b, expected 0010", test_out);

    test_in = 2'b11; #10;
    assert (test_out == 4'b1000) else $error("Error: Input: 01, got %b, expected 0010", test_out);

    test_en = 1'b0;

    test_in = 2'b00; #10;
    assert (test_out == 4'b0000) else $error("Error: Input: 00, got %b, expected 0000", test_out);

    test_in = 2'b01; #10;
    assert (test_out == 4'b0000) else $error("Error: Input: 01, got %b, expected 0000", test_out);

    test_in = 2'b10; #10;
    assert (test_out == 4'b0000) else $error("Error: Input: 01, got %b, expected 0000", test_out);

    test_in = 2'b11; #10;
    assert (test_out == 4'b0000) else $error("Error: Input: 01, got %b, expected 0000", test_out);
    $finish;
end


endmodule;