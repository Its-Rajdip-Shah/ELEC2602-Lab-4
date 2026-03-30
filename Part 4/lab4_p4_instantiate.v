module lab4_p4_instantiate(SW, HEX0, HEX1);
    input  [9:0] SW;
    output [6:0] HEX0, HEX1;

    lab4_p4 p4_inst(
        .A(SW[3:0]),
        .B(SW[7:4]),
        .cin(SW[8]),
        .HEX1(HEX1),
        .HEX0(HEX0)
    );

endmodule
