import "../gates/and_gate.v"

module and(
        input wire [127:0] a,
        input wire [127:0] b,
        output wire [127:0] out
    );

    genvar i;

    generate
        for (i = 0; i < 127; i = i + 1) begin

            and_gate u_and_gate(
                         .a   	(a[i]    ),
                         .b   	(b[i]    ),
                         .out 	(out[i]  )
                     );
        end

endmodule //and

