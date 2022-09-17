`timescale 1ns/10ps 

// Exercise #1
module demux_1_to_4_tb();
   
    logic [7:0] in_tb;
    logic [1:0] sel_tb;
    logic [7:0] out_0_tb;
    logic [7:0] out_1_tb;
    logic [7:0] out_2_tb;
    logic [7:0] out_3_tb; 

demux_1_to_4 dtu(
    .in(in_tb),
    .sel(sel_tb),
    .out_0(out_0_tb),
    .out_1(out_1_tb),
    .out_2(out_2_tb),
    .out_3(out_3_tb)
    );
    
    integer i;

initial
    begin
        for (i=0; i<3; i++)
            begin
                in_tb = i;
                sel_tb = 2'b00;
                
                #100
                in_tb = i + 4'b0010;
                sel_tb = 2'b01;
                
                #100
                in_tb = i + 4'b0100;
                sel_tb = 2'b10;
                
                #100
                in_tb = i + 4'b1000;
                sel_tb = 2'b11;
                
                #100;
            
            end
    end
endmodule



// Exercise #2
module mux_4_to_1_tb();

    logic [7:0] in_0_tb;
    logic [7:0] in_1_tb;
    logic [7:0] in_2_tb;
    logic [7:0] in_3_tb;    
    logic [1:0] sel_tb;
    logic [7:0] out_tb;


mux_4_to_1 dtu(
    .in_0(in_0_tb),
    .in_1(in_1_tb),
    .in_2(in_2_tb),
    .in_3(in_3_tb),
    .sel(sel_tb),
    .out(out_tb)
    );
    
    integer i;

initial
    begin
        for (i=1; i<3; i++)
            begin
                in_0_tb = i;
                in_1_tb = i << 1;
                in_2_tb = i << 2;
                in_3_tb = i << 3;
                
                sel_tb = 2'b00;
                
                #100
                sel_tb = 2'b01;
                
                #100
                sel_tb = 2'b10;
                
                #100
                sel_tb = 2'b11;
                
                #100;
            
            end
    end
endmodule


// Exercise #3
module priority_encoder_tb();

logic [3:0] a_tb;
logic [3:0] y_tb;

priority_encoder dut(
    .a(a_tb),
    .y(y_tb)
    );
    
integer i;

initial
    begin
        for (i=0; i<16; i++)
            begin
                a_tb = i;
                #100;
            end
    end
endmodule
