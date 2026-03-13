module cpu_top(
input clk,
input reset,
input [15:0] instruction
);

wire [3:0] opcode;
wire [2:0] reg1;
wire [2:0] reg2;

wire reg_write;
wire [2:0] alu_control;

wire [15:0] read_data1;
wire [15:0] read_data2;

wire [15:0] alu_result;

/* Instruction Decoder */
instruction_decoder decoder(
.instruction(instruction),
.opcode(opcode),
.reg1(reg1),
.reg2(reg2)
);

/* Control Unit */
control_unit control(
.opcode(opcode),
.reg_write(reg_write),
.alu_control(alu_control)
);

/* Register File */
register_file registers(
.clk(clk),
.reg_write(reg_write),
.read_reg1(reg1),
.read_reg2(reg2),
.write_reg(reg2),
.write_data(alu_result),
.read_data1(read_data1),
.read_data2(read_data2)
);

/* ALU */
alu alu_unit(
.A(read_data1),
.B(read_data2),
.alu_control(alu_control),
.result(alu_result)
);

endmodule
