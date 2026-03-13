module cpu_tb;

reg clk;
reg reset;
reg [15:0] instruction;

cpu_top uut(
.clk(clk),
.reset(reset),
.instruction(instruction)
);

always #5 clk = ~clk;

initial begin

$dumpfile("dump.vcd");
$dumpvars(0,cpu_tb);

clk = 0;
reset = 0;

instruction = 16'b0001_001_010_000000; #20;
instruction = 16'b0010_001_010_000000; #20;
instruction = 16'b0011_001_010_000000; #20;
instruction = 16'b0100_001_010_000000; #20;

#100 $finish;

end

endmodule
