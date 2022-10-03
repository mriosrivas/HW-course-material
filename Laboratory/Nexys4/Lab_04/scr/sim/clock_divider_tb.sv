`timescale 1ns/10ps

module clock_divider_tb();
    logic clk_tb;
    logic reset_tb;
    logic clk_out_tb;
    
    clock_divider dut(
        .clk(clk_tb),
        .reset(reset_tb),
        .clk_out(clk_out_tb)
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
            #21;
            reset_tb = 1'b0;
            #10000;
            $finish;
            
        
        end

endmodule
