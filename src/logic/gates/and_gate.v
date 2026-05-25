module and_gate (
    input wire a,
    input wire b,
    output wire out
);
    wire not_a;
    wire not_b;
    
    not_gate u_not_a (
        .in  (a),
        .out (not_a)
    );

    not_gate u_not_b (
        .in  (b),
        .out (not_b)
    );

    nor_gate u_nor_final (
        .a   (not_a),
        .b   (not_b),
        .out (out)
    );

endmodule