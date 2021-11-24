//HDL Example 4.28 FULL ADDER USING NONBLOCKING ASSIGNMENTS
// nonblocking assignments (not recommended)

module fulladder(input logic a, b, cin,
    output logic s, cout);

    logic p, g;

    always_comb
        begin
            p <= a ^ b; // nonblocking
            g <= a & b; // nonblocking
            s <= p ^ cin;
            cout <= g | (p & cin);
        end
endmodule
