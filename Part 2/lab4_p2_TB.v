`timescale 1ns / 1ps

module lab4_p2_TB;

    reg  [3:0] input_binary;
    wire [6:0] d1_ref, d2_ref;
    wire [6:0] d1_dut, d2_dut;

    integer i;
    integer errors;

    // Reference design: Part 1
    lab4_p1 instantiate_lab4_p1(
        .v(input_binary),
        .d1(d1_ref),
        .d2(d2_ref)
    );

    // DUT: Part 2 structural version
    lab4_p2 instantiate_lab4_p2(
        .v(input_binary),
        .d1(d1_dut),
        .d2(d2_dut)
    );

    initial begin
        errors = 0;

        for (i = 0; i < 16; i = i + 1) begin
            input_binary = i[3:0];
            #10;

            if ((d1_ref !== d1_dut) || (d2_ref !== d2_dut)) begin
                $display("MISMATCH for v=%b (%0d): REF d1=%b d2=%b | DUT d1=%b d2=%b",
                         input_binary, input_binary, d1_ref, d2_ref, d1_dut, d2_dut);
                errors = errors + 1;
            end
            else begin
                $display("PASS for v=%b (%0d): d1=%b d2=%b",
                         input_binary, input_binary, d1_dut, d2_dut);
            end
        end

        if (errors == 0)
            $display("ALL TESTS PASSED");
        else
            $display("TEST FAILED with %0d mismatches", errors);

        $finish;
    end

endmodule