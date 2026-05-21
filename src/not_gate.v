module not_gate (
    input wire in,
    output wire out
);
        // Compute not a = a nor a
        nor_gate u_nor_gate(
            .a   	(a    ),
            .b   	(b    ),
            .out 	(out  )
        );
endmodule
        
    