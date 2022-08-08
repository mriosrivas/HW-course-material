module alut_tb();

parameter SIZE = 8;

logic [SIZE-1:0] A_tb, B_tb, Y_tb; 
logic C_out_tb;
logic [2:0] code_tb;

alu #(SIZE) dut (.code(code_tb), .A(A_tb), .B(B_tb), .Y(Y_tb), .C_out(C_out_tb));

initial
    begin
        code_tb = 3'b000;
        A_tb = 16;
        B_tb = 15;
        
        #100 code_tb = 3'b001;
        #100 code_tb = 3'b010;
        #100 code_tb = 3'b011;
        #100 code_tb = 3'b100;
        #100 code_tb = 3'b101;
        #100 code_tb = 3'b110;
        #100 code_tb = 3'b111;
        
        #100 code_tb = 3'b000;
        A_tb = 31;
        B_tb = 32;
        
        #100 code_tb = 3'b001;
        #100 code_tb = 3'b010;
        #100 code_tb = 3'b011;
        #100 code_tb = 3'b100;
        #100 code_tb = 3'b101;
        #100 code_tb = 3'b110;
        #100 code_tb = 3'b111;
    
    end

endmodule
