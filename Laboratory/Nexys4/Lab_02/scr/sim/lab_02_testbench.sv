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



// Exercise #6
module full_adder_tb();
    logic tb_a;
    logic tb_b;
    logic tb_c_in;
    logic tb_s;
    logic tb_c_out;
    logic [2:0] temp; 
    
full_adder dut(
    .a(tb_a),
    .b(tb_b),
    .c_in(tb_c_in),
    .s(tb_s),
    .c_out(tb_c_out)
    );
     
 assign tb_a = temp[2];
 assign tb_b = temp[1];
 assign tb_c_in = temp[0];
 
 integer i;
    
    initial
        begin
            temp = 0;
            for (i=0; i<8; i=i+1)
                begin
                    #10 temp = temp + 1'b1;
                end      
        end

endmodule




module full_adder_4_bit_tb();
    logic [3:0] tb_A;
    logic [3:0] tb_B;
    logic [3:0] tb_S;
    logic tb_C_out;
    
    logic [4:0] tb_SUM;
    
    assign tb_SUM = {tb_C_out, tb_S};
    
full_adder_4_bit dut(
    .A(tb_A),
    .B(tb_B),
    .S(tb_S),
    .C_out(tb_C_out)
    );
     

 integer i = 0;
 integer j = 0;
    
    initial
        begin
            tb_A = 0;
            tb_B = 0;
            for (i=0; i<16; i=i+1)
                begin
                    #10 tb_A = tb_A + 1'b1;
                    for (j=0; j<16; j=j+1)
                        begin
                            #10 tb_B = tb_B + 1'b1;
                        end
                        tb_B = 0;
                end 
                tb_A = 0;     
        end

endmodule