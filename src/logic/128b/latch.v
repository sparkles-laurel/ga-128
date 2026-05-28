// This source describes Open Hardware and is licensed under the CERN-OHL-S v2.0
// SPDX-License-Identifier: CERN-OHL-S-2.0
//
// 128-bit SR latch built from single-bit `nor_gate` primitives.

module latch_128 (
    input wire [127:0] r,
    input wire [127:0] s,
    output wire [127:0] q,
    output wire [127:0] qb
);
    genvar i;

    // internal nets for generated instances
    wire [127:0] q_int;
    wire [127:0] qb_int;

    generate
        for (i = 0; i < 128; i = i + 1) begin : gen_latch
            nor_gate u_nor1(
                .a(r[i]),
                .b(qb_int[i]),
                .out(q_int[i])
            );

            nor_gate u_nor2(
                .a(s[i]),
                .b(q_int[i]),
                .out(qb_int[i])
            );
        end
    endgenerate

    assign q = q_int;
    assign qb = qb_int;

endmodule
