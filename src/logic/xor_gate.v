module xor_gate (
    input wire a,
    input wire b,
    output wire out
);

    wire not_a;
    wire not_b;
    wire a_and_not_b;
    wire b_and_not_a;

    not_gate u_not_a (
        .in (a),
        .out (not_a)
    );

    not_gate u_not_b (
        .in (b),
        .out (not_b)
    );

    and_gate u_a_and_not_b (
        .a   	(a    ),
        .b   	(not_b    ),
        .out 	(a_and_not_b )
    );

    and_gate u_b_and_not_a (
        .a      (b),
        .b      (not_a),
        .out    (b_and_not_a)
    );

    or_gate u_a_xor_b (
        .a      (a_and_not_b),
        .b      (b_and_not_a),
        .out    (out)
    );
    
endmodule