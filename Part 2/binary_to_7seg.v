module binary_to_7seg(binary, sevenSeg);
    input  [3:0] binary;
    output reg [6:0] sevenSeg;

    always @(binary) begin
        case (binary)
            4'd0: sevenSeg = 7'b1000000; // 0
            4'd1: sevenSeg = 7'b1111001; // 1
            4'd2: sevenSeg = 7'b0100100; // 2
            4'd3: sevenSeg = 7'b0110000; // 3
            4'd4: sevenSeg = 7'b0011001; // 4
            4'd5: sevenSeg = 7'b0010010; // 5
            4'd6: sevenSeg = 7'b0000010; // 6
            4'd7: sevenSeg = 7'b1111000; // 7
            4'd8: sevenSeg = 7'b0000000; // 8
            4'd9: sevenSeg = 7'b0010000; // 9
            default: sevenSeg = 7'b1111111; // blank
        endcase
    end

endmodule