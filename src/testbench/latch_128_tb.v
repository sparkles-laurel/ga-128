// SPDX-License-Identifier: CERN-OHL-S-2.0
`timescale 1ps / 1fs

module latch_128_tb;

    reg [127:0] r;
    reg [127:0] s;
    wire [127:0] q;
    wire [127:0] qb;

    latch_128 uut (
        .r(r),
        .s(s),
        .q(q),
        .qb(qb)
    );

    initial begin
        $dumpfile("out/vcd/latch_128_sim.vcd");
        $dumpvars(0, latch_128_tb);

        // Initialize
        r = {128{1'b0}}; s = {128{1'b0}}; #10;

        // Force reset: r=1 -> Q=0
        r = {128{1'b1}}; s = {128{1'b0}}; #10;
        r = {128{1'b0}}; s = {128{1'b0}}; #10;

        // Set: s=1 -> Q=1
        r = {128{1'b0}}; s = {128{1'b1}}; #10;
        if (q !== {128{1'b1}}) begin
            $display("FAIL: latch_128");
            $finish;
        end

        // Reset: r=1 -> Q=0
        r = {128{1'b1}}; s = {128{1'b0}}; #10;
        if (q !== {128{1'b0}}) begin
            $display("FAIL: latch_128");
            $finish;
        end

        $display("PASS: latch_128");
        $finish;
    end

endmodule
