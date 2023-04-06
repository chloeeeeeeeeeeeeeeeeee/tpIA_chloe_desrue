module adder8bit(a, b, cin, sum, cout);
  input [7:0] a;  // premier nombre
  input [7:0] b;  // deuxième nombre
  input cin;      // retenue d'entrée
  output [7:0] sum; // somme des deux nombres
  output cout;    // retenue de sortie

  assign{cout,s} = a+b+cin;

endmodule
