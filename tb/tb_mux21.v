module tb_mux21;
    reg test_a;
    reg test_b;
    reg test_sel;
    wire test_out;

    mux21 uut (
        .a(test_a),
        .b(test_b),
        .sel(test_sel),
        .out(test_out)
    );
    initial begin
        $monitor("Time=%0t | sel=%b | a=%b b=%b | out=%b", $time, test_sel, test_a, test_b, test_out);
        test_a = 0; test_b = 1; test_sel = 0; #10;
        test_sel = 1;
        test_a = 1; test_b = 0; test_sel = 0; #10;
        $finish;
    end
    
endmodule
