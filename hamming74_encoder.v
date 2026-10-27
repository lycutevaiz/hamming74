module hamming74_encoder (
    input  wire [3:0] ui_in,
    output wire [6:0] uo_out
);

    wire d0, d1, d2, d3;
    wire p1, p2, p4;

    assign d0 = ui_in[0];
    assign d1 = ui_in[1];
    assign d2 = ui_in[2];
    assign d3 = ui_in[3];

    assign p1 = d0 ^ d1 ^ d3;
    assign p2 = d0 ^ d2 ^ d3;
    assign p4 = d1 ^ d2 ^ d3;

    assign uo_out = {d3, d2, d1, p4, d0, p2, p1};

endmodule
