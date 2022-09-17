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
   
   // ADD YOUR CODE IN HERE
      
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
    
    // ADD YOUR CODE IN HERE

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
