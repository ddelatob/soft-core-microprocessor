module tb_mux21;
    integer i;
    reg [1:0] test_in;
    reg test_sel;
    wire test_out;

    mux21 uut (
        .in(test_in),
        .sel(test_sel),
        .out(test_out)
    );
    initial begin
        test_sel = 0;
        for(i=0; i <= 3; i = i + 1) begin
            test_in = i[1:0];
            #10;
            assert(test_out == i[0]) else $error("test_in = %b, test_sel = 1, target_out = $b, test_out = $b", test_in, i[0], test_out);
        end
        test_sel = 1;
        for(i=0; i <= 3; i = i + 1) begin
            test_in = i[1:0];
            #10;
            assert(test_out == i[1]) else $error("test_in = %b, test_sel = 1, target_out = $b, test_out = $b", test_in, i[1], test_out);
        end


        $finish;
    end
    
endmodule
