module and_gate (e1, e2, s, r);
    input e1;
    input e2;
    output s;
    output r;


    assign s = e1 ^ e2;
    assign r = e1 & e2;

endmodule
