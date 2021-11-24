//HDL Example 4.23 FULL ADDER USING always/process

module fulladder(input logic a, b, cin,
                output logic s, cout);

    logic p, g;

    always_comb     //always @(a, b, cin)
        begin
            p = a ^ b;              // blocking
            g = a & b;              // blocking
            s = p ^ cin;            // blocking
            cout = g | (p & cin);   // blocking
        end

endmodule