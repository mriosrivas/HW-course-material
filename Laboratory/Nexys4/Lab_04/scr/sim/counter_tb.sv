`timescale 1ns/10ps

module counter_tb();
    parameter N = 4;
    logic clk_tb;
    logic reset_tb;
    logic enable_tb;
    logic [N-1:0] count_tb;
    
    counter #(N) dut(
        .clk(clk_tb),
        .reset(reset_tb),
        .enable(enable_tb),
        .count(count_tb)
        );
    
    always
        begin
            clk_tb = ~clk_tb;
            #5;
        end

    initial
        begin
            clk_tb = 1'b0;
            #6;
            reset_tb = 1'b1;
            enable_tb = 1'b0;
            #21;
            reset_tb = 1'b0;
            enable_tb = 1'b1;
            #100;
            $finish;
            
        
        end
endmodule
