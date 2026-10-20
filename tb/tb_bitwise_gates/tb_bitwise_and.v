module tb_bitwise_and;

reg [31:0] target_out;

reg [0:0] ina0;
reg [0:0] ina1;
wire [0:0] outa;

reg [31:0] inb0;
reg [31:0] inb1;
wire [31:0] outb;


bitwise_and #(
    .WIDTH(1)
) a0 (
    .in0(ina0),
    .in1(ina1),
    .out(outa)
);

bitwise_and #(
    .WIDTH(32)
) a1 (
    .in0(inb0),
    .in1(inb1),
    .out(outb)
);

initial begin
    ina0 = 1'b0;
    ina1 = 1'b0;
    #10;
    assert(outa == 1'b0) else $error("Error: ina0 = %d, ina1 = %d, outa = %d, expected 0", ina0, ina1, outa);

    ina0 = 1'b1;
    ina1 = 1'b0;
    #10;
    assert(outa == 1'b0) else $error("Error: ina0 = %d, ina1 = %d, outa = %d, expected 0", ina0, ina1, outa);

    ina0 = 1'b0;
    ina1 = 1'b1;
    #10;
    assert(outa == 1'b0) else $error("Error: ina0 = %d, ina1 = %d, outa = %d, expected 0", ina0, ina1, outa);

    ina0 = 1'b1;
    ina1 = 1'b1;
    #10;
    assert(outa == 1'b1) else $error("Error: ina0 = %d, ina1 = %d, outa = %d, expected 1", ina0, ina1, outa);
end

initial begin
    inb0 = 32'h00000000;
    inb1 = 32'h00000000;
    target_out = 32'h00000000;
    #10;
    
    assert(outb == target_out) else $error("Error: inb0 = %d, inb1 = %d, outb = %d, expected %d", inb0, inb1, outb, target_out);

    inb0 = 32'h0000001;
    inb1 = 32'h00000000;
    target_out = 32'h00000000;
    #10;
    
    assert(outb == target_out) else $error("Error: inb0 = %d, inb1 = %d, outb = %d, expected %d", inb0, inb1, outb, target_out);

    inb0 = 32'h00000000;
    inb1 = 32'h00000001;
    target_out = 32'h00000000;
    #10;
    
    assert(outb == target_out) else $error("Error: inb0 = %d, inb1 = %d, outb = %d, expected %d", inb0, inb1, outb, target_out);

    inb0 = 32'h00000000;
    inb1 = 32'h10000000;
    target_out = 32'h00000000;
    #10;
    
    assert(outb == target_out) else $error("Error: inb0 = %d, inb1 = %d, outb = %d, expected %d", inb0, inb1, outb, target_out);

    inb0 = 32'h10000000;
    inb1 = 32'h00000000;
    target_out = 32'h00000000;
    #10;
    
    assert(outb == target_out) else $error("Error: inb0 = %d, inb1 = %d, outb = %d, expected %d", inb0, inb1, outb, target_out);

    inb0 = 32'h00001000;
    inb1 = 32'h10000000;
    target_out = 32'h00000000;
    #10;
    
    assert(outb == target_out) else $error("Error: inb0 = %d, inb1 = %d, outb = %d, expected %d", inb0, inb1, outb, target_out);

    inb0 = 32'h10000000;
    inb1 = 32'h00001000;
    target_out = 32'h00000000;
    #10;
    
    assert(outb == target_out) else $error("Error: inb0 = %d, inb1 = %d, outb = %d, expected %d", inb0, inb1, outb, target_out);

    inb0 = 32'h10000000;
    inb1 = 32'h10000000;
    target_out = 32'h10000000;
    #10;
    
    assert(outb == target_out) else $error("Error: inb0 = %d, inb1 = %d, outb = %d, expected %d", inb0, inb1, outb, target_out);

    inb0 = 32'h11000000;
    inb1 = 32'h11000000;
    target_out = 32'h11000000;
    #10;
    
    assert(outb == target_out) else $error("Error: inb0 = %d, inb1 = %d, outb = %d, expected %d", inb0, inb1, outb, target_out);


end
endmodule