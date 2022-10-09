module mealy_tb();
    logic clk_tb;
    logic reset_tb;
    logic [7:0] sw_tb;
    logic [2:0] y_tb;
    logic [2:0] z_tb;

mealy dut(
    .clk(clk_tb),
    .reset(reset_tb),
    .sw(sw_tb), 
    .y(y_tb), 
    .z(z_tb)
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
        sw_tb = 8'b00000000;
        
        #20
        reset_tb = 1'b1;
        
        #20
        reset_tb = 1'b0;
        
        
        assert (y_tb === 3'b001) $display("S0 simulation passed on y.");
        else $error("S0 failed on y.");
        assert (z_tb === 3'b111) $display("S0 simulation passed on z.");
        else $error("S0 failed on z.");
        
        #10
        assert (y_tb === 3'b010) $display("S1 simulation passed on y.");
        else $error("S1 failed on y.");
        assert (z_tb === 3'b110) $display("S1 simulation passed on z.");
        else $error("S1 failed on z.");
        
        #10
        assert (y_tb === 3'b011) $display("S2 simulation passed on y.");
        else $error("S2 failed on y.");
        assert (z_tb === 3'b101) $display("S2 simulation passed on z.");
        else $error("S2 failed on z.");
        
        #10
        assert (y_tb === 3'b100) $display("S3 simulation passed on y.");
        else $error("S3 failed on y.");
        assert (z_tb === 3'b100) $display("S3 simulation passed on z.");
        else $error("S3 failed on z.");
        
        #10
        assert (y_tb === 3'b101) $display("S4 simulation passed on y.");
        else $error("S4 failed on y.");
        assert (z_tb === 3'b011) $display("S4 simulation passed on z.");
        else $error("S4 failed on z.");
        
        #10
        assert (y_tb === 3'b110) $display("S5 simulation passed on y.");
        else $error("S5 failed on y.");
        assert (z_tb === 3'b010) $display("S5 simulation passed on z.");
        else $error("S5 failed on z.");
        
        #10
        assert (y_tb === 3'b111) $display("S6 simulation passed on y.");
        else $error("S6 failed on y.");
        assert (z_tb === 3'b001) $display("S6 simulation passed on z.");
        else $error("S6 failed on z.");
        
        #10
        assert (y_tb === 3'b001) $display("S7 simulation passed on y.");
        else $error("S7 failed on y.");
        assert (z_tb === 3'b111) $display("S7 simulation passed on z.");
        else $error("S7 failed on z.");
        
        sw_tb = 8'b11111111;
        assert (y_tb === 3'b001) $display("Stop on last value of y passed.");
        else $error("Error on last value of y.");
        assert (z_tb === 3'b111) $display("Stop on last value of z passed.");
        else $error("Error on last value of z.");
        
        $finish;
        
    
    end
endmodule