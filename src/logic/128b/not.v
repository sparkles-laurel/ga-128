module not (
    input wire [127:0] in,
    output wire [127:0] out
);
    genvar i;

    generate
        for (i = 0; i < 127; i = i + 1) begin
            not_gate u_not_gate(
                .in  	(in[i]   ),
                .out 	(out[i]  )
            );
            
        end
    endgenerate
endmodule