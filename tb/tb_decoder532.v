module tb_decoder532;

integer i;
reg [31:0] target_out;

reg [4:0] test_in;
reg test_en;
wire [31:0] test_out;

decoder532 d(
    .in(test_in),
    .en(test_en),
    .out(test_out)
);

initial begin
    target_out = 32'h00000;
    test_en = 1'b1;
    for (i = 0; i <= 31; i = i + 1) begin
        test_in = i[4:0];
        #10;
        target_out = (32'h00000001 << i);
        assert(test_out == target_out) else $error("Error: test_in = %b, test_en = 1, test_out = %b, target_out = %b", test_in, test_out, target_out);
    end

    target_out = 32'h00000;
    test_en = 1'b0;
    for (i = 0; i <= 31; i = i + 1) begin
        test_in = i[4:0];
        #10;
        assert(test_out == target_out) else $error("Error: test_in = %b, test_en = 0, test_out = %b, target_out = %b", test_in, test_out, target_out);
    end
end
endmodule