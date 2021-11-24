//HDL Example 4.21 D LATCH

module latch(input logic
    clk,
    input logic [3:0] d,
    output logic [3:0] q);

    always_latch    //always @(clk, d)
        if (clk) q <= d;

endmodule