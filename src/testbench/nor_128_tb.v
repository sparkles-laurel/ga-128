// This source describes Open Hardware and is licensed under the CERN-OHL-S v2.0
// SPDX-License-Identifier: CERN-OHL-S-2.0

`timescale 1ps / 1fs

module nor_128_tb;

    reg [127:0] a;
    reg [127:0] b;
    wire [127:0] out;
    reg [127:0] expected;

    nor_128 uut (
        .a(a),
        .b(b),
        .out(out)
    );

    task check;
        input [127:0] test_a;
        input [127:0] test_b;
        begin
            a = test_a;
            b = test_b;
            expected = ~(test_a | test_b);
            #10;

            if (out !== expected) begin
                $display("FAIL: nor_128 a=%032h b=%032h expected=%032h actual=%032h",
                         test_a, test_b, expected, out);
                $finish;
            end
        end
    endtask

    initial begin
        $dumpfile("nor_128_sim.vcd");
        $dumpvars(0, nor_128_tb);

        check(128'h00000000000000000000000000000000,
              128'h00000000000000000000000000000000);
        check(128'hffffffffffffffffffffffffffffffff,
              128'h00000000000000000000000000000000);
        check(128'h80000000000000000000000000000000,
              128'h00000000000000000000000000000000);
        check(128'ha5a5a5a5a5a5a5a55a5a5a5a5a5a5a5a,
              128'hff00ff00ff00ff0000ff00ff00ff00ff);

        $display("PASS: nor_128");
        $finish;
    end

endmodule
