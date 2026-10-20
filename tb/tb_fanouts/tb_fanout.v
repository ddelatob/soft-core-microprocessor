module tb_fanout;
genvar i;
reg  test_in;
wire [31:0] test_out_array [1:31];

generate
    for (i = 1; i < 32; i = i + 1)
    begin : fanout_gen
        fanout #(
            .WIDTH(i)
        ) f_inst (
            .in(test_in),
            .out(test_out_array[i][i-1:0])
        );
        assign test_out_array[i][31:i] = 0;
    end     
endgenerate
integer j;
initial begin
    test_in = 1'b1;
    #10;
    for (j = 1; j < 32; j = j + 1) begin
        assert(test_out_array[j] == ((32'd1 << j)-1)) else $error("Error: test_out_array[%0d][%0d-1:0] = %0d, expected %0d", j, j, test_out_array[j], ((32'd1 << j)-1));
    end
end
endmodule;