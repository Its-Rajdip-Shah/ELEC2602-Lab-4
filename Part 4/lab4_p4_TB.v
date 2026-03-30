`timescale 1ns / 1ps

module lab4_p4_TB;

    reg  [3:0] A, B;
    reg  cin;

    wire [6:0] HEX1, HEX0;

    integer i, j, k;

    lab4_p4 dut(
        .A(A),
        .B(B),
        .cin(cin),
        .HEX1(HEX1),
        .HEX0(HEX0)
    );

    initial begin
        for (i = 0; i < 8; i = i + 1) begin
            for (j = 0; j < 8; j = j + 1) begin
                for (k = 0; k < 2; k = k + 1) begin
                    A = i[3:0];
                    B = j[3:0];
                    cin = k[0];
                    #10;

                    $display("A=%0d B=%0d cin=%0d -> HEX1=%b HEX0=%b",
                             A, B, cin, HEX1, HEX0);
                end
            end
        end

        $finish;
    end

endmodule
