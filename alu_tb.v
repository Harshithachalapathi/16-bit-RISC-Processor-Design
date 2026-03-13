`timescale 1ns/1ps

module alu_tb;

reg [15:0] A;
reg [15:0] B;
reg [2:0] alu_control;

wire [15:0] result;

alu uut(
.A(A),
.B(B),
.alu_control(alu_control),
.result(result)
);

initial begin

$dumpfile("dump.vcd");
$dumpvars(0,alu_tb);

A = 16'd20;
B = 16'd5;

alu_control = 3'b000; #10;
alu_control = 3'b001; #10;
alu_control = 3'b010; #10;
alu_control = 3'b011; #10;
alu_control = 3'b100; #10;

#50 $finish;

end

endmodule
