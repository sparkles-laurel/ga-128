// This source describes Open Hardware and is licensed under the CERN-OHL-S v2.0
// SPDX-License-Identifier: CERN-OHL-S-2.0

`timescale 1ps / 1fs

module not_128_tb;

    reg [127:0] in;
    wire [127:0] out;
    reg [127:0] expected;

    not_128 uut (
        .in(in),
        .out(out)
    );

    task check;
        input [127:0] test_in;
        begin
            in = test_in;
            expected = ~test_in;
            #10;

            if (out !== expected) begin
                $display("FAIL: not_128 in=%032h expected=%032h actual=%032h",
                         test_in, expected, out);
                $finish;
            end
        end
    endtask

    initial begin
        $dumpfile("out/vcd/not_128_sim.vcd");
        $dumpvars(0, not_128_tb);

        check(128'h00000000000000000000000000000000);
        check(128'hffffffffffffffffffffffffffffffff);
        check(128'h80000000000000000000000000000000);
        check(128'ha5a5a5a5a5a5a5a55a5a5a5a5a5a5a5a);

        $display("PASS: not_128");
        $finish;
    end

endmodule
