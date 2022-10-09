// Exercise #2
module mealy(
    input logic clk,
    input logic reset,
    input logic [7:0]  sw, 
    output logic [2:0] y, 
    output logic [2:0] z
        );

    typedef enum logic [2:0] {S0, S1, S2, S3, S4, S5, S6, S7} statetype;
    statetype [2:0] state, nextstate;


    // state register
    // Define your state register here.
    // ADD CODE BELOW
        
    // DO NOT ADD MORE CODE FROM HERE

    
    // next state logic
    // Define your state logic
    // ADD CODE BELOW
            
    // DO NOT ADD MORE CODE FROM HERE


    // output logic
    // Define your output logic
    // ADD CODE BELOW
    
    // DO NOT ADD MORE CODE FROM HERE
endmodule


module top_mealy(
    input logic clk,
    input logic reset,
    input logic [7:0] sw,
    output logic [2:0] y, 
    output logic [2:0] z
    );

logic clk_out;

// Intantiate a clock_divider module
// ADD CODE BELOW

// DO NOT ADD MORE CODE FROM HERE

// Intantiate a mealy module   
// ADD CODE BELOW 

// DO NOT ADD MORE CODE FROM HERE
endmodule
