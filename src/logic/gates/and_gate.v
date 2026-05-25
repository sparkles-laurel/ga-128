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