
`timescale 1 ns / 1 ps

	module lab_01_ip_v1_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface data_interface
		parameter integer C_data_interface_DATA_WIDTH	= 32,
		parameter integer C_data_interface_ADDR_WIDTH	= 4
	)
	(
		// Users to add ports here

		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface data_interface
		input wire  data_interface_aclk,
		input wire  data_interface_aresetn,
		input wire [C_data_interface_ADDR_WIDTH-1 : 0] data_interface_awaddr,
		input wire [2 : 0] data_interface_awprot,
		input wire  data_interface_awvalid,
		output wire  data_interface_awready,
		input wire [C_data_interface_DATA_WIDTH-1 : 0] data_interface_wdata,
		input wire [(C_data_interface_DATA_WIDTH/8)-1 : 0] data_interface_wstrb,
		input wire  data_interface_wvalid,
		output wire  data_interface_wready,
		output wire [1 : 0] data_interface_bresp,
		output wire  data_interface_bvalid,
		input wire  data_interface_bready,
		input wire [C_data_interface_ADDR_WIDTH-1 : 0] data_interface_araddr,
		input wire [2 : 0] data_interface_arprot,
		input wire  data_interface_arvalid,
		output wire  data_interface_arready,
		output wire [C_data_interface_DATA_WIDTH-1 : 0] data_interface_rdata,
		output wire [1 : 0] data_interface_rresp,
		output wire  data_interface_rvalid,
		input wire  data_interface_rready
	);
// Instantiation of Axi Bus Interface data_interface
	lab_01_ip_v1_0_data_interface # ( 
		.C_S_AXI_DATA_WIDTH(C_data_interface_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_data_interface_ADDR_WIDTH)
	) lab_01_ip_v1_0_data_interface_inst (
	    .to_in_a(to_in_a),
	    .to_in_b(to_in_b),
	    .from_out(from_out),
		.S_AXI_ACLK(data_interface_aclk),
		.S_AXI_ARESETN(data_interface_aresetn),
		.S_AXI_AWADDR(data_interface_awaddr),
		.S_AXI_AWPROT(data_interface_awprot),
		.S_AXI_AWVALID(data_interface_awvalid),
		.S_AXI_AWREADY(data_interface_awready),
		.S_AXI_WDATA(data_interface_wdata),
		.S_AXI_WSTRB(data_interface_wstrb),
		.S_AXI_WVALID(data_interface_wvalid),
		.S_AXI_WREADY(data_interface_wready),
		.S_AXI_BRESP(data_interface_bresp),
		.S_AXI_BVALID(data_interface_bvalid),
		.S_AXI_BREADY(data_interface_bready),
		.S_AXI_ARADDR(data_interface_araddr),
		.S_AXI_ARPROT(data_interface_arprot),
		.S_AXI_ARVALID(data_interface_arvalid),
		.S_AXI_ARREADY(data_interface_arready),
		.S_AXI_RDATA(data_interface_rdata),
		.S_AXI_RRESP(data_interface_rresp),
		.S_AXI_RVALID(data_interface_rvalid),
		.S_AXI_RREADY(data_interface_rready)
	);

	// Add user logic here
    wire [15:0] to_in_a;
	wire [15:0] to_in_b;
	wire [16:0] from_out;
	
    adder adder(
    .in_a(to_in_a),
    .in_b(to_in_b),
    .out(from_out)
    );
	// User logic ends

	endmodule
