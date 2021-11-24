//HDL Example 4.15 STRUCTURAL MODEL OF 2:1 MULTIPLEXER

module mux2(input logic [3:0] d0, d1,
    input logic s,
    output tri [3:0] y);

    tristate t0(d0, ~s, y);
    tristate t1(d1, s, y);

endmodule


module tristate(input logic [3:0] a,
    input logic en,
    output tri [3:0] y);

    assign y = en ? a : 4'bz;
    
endmodule