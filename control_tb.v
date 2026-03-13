`timescale 1ns/1ps

module control_tb;

reg [3:0] opcode;

wire reg_write;
wire [2:0] alu_control;

control_unit uut(
.opcode(opcode),
.reg_write(reg_write),
.alu_control(alu_control)
);

initial begin

$dumpfile("dump.vcd");
$dumpvars(0,control_tb);

opcode = 4'b0001; #10;
opcode = 4'b0010; #10;
opcode = 4'b0011; #10;
opcode = 4'b0100; #10;

#50 $finish;

end

endmodule
