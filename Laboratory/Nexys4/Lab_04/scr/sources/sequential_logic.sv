module flip_flop_sync #(parameter N=8) (
    input logic clk,
    input logic reset,
    input logic [N-1:0] d,
    output logic [N-1:0] q
    );

// IMPLEMENT A D-TYPE FLIP FLOP WITH SYNCHRONOUS RESET
// ADD CODE HERE

// DO NOT ADD MORE CODE BELOW

endmodule


module flip_flop_async #(parameter N=8) (
    input logic clk,
    input logic reset,
    input logic [N-1:0] d,
    output logic [N-1:0] q
    );

// IMPLEMENT A D-TYPE FLIP FLOP WITH ASYNCHRONOUS RESET
// ADD CODE HERE

// DO NOT ADD MORE CODE BELOW

endmodule


module latch #(parameter N=8) (
    input logic clk,
    input logic reset,
    input logic [N-1:0] d,
    output logic [N-1:0] q
    );

// CREATE A LATCH
// ADD CODE HERE

// DO NOT ADD MORE CODE BELOW

endmodule


module sequential_logic #(parameter N=4)(
    input logic clk,
    input logic reset,
    input logic [N-1: 0] d,
    output logic [N-1: 0] q_sync,
    output logic [N-1: 0] q_async,
    output logic [N-1: 0] q_latch
    );
    
// MAKE AN INSTANCE OF flip_flop_sync WITH VARIABLE PARAMETER N
// ADD CODE HERE

// DO NOT ADD MORE CODE BELOW 


// MAKE AN INSTANCE OF flip_flop_async WITH VARIABLE PARAMETER N
// ADD CODE HERE

// DO NOT ADD MORE CODE BELOW 
        
      
// MAKE AN INSTANCE OF latch WITH VARIABLE PARAMETER N
// ADD CODE HERE

// DO NOT ADD MORE CODE BELOW 
        
endmodule
