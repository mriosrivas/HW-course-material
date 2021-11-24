//HDL Example 4.2 INVERTERS

module inv(input logic [3:0] a,
    output logic [3:0] y);
    
    assign y = ~a;
    
endmodule