// Exercise #1
module moore(
    input logic clk,
    input logic reset,
    input logic w, 
    input logic x, 
    input logic y, 
    input logic z,
    output logic [7:0] out
    );

    typedef enum logic [1:0] {S0, S1, S2, S3} statetype;
    statetype [1:0] state, nextstate;


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


module top_moore(
    input logic clk,
    input logic reset,
    input logic w, 
    input logic x, 
    input logic y, 
    input logic z,
    output logic [7:0] data,
    output logic [7:0] anode,
    output logic clk_out
    );

logic [7:0] out_fsm;

// Intantiate a display module
// ADD CODE BELOW

// DO NOT ADD MORE CODE FROM HERE

// Intantiate a moore module
// ADD CODE BELOW    

// DO NOT ADD MORE CODE FROM HERE        
endmodule
