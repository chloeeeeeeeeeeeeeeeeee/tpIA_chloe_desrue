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
