# Laboratory #4

In this laboratory you will get familiar with the following:

* Combinational Logic using `always_comb` statement

* System Verilog

* Nexys 4 DDR/ Nexys A7 development board and the 7 digit display

* Xilinx Vivado 2019.2

## Sequential Logic

In this laboratory we will use the `always_ff` statement. This statement is useful when you need to write sequential logic. The syntax is as follows:

```verilog
module module_name(
    input logic clk,
    // other input and output logic
    );

always_ff @(posedge clk)
    begin
    // sequential logic
    end
endmodule
```

As you can see, the `always_ff` statement is accompanied by an `@` to indicate the triggers that will activate our sequential logic, they are usually called sensitivity values. The `posedge` will indicate that we are using the rising edge of the `clk` signal to activate our logic. Other option is `negedge`, which uses the falling edge of the `clk` signal. When developing your hardware, stick to a single design pattern, ie use either a `posedge` or a `negedge` but not both.

### Flip Flop

The basic element for a sequential logic design is the D-type flip-flop. This flip-flop, produces an output that follows the input after a rising edge of the clock signal. It's System Verilog implementation looks like this:

```verilog
always_ff @(posedge clk)
    begin
        q <= d;
    end
```

When developing sequential logic designs we use the `<=` non-blocking assignment. The main characteristics of a non-blocking assignments are:

- statements execute in parallel;
- all the assignments will occur at the same time.

Just remember this:

> When developing combinational logic use blocking assingment `=`, and when developing sequential logic, use non-blocking assignment `<=`.



Latches are usually bad for synchronous designs, and therefore we will omit them. Do not use this coding style:

```verilog
always_ff @(clk)
    begin
        q <= d;
    end
```

## Exercise #1

In this first exercise you will implement three different sequential elements:

* D-type flip flop with synchronous reset

* D-type flip flop with asynchronous reset

* D-type latch

and compare their simulation. 

For your hardware designs you are provided with a file called `/scr/sources/sequential_logic.sv` where you will need to complete the modules to generate the specified hardware, your simulations are provided in a file called `/scr/sim/sequential_logic_tb.sv`.



Your main top module is called `sequential_logic` and it's testbench is `sequential_logic_tb`.



After you successfully completed your simulation, proceed to synthesize your design. Analyze your design and try to spot something strange on it's hardware.

## Exercise #2

Counters are among the most useful sequential designs that your will use when developing hardware solutions, therefore is important to create one.

The following piece of code shows how you can create an asynchronous counter

```verilog
// Note that enable is synchronous and reset is asynchronous
always @(posedge clk, posedge reset)
    begin
        if (reset)
            begin
                count <= {N{1'b0}};
            end
        else if (enable)
            begin
                count <= count + 1'b1;
            end
    
    end
```

For this exercise use the file provided in `/scr/source/counter.sv` and add the necessary code to create the `counter` module. Simulate your design with `/scr/sim/counter_tb.sv`

## Exercise #3

In **Laboratory #4**  you used the seven digit display of your board to develop some combinational logic designs. In this part, you will understand the two main sequential block that allow us to manage the seven digit display. 

### Shift Register

To set the on-off sequence of displays, we use a shift register that will be moving a `low` value on one anode signal, while retaining a `high` on the other anode signals.

The following code shows how you can create a shift register

```verilog
  always @(posedge clk, posedge reset)
    begin
        if (reset == 1)
            begin
                counter <= 8'b11111110;
            end
         else
            begin
                counter <= {counter[6:0], counter[7]};
            end
            
     end
```

### Clock Divider

A clock divider is a circuit that allow us to create a slower clock by giving as input other clock. In the following code, we show how you can implement a clock divider. This code uses the `localparam` directive, which allows you to create a local parameter inside a module. In this case, we define a `constantNumber` that will set how long the `counter` used in this block will count. By keeping track of a counter, and when it reaches the  `constantNumber` value, we alternate the `clk_out` value, resulting in a slower clock.

```verilog
   localparam constantNumber = N;
   
     always @(posedge clk, posedge reset)
        begin
            if (reset == 1'b1)
                begin
                    counter <= 0;
                end
            else if (counter == constantNumber - 1)
                begin
                    counter <= 32'b0;;
                end
            else
                begin
                    counter <= counter + 1'b1;
                end
        
        end
        
    always @ (posedge clk, posedge reset)
        begin
            if (reset == 1'b1)
                clk_out <= 1'b0;
            else if (counter == constantNumber - 1)
                clk_out <= ~clk_out;
            else
                clk_out <= clk_out;
        end 
```

For this exercise use the `/scr/source/display.sv`and edit the `anode_controller` and `clock_divider` modules.

For the `clock_divider` module, a testbench is provided in `/scr/sim/clock_divider_tb.sv`. You can create your own testbech for the `anode_controller` module.

## Exercise #4

For this exercise, you will use again the file `src/sources/counter.sv`,  which includes a module called `top_counter`, in here you need to complete what is indicated in order to create a module that creates a counter that will show its results in a seven digit display.

The way to test your design will be by synthesizing, implementing and generating the bitstream and porting to your board.

- If your development board is a Nexys4 use the `src/constrs/nexys4.xdc`

- If your development board is a NexysA7 use the `src/constrs/nexysA7.xdc`
