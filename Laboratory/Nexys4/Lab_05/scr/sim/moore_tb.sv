module moore_tb();
    logic clk_tb;
    logic reset_tb;
    logic w_tb;
    logic x_tb;
    logic y_tb;
    logic z_tb;
    logic [7:0] out_fsm_tb;


moore dut(
    .clk(clk_tb),
    .reset(reset_tb),
    .w(w_tb), 
    .x(x_tb), 
    .y(y_tb), 
    .z(z_tb),
    .out(out_fsm_tb)
    );

always
    begin
    clk_tb = ~clk_tb;
    #5;
    end
    
initial
    begin
        clk_tb = 1'b0;
        reset_tb = 1'b0;
        w_tb = 1'b0;
        x_tb = 1'b0;
        y_tb = 1'b0;
        z_tb = 1'b0;
        
        #18
        reset_tb = 1'b1;
        
        #18
        reset_tb = 1'b0;
        
        #100
        w_tb = 1'b1;
        assert (out_fsm_tb === 8'b00000000) $display("S0 simulation passed.");
        else $error("S0 failed.");
        
        #100
        x_tb = 1'b1;
        assert (out_fsm_tb === 8'b00000001) $display("S1 simulation passed.");
        else $error("S1 failed.");
        
        #100
        y_tb = 1'b1;
        assert (out_fsm_tb === 8'b00000010) $display("S2 simulation passed."); 
        else $error("S2 failed.");
        
        #100
        z_tb = 1'b1;
        assert (out_fsm_tb === 8'b00000011) $display("S3 simulation passed."); 
        else $error("S3 failed.");
        
        $finish;
        
    
    end
endmodule