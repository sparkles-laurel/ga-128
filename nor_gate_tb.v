`timescale 1ps / 1fs

module nor_gate_tb;

    reg a;
    reg b;
    wire out;

    // Instantiate our new NOR gate module
    nor_gate uut (
        .a(a),
        .b(b),
        .out(out)
    );

    initial begin
        // Change the output file name for clarity
        $dumpfile("nor_gate_sim.vcd");
        $dumpvars(0, nor_gate_tb);

        // Truth table inputs for NOR
        a = 0; b = 0; #10; // Expected output: 1
        a = 0; b = 1; #10; // Expected output: 0
        a = 1; b = 0; #10; // Expected output: 0
        a = 1; b = 1; #10; // Expected output: 0

        $display("NOR simulation complete!");
        $finish;
    end

endmodule