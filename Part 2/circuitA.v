// circuitA.v
module circuitA (v, A);
    input  [3:0] v;
    output reg [3:0] A;

    always @(v) begin
        if (v > 4'd9)
            A = v - 4'd10;   // not 10 - v
        else
            A = v;
    end
endmodule