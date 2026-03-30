// circuitB.v
// Assumes active-low 7-seg codes on DE1-SoC:
// 0 -> 1000000
// 1 -> 1111001
module circuitB (z, d1);
    input z;
    output reg [6:0] d1;

    always @(z) begin
        if (z == 1'b1)
            d1 = 7'b1111001; // display 1
        else
            d1 = 7'b1000000; // display 0
    end
endmodule