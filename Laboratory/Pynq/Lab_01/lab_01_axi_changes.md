# Lab_01 Readme:

The following changes were made for you to use Lab_01:
    
#### Top module: `lab_01_ip_v1_0`

* Added lines `51-53` with:
  
	`.to_in_a(to_in_a),`
	`.to_in_b(to_in_b),`
	`.from_out(from_out),`
  
* Added lines `75-83` with:
  
	`wire [15:0] to_in_a;
	wire [15:0] to_in_b;
	wire [16:0] from_out;`
  
  `adder adder(
    .in_a(to_in_a),
    .in_b(to_in_b),
    .out(from_out)
    );`
  
    
#### Lower module: `lab_01_ip_v1_0_data_interface`

* Added lines `18-21` with:
    `output wire [15:0] to_in_a,
    output wire [15:0] to_in_b,
    input wire [16:0] from_out,`

* Commented lines `248-254`


* Added line `265` with:
    `slv_reg2 <= from_out;`


* Added lines `403-404` with:
    `assign to_in_a = slv_reg0;
    assign to_in_b = slv_reg1;`
