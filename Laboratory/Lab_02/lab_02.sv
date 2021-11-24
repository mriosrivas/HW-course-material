module alu #(parameter SIZE = 16)
    (
    input logic [2:0] code,
    input logic [SIZE-1:0] A, 
    input logic [SIZE-1:0] B,
    output logic [SIZE-1:0] Y,
    output logic C_out);
    
    logic [SIZE:0] temp_add;
    logic [SIZE-1:0] temp_slt;
    
    always_comb
        begin
            case (code)
                3'b000 : Y = A & B;
                3'b001 : Y = A | B;
                3'b010 : Y = temp_add[SIZE-1:0];
                3'b011 : Y = A & B;
                3'b100 : Y = A & (~B);
                3'b101 : Y = A | (~B);
                3'b110 : Y = A - B;
                3'b111 : Y = {SIZE{temp_slt[SIZE-1]}};     
            endcase
        
        end

assign temp_add = A + B;  
assign C_out = temp_add[SIZE];  
assign temp_slt = A - B;

endmodule
