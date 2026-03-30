module lab4_p4(A, B, cin, HEX1, HEX0);
    input  [3:0] A, B;
    input  cin;
    output [6:0] HEX1, HEX0;

    wire [3:0] sum;
    wire cout;

    fourBit_FA adder_inst(
        .a(A),
        .b(B),
        .cin(cin),
        .cout(cout),
        .s(sum)
    );

    lab4_p2 display_inst(
        .v(sum),
        .d1(HEX1),
        .d2(HEX0)
    );

endmodule
