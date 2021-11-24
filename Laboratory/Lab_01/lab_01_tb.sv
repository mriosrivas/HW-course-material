module adder_tb();
    logic [15:0] in_a_tb;
    logic [15:0] in_b_tb;
    logic [16:0] out_tb;
    
    
adder dut(
    .in_a(in_a_tb),
    .in_b(in_b_tb),
    .out(out_tb)
    );

initial
    begin
    in_a_tb = 0;
    in_b_tb = 0;
    
    #100
    in_a_tb = 25;
    in_b_tb = 35;
    
    #100
    in_a_tb = (2**16)-1;
    in_b_tb = (2**16)-1;
    
    #100
    in_a_tb = (2**16)-1;
    in_b_tb = 2**16;
        
    
    end
endmodule