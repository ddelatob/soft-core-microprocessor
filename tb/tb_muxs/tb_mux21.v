module tb_mux21;
    reg [0:0] test_in [1:0];
    reg test_sel;
    wire [0:0] test_out;

    mux21 #(
        .WIDTH(1)
    ) uut (
        .in(test_in),
        .sel(test_sel),
        .out(test_out)
    );

    reg [31:0] test_in2 [1:0];
    reg test_sel2;
    wire [31:0] test_out2;

    mux21 #(
        .WIDTH(32)
    ) uut2 (
        .in(test_in2),
        .sel(test_sel2),
        .out(test_out2)
    );

    initial begin
        test_sel = 0;
        test_in[0] = 1'b1;
        test_in[1] = 1'b0;

        #10;
        assert(test_out == test_in[0]) else $error("test_sel = 0, target_out = $b, test_out = $b", test_in[0], test_out);

        test_sel = 1;
        #10;
        assert(test_out == test_in[1]) else $error("test_sel = 1, target_out = $b, test_out = $b", test_in[1], test_out);

        test_sel2 = 0;
        test_in2[0] = 32'h0000;
        test_in2[1] = 32'hFFFF;

        #10;
        assert(test_out2 == test_in2[0]) else $error("test_sel2 = 0, target_out2 = $b, test_out2 = $b", test_in2[0], test_out2);

        test_sel2 = 1;
        #10;
        assert(test_out2 == test_in2[1]) else $error("test_sel2 = 1, target_out2 = $b, test_out2 = $b", test_in2[1], test_out2);


        $finish;
    end
    
endmodule
