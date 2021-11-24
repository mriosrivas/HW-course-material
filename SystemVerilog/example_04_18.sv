//HDL Example 4.18 RESETTABLE REGISTER

module flop_asyn_r(input logic clk,
    input logic reset,
    input logic [3:0] d,
    output logic [3:0] q);

// asynchronous reset
    always_ff @(posedge clk, posedge reset)
        if (reset) q <= 4'b0;
        else q <= d;
    endmodule



module flop_syn_r(input logic clk,
    input logic reset,
    input logic [3:0] d,
    output logic [3:0] q);

// synchronous reset
    always_ff @(posedge clk)
        if (reset) q <= 4'b0;
        else q <= d;
    endmodule
