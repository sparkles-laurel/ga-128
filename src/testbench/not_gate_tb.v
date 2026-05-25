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

module not_gate_tb;

    reg in;
    wire out;

    // Instantiate the NOT gate module
    not_gate uut (
        .in(in),
        .out(out)
    );

    initial begin
        $dumpfile("not_gate_sim.vcd");
        $dumpvars(0, not_gate_tb);

        $display("EMULATE: NOT");
        // Truth table inputs for NOT
        in = 0; #10; // Expected output: 1
        $display("[%0t fs] Input in=0 => Output %b", $time, out);
        in = 1; #10; // Expected output: 0
        $display("[%0t fs] Input in=1 => Output %b", $time, out);
        $finish;
    end

endmodule
