`timescale 1ns/10ps 

// Exercise #1
module gates_tb();
    logic [7:0] tb_in_a;
    logic [7:0] tb_in_b;
    logic [7:0] tb_out_1;
    logic [7:0] tb_out_2;
    logic [7:0] tb_out_3;
    logic [7:0] tb_out_4;
    logic [7:0] tb_out_5;
    logic [7:0] tb_out_6;
  
gates dut(
    .in_a(tb_in_a),
    .in_b(tb_in_b),
    .out_1(tb_out_1),
    .out_2(tb_out_2),
    .out_3(tb_out_3),
    .out_4(tb_out_4),
    .out_5(tb_out_5),
    .out_6(tb_out_6)
    );
      
initial
    begin
    tb_in_a = 8'b00000000;
    tb_in_b = 8'b00000000;
    
    #100 
    tb_in_a = 8'b11111111;
    tb_in_b = 8'b00000000;
    
    #100 
    tb_in_a = 8'b10101010;
    tb_in_b = 8'b00000000;
    
    #100
    tb_in_a = 8'b00000000;
    tb_in_b = 8'b11111111;
    
    #100
    tb_in_a = 8'b00000000;
    tb_in_b = 8'b10101010;
    
    
    end 

endmodule


// Exercise #2
module reduction_gates_tb();
    logic [7:0] tb_in_a;
    logic [7:0] tb_in_b;
    logic tb_out_1;
    logic tb_out_2;
    logic tb_out_3;
    logic tb_out_4;
    logic tb_out_5;
    logic tb_out_6;
  
gates dut(
    .in_a(tb_in_a),
    .in_b(tb_in_b),
    .out_1(tb_out_1),
    .out_2(tb_out_2),
    .out_3(tb_out_3),
    .out_4(tb_out_4),
    .out_5(tb_out_5),
    .out_6(tb_out_6)
    );
      
initial
    begin
    tb_in_a = 8'b00000000;
    tb_in_b = 8'b00000000;
    
    #100 
    tb_in_a = 8'b11111111;
    tb_in_b = 8'b00000000;
    
    #100 
    tb_in_a = 8'b10101010;
    tb_in_b = 8'b00000000;
    
    #100
    tb_in_a = 8'b00000000;
    tb_in_b = 8'b11111111;
    
    #100
    tb_in_a = 8'b00000000;
    tb_in_b = 8'b10101010;
    
    
    end 

endmodule



// Exercise #3
module conditional_gate_tb();
    logic [7:0] tb_in_a;
    logic [7:0] tb_in_b;
    logic tb_sel;
    logic [7:0] tb_out;
    
conditional_gate dut(
    .in_a(tb_in_a),
    .in_b(tb_in_b),
    .sel(tb_sel),
    .out(tb_out)
    );

initial
    begin
        tb_in_a = 8'b11111111;
        tb_in_b = 8'b00000000;
        
        tb_sel = 1'b0;
        
        #100
        tb_sel = 1'b1;
        
        #100
        tb_sel = 1'b0;
        
        #100
        tb_sel = 1'b1;
    
    end
   
endmodule




// Exercise #4
module multiplexer_4_1_tb();
    logic [7:0] tb_in_a;
    logic [7:0] tb_in_b;
    logic [7:0] tb_in_c;
    logic [7:0] tb_in_d;
    logic [1:0] tb_sel;
    logic [7:0] tb_out;
    
multiplexer_4_1 dut(
    .in_a(tb_in_a),
    .in_b(tb_in_b),
    .in_c(tb_in_c),
    .in_d(tb_in_d),
    .sel(tb_sel),
    .out(tb_out)
    );
    
initial
    begin
        tb_in_a = 8'b00000000;
        tb_in_b = 8'b00000001;
        tb_in_c = 8'b00000010;
        tb_in_d = 8'b00000011;
        
        tb_sel = 2'b00;
        
        #100
        tb_sel = 2'b01;
        
        #100
        tb_sel = 2'b10;
        
        #100
        tb_sel = 2'b11;
        
        #100
        tb_sel = 2'b00;
        
        #100
        tb_sel = 2'b01;
        
        #100
        tb_sel = 2'b10;
        
        #100
        tb_sel = 2'b11;
    
    end
   
endmodule



// Exercise #5
module logical_operations_tb();
    logic [7:0] tb_in_a;
    logic [7:0] tb_in_b;
    logic [2:0] tb_sel;
    logic [7:0] tb_out;
  
logical_operations dut(
    .in_a(tb_in_a),
    .in_b(tb_in_b),
    .sel(tb_sel),
    .out(tb_out)
    );
      
initial
    begin
    tb_sel = 2'b00;
    tb_in_a = 8'b00000000;
    tb_in_b = 8'b00000000;
    
    #100 
    tb_in_a = 8'b11111111;
    tb_in_b = 8'b00000000;
    
    #100 
    tb_in_a = 8'b10101010;
    tb_in_b = 8'b00000000;
    
    #100
    tb_in_a = 8'b00000000;
    tb_in_b = 8'b11111111;
    
    #100
    tb_in_a = 8'b00000000;
    tb_in_b = 8'b10101010;
    
    #100
    tb_sel = 2'b01;
    tb_in_a = 8'b00000000;
    tb_in_b = 8'b00000000;
    
    #100 
    tb_in_a = 8'b11111111;
    tb_in_b = 8'b00000000;
    
    #100 
    tb_in_a = 8'b10101010;
    tb_in_b = 8'b00000000;
    
    #100
    tb_in_a = 8'b00000000;
    tb_in_b = 8'b11111111;
    
    #100
    tb_in_a = 8'b00000000;
    tb_in_b = 8'b10101010;
    
    #100
    tb_sel = 2'b10;
    tb_in_a = 8'b00000000;
    tb_in_b = 8'b00000000;
    
    #100 
    tb_in_a = 8'b11111111;
    tb_in_b = 8'b00000000;
    
    #100 
    tb_in_a = 8'b10101010;
    tb_in_b = 8'b00000000;
    
    #100
    tb_in_a = 8'b00000000;
    tb_in_b = 8'b11111111;
    
    #100
    tb_in_a = 8'b00000000;
    tb_in_b = 8'b10101010;
    
    #100
    tb_sel = 2'b11;
    tb_in_a = 8'b00000000;
    tb_in_b = 8'b00000000;
    
    #100 
    tb_in_a = 8'b11111111;
    tb_in_b = 8'b00000000;
    
    #100 
    tb_in_a = 8'b10101010;
    tb_in_b = 8'b00000000;
    
    #100
    tb_in_a = 8'b00000000;
    tb_in_b = 8'b11111111;
    
    #100
    tb_in_a = 8'b00000000;
    tb_in_b = 8'b10101010;
    end 

endmodule