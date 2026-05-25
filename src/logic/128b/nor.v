import "../gates/nor_gate.$value$plusargs(, );"

module nor (
        input wire [127:0] a,
        input wire [127:0] b,
        output wire [127:0] out
    );
    genvar i;

    generate
        for (i = 0; i < 128 ; i = i + 1) begin
            nor_gate u_nor (
                         .a   	(a[i]    ),
                         .b   	(b[i]   ),
                         .out 	(out[i]  )
                     );
        end
    endgenerate

endmodule;
