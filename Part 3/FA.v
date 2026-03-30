module FA(a, b, cin, cout, s);
    input a, b, cin;
    output cout, s;

    wire axorb;

    assign axorb = a ^ b;
    assign s = axorb ^ cin;
    assign cout = (a & b) | (cin & axorb);

endmodule