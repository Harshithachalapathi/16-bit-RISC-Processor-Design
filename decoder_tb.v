`timescale 1ns/1ps

module decoder_tb;

reg [15:0] instruction;

wire [3:0] opcode;
wire [2:0] reg1;
wire [2:0] reg2;

instruction_decoder uut(
.instruction(instruction),
.opcode(opcode),
.reg1(reg1),
.reg2(reg2)
);

initial begin

$dumpfile("dump.vcd");
$dumpvars(0,decoder_tb);

instruction = 16'b0001_010_011_000000;
#10;

instruction = 16'b0010_001_111_000000;
#10;

instruction = 16'b0100_101_010_000000;
#10;

#50 $finish;

end

endmodule
