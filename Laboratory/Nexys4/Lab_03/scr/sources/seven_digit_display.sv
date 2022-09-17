// Anode controller module
// counter signal activates anode by setting signal to zero
module anode_controller(
    input logic clk,
    input logic reset,
    output logic [7:0] counter
    );
    
   
  always @(posedge clk, posedge reset)
    begin
        if (reset == 1)
            begin
                counter <= 8'b11111110;
            end
         else
            begin
                counter <= {counter[6:0], counter[7]};
            end
            
     end
endmodule


// Auxiliary module to divide clock frequency
module clock_divider(
    input logic clk,
    input logic reset,
    output logic clk_out
    );
    
    logic [31:0] counter;
    localparam constantNumber = 125000;//f=400Hz  f=100MHz/(2*constantNumber)
    
    always @(posedge clk, posedge reset)
        begin
            if (reset == 1'b1)
                begin
                    counter <= 0;
                end
            else if (counter == constantNumber - 1)
                begin
                    counter <= 32'b0;;
                end
            else
                begin
                    counter <= counter + 1'b1;
                end
        
        end
        
    always @ (posedge clk, posedge reset)
        begin
            if (reset == 1'b1)
                clk_out <= 1'b0;
            else if (counter == constantNumber - 1)
                clk_out <= ~clk_out;
            else
                clk_out <= clk_out;
        end 
            
endmodule

// Exercise 4
// Module that sets the data shown on the display.
// Note that active values are set to zero
module dummy_data(
    input logic [7:0] counter,
    output logic [7:0] data
    );
     
     // ADD YOUR CODE IN HERE
        
    end
    
endmodule
    

// This is the top module     
module seven_digit_display(
    input logic clk,
    input logic reset,
    output logic [7:0] data,
    output logic [7:0] anode,
    output logic clk_out
        );
        
    logic [7:0] counter;
    
    assign anode = counter;

    clock_divider clock_divider_instance(
        .clk(clk), 
        .reset(reset), 
        .clk_out(clk_out)
        );
    
    anode_controller anode_controller_instance(
        .clk(clk_out), 
        .reset(reset), 
        .counter(counter)
        );
    
    dummy_data dummy_data_instance(
        .counter(counter), 
        .data(data)
        );


endmodule
