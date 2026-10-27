`timescale 1ns/1ps

module tb_hamming74;

    reg  [3:0] data;
    wire [6:0] code;
    reg  [6:0] expected;

    reg p1, p2, p4;
    integer i;
    integer errors;

    hamming74_encoder dut (
        .ui_in(data),
        .uo_out(code)
    );

    initial begin
        errors = 0;

        $display("Data | Codeword");
        $display("-------------");

        for (i = 0; i < 16; i = i + 1) begin
            data = i;
            #1;

            p1 = data[0] ^ data[1] ^ data[3];
            p2 = data[0] ^ data[2] ^ data[3];
            p4 = data[1] ^ data[2] ^ data[3];

            expected = {
                data[3], data[2], data[1],
                p4, data[0], p2, p1
            };

            if (code !== expected) begin
                $display("FAIL: data=%b code=%b expected=%b",
                         data, code, expected);
                errors = errors + 1;
            end else begin
                $display("%b   | %b", data, code);
            end
        end

        if (errors == 0)
            $display("PASS: All 16 cases passed.");
        else
            $display("FAIL: %0d errors.", errors);

        $finish;
    end

endmodule
