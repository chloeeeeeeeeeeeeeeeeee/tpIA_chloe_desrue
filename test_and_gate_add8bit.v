`timescale 1ns/1ps

module adder8bit_tb;

  // Inputs
  reg [7:0] a;
  reg [7:0] b;
  reg cin;

  // Outputs
  wire [7:0] sum;
  wire cout;

  // Instantiate the Unit Under Test (UUT)
  adder8bit uut (
    .a(a), 
    .b(b), 
    .cin(cin), 
    .sum(sum), 
    .cout(cout)
  );

  initial begin
    // Initialize inputs
    a = 8'b00000001;
    b = 8'b00000010;
    cin = 1;

    // Wait for 100 ns for global reset to finish
    #100;

    // Add stimulus here
    // ...

    // Check the output
    $display("sum = %d, cout = %d", sum, cout);
  end

endmodule
