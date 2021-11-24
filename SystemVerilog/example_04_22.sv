//HDL Example 4.22 INVERTER USING always/process

module inv(input logic [3:0] a,
    output logic [3:0] y);

    always_comb
        y = ~a;
        
endmodule