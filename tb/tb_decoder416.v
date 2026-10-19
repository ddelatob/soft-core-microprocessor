module tb_decoder416;
integer i;
reg [15:0] target_out;

reg [3:0] test_in;
reg test_en;
wire [15:0] test_out;

decoder416 d(
    .in(test_in),
    .en(test_en),
    .out(test_out)
);

initial begin
    target_out = 1;
    test_en = 1;
    for(i = 0; i <= 15; i = i + 1) begin
        test_in = i[3:0];
        #10;
        assert(test_out == target_out) else $error("Error: test_in = %b, test_en = 1, test_out = %b, target_out = %b", test_in, test_out, target_out);
        target_out = target_out << 1;
    end
    $finish;

    target_out = 16'h0000;
    test_en = 0;
    for(i = 0; i <= 15; i = i + 1) begin
        test_in = i[3:0];
        #10;
        assert(test_out == target_out) else $error("Error: test_in = %b, test_en = 0, test_out = %b, target_out = %b", test_in, test_out, target_out);
        target_out = target_out << 1;
    end
    $finish;
end
    
endmodule