module tb_decoder21;
reg [1:0] test_in;
output [3:0] test_out;

decoder24 uut(
    .in(test_in),
    .out(test_out)
);

initial begin
    
end


endmodule;