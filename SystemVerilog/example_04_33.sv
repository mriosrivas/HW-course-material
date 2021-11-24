//HDL Example 4.33 (a) UNSIGNED MULTIPLIER (b) SIGNED MULTIPLIER

// 4.33(a): unsigned multiplier
module multiplier_unsigned(input logic [3:0] a, b,
                output logic [7:0] y);

    assign y = a * b;

endmodule


// 4.33(b): signed multiplier
module multiplier_signed(input logic signed [3:0] a, b,
                output logic signed [7:0] y);
    assign y = a * b;

endmodule