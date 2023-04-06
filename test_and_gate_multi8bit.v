module multiplier_8b(a, b, result);

input [7:0] a;  // vecteur d'entrée a
input [7:0] b;  // vecteur d'entrée b
output [15:0] result;  // vecteur de sortie result

wire [7:0] temp [0:7];

genvar i, j;
generate
    for (i = 0; i < 8; i = i + 1) begin : shift_register
        assign temp[i] = {8{i'b0}, a[i]} << i;
    end

    for (i = 0; i < 8; i = i + 1) begin : partial_products
        assign result[i+7: i] = temp[i] & {8{b[i]}};
    end

    assign result[15] = |result[14:0];

endgenerate

endmodule

module multiplier_8b_tb;

reg [7:0] a;
reg [7:0] b;
wire [15:0] result;

multiplier_8b dut(
    .a(a),
    .b(b),
    .result(result)
);

initial begin
    // Test 1: 2 x 3 = 6
    a = 2;
    b = 3;
    #10;
    if (result !== 6) $display("Test 1 failed. Expected: 6, Actual: %d", result);

    // Test 2: 5 x 7 = 35
    a = 5;
    b = 7;
    #10;
    if (result !== 35) $display("Test 2 failed. Expected: 35, Actual: %d", result);

    // Add more tests here...
end

endmodule
