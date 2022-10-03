module top_counter(
    input logic clk,
    input logic reset,
    input logic enable,
    output logic [7:0] data,
    output logic [7:0] anode,
    output logic clk_out);
    
    logic clk_counter;
    logic [15:0] number;
    
// MAKE AN INSTANCE OF display
// ADD CODE HERE

// DO NOT ADD MORE CODE BELOW 
    
    
// MAKE AN INSTANCE OF counter WITH VARIABLE PARAMETER N=16
// ADD CODE HERE

// DO NOT ADD MORE CODE BELOW 


// MAKE AN INSTANCE OF clock_divider WITH VARIABLE PARAMETER N=12500
// ADD CODE HERE

// DO NOT ADD MORE CODE BELOW 

endmodule


module counter #(parameter N=8) (
    input logic clk,
    input logic reset,
    input logic enable,
    output logic [N-1:0] count
);

// CREATE A COUNTER
// ADD CODE HERE

// DO NOT ADD MORE CODE BELOW
endmodule
