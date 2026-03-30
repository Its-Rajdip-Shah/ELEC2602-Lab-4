`timescale 1ns / 1ps

module lab4_p3_TB;

    reg [8:0] count;
    reg [3:0] a, b;
    reg cin;

    wire [3:0] s;
    wire cout;

    reg [3:0] expected_s;
    reg expected_cout;

    integer errors;

    // Instantiate DUT
    fourBit_FA dut (
        .a(a),
        .b(b),
        .cin(cin),
        .cout(cout),
        .s(s)
    );

    initial begin
        count = 9'b000000000;
        errors = 0;
    end

    always begin
        #50;
        count = count + 9'b000000001;
    end

    always @(count) begin
        // Split counter into test inputs
        a   = count[3:0];
        b   = count[7:4];
        cin = count[8];

        // Small delay so outputs settle
        #1;

        // Reference result using +
        {expected_cout, expected_s} = a + b + cin;

        // Compare DUT vs reference
        if ((s !== expected_s) || (cout !== expected_cout)) begin
            $display("MISMATCH: a=%b b=%b cin=%b | DUT: cout=%b s=%b | REF: cout=%b s=%b",
                     a, b, cin, cout, s, expected_cout, expected_s);
            errors = errors + 1;
        end
        else begin
            $display("PASS: a=%b b=%b cin=%b | cout=%b s=%b",
                     a, b, cin, cout, s);
        end

        // Stop after all 512 combinations
        if (count == 9'b111111111) begin
            if (errors == 0)
                $display("ALL TESTS PASSED");
            else
                $display("TEST COMPLETE: %0d ERRORS", errors);

            $finish;
        end
    end

endmodule