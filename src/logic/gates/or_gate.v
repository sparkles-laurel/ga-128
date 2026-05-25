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