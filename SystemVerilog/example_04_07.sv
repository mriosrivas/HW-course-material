//HDL Example 4.7 FULL ADDER

module fulladder(input logic a, b, cin,
    output logic s, cout);

    logic p, g;

    assign p = a ^ b;
    assign g = a & b;
    assign s = p ^ cin;
    assign cout = g | (p & cin);
    
endmodule


module fulladder_tb();

    logic a_tb, b_tb, cin_tb;
    logic s_tb, cout_tb;

    fulladder dut(.a(a_tb), 
                .b(b_tb), 
                .cin(cin_tb), 
                .s(s_tb), 
                .cout(cout_tb));
    
    initial begin
        a_tb = 0;
        b_tb = 0;
        cin_tb = 0;

        #10 a_tb = 1;
        b_tb = 1;
        cin_tb = 1;
    end


endmodule