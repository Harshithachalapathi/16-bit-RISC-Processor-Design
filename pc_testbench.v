`timescale 1ns/1ps

module pc_tb;

reg clk;
reg reset;
wire [15:0] pc;

program_counter uut(
.clk(clk),
.reset(reset),
.pc(pc)
);

always #5 clk = ~clk;

initial begin

$dumpfile("dump.vcd");
$dumpvars(0,pc_tb);

clk = 0;
reset = 1;

#10 reset = 0;

#100 $finish;

end

endmodule
