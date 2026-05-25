// This source describes Open Hardware and is licensed under the CERN-OHL-S v2.0        
// SPDX-License-Identifier: CERN-OHL-S-2.0                                                                                                              
//                                                                                                                                                      
// You may redistribute and modify this source and make products using it under                                                                         
// the terms of the CERN-OHL-S v2.0 (https://ohwr.org/cern_ohl_s_v2.txt)                                                                                
//                                                                                                                                                      
// Unless required by applicable law or agreed to in writing, this source                                                                               
// is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND.                                                                    
//                                                                                                                                                      
// See the license for the specific language governing permissions and limitations.    

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