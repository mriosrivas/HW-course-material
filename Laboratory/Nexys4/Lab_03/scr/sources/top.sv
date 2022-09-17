// Top module that takes a 16 bit signal and displays
// into a 7 digit display
module top(
    input logic clk,
    input logic reset,
    input logic [15:0] number,
    output logic [7:0] data,
    output logic [7:0] anode,
    output logic clk_out
        );
        
    logic [7:0] counter;
    logic [7:0] seg_0;
    logic [7:0] seg_1;
    logic [7:0] seg_2;
    logic [7:0] seg_3;
    logic [7:0] seg_4;
    logic [7:0] seg_5;
    logic [7:0] data;
    
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


data_management data_management(
    .counter(counter),
    .seg_0(seg_0),
    .seg_1(seg_1),
    .seg_2(seg_2),
    .seg_3(seg_3),
    .seg_4(seg_4),
    .seg_5(seg_5),
    .data(data)
    );
    

bcd_to_display bcd_to_display(
    .number(number),
    .seg_0(seg_0),
    .seg_1(seg_1),
    .seg_2(seg_2),
    .seg_3(seg_3),
    .seg_4(seg_4),
    .seg_5(seg_5)
    );

endmodule

// Management module to demultiplex 6 inputs into 1 output
module data_management(
    input logic [7:0] counter,
    input logic [7:0] seg_0,
    input logic [7:0] seg_1,
    input logic [7:0] seg_2,
    input logic [7:0] seg_3,
    input logic [7:0] seg_4,
    input logic [7:0] seg_5,
    output logic [7:0] data
    );
     
     always_comb
     begin    
        case (counter)
            8'b11111110:     data = seg_0; //pabcdefg
            8'b11111101:     data = seg_1; //pabcdefg
            8'b11111011:     data = seg_2; //pabcdefg
            8'b11110111:     data = seg_3; //pabcdefg
            8'b11101111:     data = seg_4; //pabcdefg
            8'b11011111:     data = ~(8'b00000000); //pabcdefg
            8'b10111111:     data = ~(8'b00000000); //pabcdefg
            8'b01111111:     data = ~(8'b00000000); //pabcdefg
            default:    data = ~(8'b00000000);
        
        endcase
        
        
    end
    
endmodule
