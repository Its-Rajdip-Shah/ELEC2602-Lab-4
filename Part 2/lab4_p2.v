// lab4_p2.v
module lab4_p2 (v, d1, d2);
    input  [3:0] v;
    output [6:0] d1, d2;

    wire [3:0] adjusted_value;
    wire [3:0] selected_ones_digit;
    wire       gt9;

    circuitA inst_circA(
        .v(v),
        .A(adjusted_value)
    );

    comparator inst_comp(
        .v(v),
        .z(gt9)
    );

    circuitB inst_circB(
        .z(gt9),
        .d1(d1)
    );

    // From your course mux style:
    // sel=1 chooses a, sel=0 chooses b
    four_bit_2to1mux inst_mux(
        .sel(gt9),
        .a(adjusted_value),
        .b(v),
        .chosen(selected_ones_digit)
    );

    binary_to_7Seg instantiate_bto7seg(
        .binary(selected_ones_digit),
        .sevenSeg(d2)
    );

endmodule