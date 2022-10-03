`timescale 1ns/10ps

module sequential_logic_tb();
    parameter N = 4;
    logic clk_tb;
    logic reset_tb;
    logic [N-1: 0] d_tb;
    logic [N-1: 0] q_sync_tb;
    logic [N-1: 0] q_async_tb;
    logic [N-1: 0] q_latch_tb;

        
       sequential_logic #(N) dut(
        .clk(clk_tb),
        .reset(reset_tb),
        .d(d_tb),
        .q_sync(q_sync_tb),
        .q_async(q_async_tb),
        .q_latch(q_latch_tb)
        );
    
    
    always
        begin
            clk_tb = 1'b1; 
            #5;
            clk_tb = 1'b0; 
            #5;
        
        end
        
        
     initial
        begin
            #12; // This simulates a random initialization of the system
            
            reset_tb = 1'b1;
            #23;
            
            reset_tb = 1'b0;
                        
            d_tb = 4'b1010;
            #12;
            
            d_tb = 4'b0101;
            #15;
            
            d_tb = 4'b1100;
            #17;
            
            d_tb = 4'b0011;
            #13;
            
            $finish;
            
        end

endmodule
