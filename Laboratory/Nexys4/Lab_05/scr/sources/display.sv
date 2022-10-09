// Top module that takes a 16 bit signal and displays
// into a 7 digit display
module display(
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
    
    assign anode = counter;

clock_divider #(125000) clock_divider_instance(
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



// Auxiliary module to divide clock frequency
module clock_divider #(parameter N=125000)(
    input logic clk,
    input logic reset,
    output logic clk_out
    );
    
    logic [31:0] counter;
    localparam constantNumber = N;//f=400Hz  f=100MHz/(2*constantNumber)
    
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


// Module that takes a 16 bit number and ouputs
// Five logic signals of 7 bits each for a 7-digit display.
module bcd_to_display(
    input  logic [15:0] number,
    output logic [7:0] seg_0,
    output logic [7:0] seg_1,
    output logic [7:0] seg_2,
    output logic [7:0] seg_3,
    output logic [7:0] seg_4,
    output logic [7:0] seg_5
    );
    
    logic [3:0] bcd_0;
    logic [3:0] bcd_1;
    logic [3:0] bcd_2;
    logic [3:0] bcd_3;
    logic [3:0] bcd_4;
    logic [3:0] bcd_5;
    
double_dabble double_dabble(
    .number(number),
    .hundred_thousands(bcd_5),
    .ten_thousands(bcd_4),
    .thousands(bcd_3),
    .hundreds(bcd_2),
    .tens(bcd_1),
    .ones(bcd_0)
    );

bcd_to_seven bcd_to_seven_0(
    .bcd(bcd_0),
    .seg(seg_0)
    );
    
bcd_to_seven bcd_to_seven_1(
    .bcd(bcd_1),
    .seg(seg_1)
    );
    
bcd_to_seven bcd_to_seven_2(
    .bcd(bcd_2),
    .seg(seg_2)
    );
    
bcd_to_seven bcd_to_seven_3(
    .bcd(bcd_3),
    .seg(seg_3)
    );
    
bcd_to_seven bcd_to_seven_4(
    .bcd(bcd_4),
    .seg(seg_4)
    );
    
bcd_to_seven bcd_to_seven_5(
    .bcd(bcd_5),
    .seg(seg_5)
    );

endmodule


// Exercise 6
// Implementation of double dabble algorithm as described here
// https://en.wikipedia.org/wiki/Double_dabble
module double_dabble(
   input  logic [15:0] number,
   output logic [3:0] hundred_thousands,
   output logic [3:0] ten_thousands,
   output logic [3:0] thousands,
   output logic [3:0] hundreds,
   output logic [3:0] tens,
   output logic [3:0] ones
   );
   
   // Internal variable for storing bits
   logic [39:0] shift;
   integer i;
   
   always @(number)
   begin
      // Clear previous number and store new number in shift register
      shift[39:16] = 0;
      shift[15:0] = number;
      
      for (i=0; i<16; i=i+1) begin
         if (shift[19:16] >= 5)
            shift[19:16] = shift[19:16] + 3;
            
         if (shift[23:20] >= 5)
            shift[23:20] = shift[23:20] + 3;
            
         if (shift[27:24] >= 5)
            shift[27:24] = shift[27:24] + 3;
         
         if (shift[31:28] >= 5)
            shift[31:28] = shift[31:28] + 3;
            
         if (shift[35:32] >= 5)
            shift[35:32] = shift[35:32] + 3;
            
         if (shift[39:36] >= 5)
            shift[39:36] = shift[39:36] + 3;
         
         // Shift entire register left once
         shift = shift << 1;
      end
      
      // Push decimal numbers to output
      hundred_thousands = shift[39:36];
      ten_thousands = shift[35:32];
      thousands = shift[31:28];
      hundreds = shift[27:24];
      tens = shift[23:20];
      ones = shift[19:16];
   end
 
endmodule

// Exercise 5
// Module to convert BCD values into 7-digit display signals
// Note: Zeros are active values
module bcd_to_seven(
    input logic [3:0] bcd,
    output logic [7:0] seg
    );
    
    always @ (bcd) 
    case (bcd) 
      0 : seg = 8'b10000001; 
      1 : seg = 8'b11001111; 
      2 : seg = 8'b10010010; 
      3 : seg = 8'b10000110; 
      4 : seg = 8'b11001100; 
      5 : seg = 8'b10100100;
      6 : seg = 8'b10100000;
      7 : seg = 8'b10001111;
      8 : seg = 8'b10000000;
      9 : seg = 8'b10000100;
      default : seg = 8'b10000000;
    endcase    

endmodule