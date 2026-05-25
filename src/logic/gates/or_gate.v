module or_gate (
    input wire a,
    input wire b,
    output wire out
);
    wire internal;
    // Compute a nor b
    nor_gate u_nor_gate(
        .a   	(a    ),
        .b   	(b    ),
        .out 	(internal  )
    );
    
    // Compute a or b = not (a nor b)
    not_gate u_not_gate(
        .in  	(internal   ),
        .out 	(out  )
    );
endmodule