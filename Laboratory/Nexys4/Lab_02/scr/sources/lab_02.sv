// Exercise #1
// Implement all logic gates
module gates(
    input logic [7:0] in_a,
    input logic [7:0] in_b,
    output logic [7:0] out_1,
    output logic [7:0] out_2,
    output logic [7:0] out_3,
    output logic [7:0] out_4,
    output logic [7:0] out_5,
    output logic [7:0] out_6
    
    );
    
    assign out_1 = in_a & in_b;     // AND
    assign out_2 = in_a | in_b;     // OR
    assign out_3 = ~(in_a & in_b);  // NAND
    assign out_4 = ~(in_a | in_b);  // NOR
    assign out_5 = in_a ^ in_b;     // XOR
    assign out_6 = ~(in_a ^ in_b);  // XNOR
endmodule


// Exercise #2
// Implement reduction gates
module reduction_gates(
    input logic [7:0] in_a,
    input logic [7:0] in_b,
    output logic out_1,
    output logic out_2,
    output logic out_3,
    output logic out_4,
    output logic out_5,
    output logic out_6
    
    );
    
    assign out_1 = in_a && in_b;     // AND
    assign out_2 = in_a || in_b;     // OR
    assign out_3 = ~(in_a && in_b);  // NAND
    assign out_4 = ~(in_a || in_b);  // NOR
    assign out_5 = in_a ^^ in_b;     // XOR
    assign out_6 = ~(in_a ^^ in_b);  // XNOR
endmodule


// Exercise #3
// Implement conditional assignment
module conditional_gate(
    input logic [7:0] in_a,
    input logic [7:0] in_b,
    input logic sel,
    output logic [7:0] out
        );
        
    // if sel==1
    //    out = in_a
    // else
    //    out = in_b     
    assign out = sel ? in_a : in_b;
endmodule


// Exercise #4
// Create a multiplexer 4:1
module multiplexer_4_1(
    input logic [7:0] in_a,
    input logic [7:0] in_b,
    input logic [7:0] in_c,
    input logic [7:0] in_d,
    input logic [1:0] sel,
    output logic [7:0] out
    );
    
    logic [7:0] mux_out_1;
    logic [7:0] mux_out_2;
    
    // sel == 00     out = in_a
    // sel == 01     out = in_b
    // sel == 10     out = in_c
    // sel == 11     out = in_d 
    assign mux_out_1 = sel[0] ? in_b : in_a;
    assign mux_out_2 = sel[0] ? in_d : in_c;
    assign out = sel[1] ? mux_out_2 : mux_out_1;
    
 
endmodule



// Exercise #5
// Implement 4 logical operations and output one by using a multiplexer
module logical_operations(
    input logic [7:0] in_a,
    input logic [7:0] in_b,
    input logic [1:0] sel,
    output logic [7:0] out
    );
    
    logic [7:0] out_1_to_in_a;
    logic [7:0] out_2_to_in_b;
    logic [7:0] out_3_to_in_c;
    logic [7:0] out_4_to_in_d;
    
 gates gates_instance(
    .in_a(in_a),
    .in_b(in_b),
    .out_1(out_1_to_in_a),
    .out_2(out_2_to_in_b),
    .out_3(out_3_to_in_c),
    .out_4(out_4_to_in_d),
    .out_5(),
    .out_6()
    );
    
 multiplexer_4_1 multiplexer_4_1_instance(
    .in_a(out_1_to_in_a),
    .in_b(out_2_to_in_b),
    .in_c(out_3_to_in_c),
    .in_d(out_4_to_in_d),
    .sel(sel),
    .out(out)
    );
    

endmodule




