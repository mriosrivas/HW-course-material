//HDL Example 4.10 TRISTATE BUFFER

module tristate(input logic [3:0] a,
    input logic en,
    output tri [3:0] y);

    assign y = en ? a : 4'bz;
    
endmodule