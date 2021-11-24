//HDL Example 4.5 2:1 MULTIPLEXER

module mux2(input logic [3:0] d0, d1,
            input logic s,
            output logic [3:0] y);

            assign y = s ? d1 : d0;
            
endmodule