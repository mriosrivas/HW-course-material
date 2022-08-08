module adder(
    input logic [15:0] in_a,
    input logic [15:0] in_b,
    output logic [16:0] out);
    
    assign out = in_a + in_b;


endmodule