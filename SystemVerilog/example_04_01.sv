//HDL Example 4.1 COMBINATIONAL LOGIC

module sillyfunction(input logic a, b, c,
                     output logic y);

assign y = ~a & ~b & ~c |
            a & ~b & ~c |
            a & ~b & c;
endmodule
