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


import "../gates/nor_gate.v"

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
