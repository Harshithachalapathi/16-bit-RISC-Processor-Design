// ================= PROGRAM COUNTER =================

module program_counter(
input clk,
input reset,
output reg [15:0] pc
);

always @(posedge clk or posedge reset)
begin
if(reset)
pc <= 0;
else
pc <= pc + 1;
end

endmodule


// ================= REGISTER FILE =================

module register_file(
input clk,
input reg_write,
input [2:0] read_reg1,
input [2:0] read_reg2,
input [2:0] write_reg,
input [15:0] write_data,
output [15:0] read_data1,
output [15:0] read_data2
);

reg [15:0] registers [7:0];

assign read_data1 = registers[read_reg1];
assign read_data2 = registers[read_reg2];

always @(posedge clk)
begin
if(reg_write)
registers[write_reg] <= write_data;
end

endmodule


// ================= ALU =================

module alu(
input [15:0] A,
input [15:0] B,
input [2:0] alu_control,
output reg [15:0] result
);

always @(*)
begin

case(alu_control)

3'b000: result = A + B;
3'b001: result = A - B;
3'b010: result = A & B;
3'b011: result = A | B;
3'b100: result = A ^ B;
3'b101: result = A << 1;
3'b110: result = A >> 1;

default: result = 0;

endcase

end

endmodule


// ================= INSTRUCTION DECODER =================

module instruction_decoder(
input [15:0] instruction,
output [3:0] opcode,
output [2:0] reg1,
output [2:0] reg2
);

assign opcode = instruction[15:12];
assign reg1 = instruction[11:9];
assign reg2 = instruction[8:6];

endmodule


// ================= CONTROL UNIT =================

module control_unit(
input [3:0] opcode,
output reg reg_write,
output reg [2:0] alu_control
);

always @(*)
begin

case(opcode)

4'b0001: begin reg_write = 1; alu_control = 3'b000; end
4'b0010: begin reg_write = 1; alu_control = 3'b001; end
4'b0011: begin reg_write = 1; alu_control = 3'b010; end
4'b0100: begin reg_write = 1; alu_control = 3'b011; end

default: begin reg_write = 0; alu_control = 3'b000; end

endcase

end

endmodule


// ================= CPU TOP =================

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

instruction_decoder decoder(
.instruction(instruction),
.opcode(opcode),
.reg1(reg1),
.reg2(reg2)
);

control_unit control(
.opcode(opcode),
.reg_write(reg_write),
.alu_control(alu_control)
);

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

alu alu_unit(
.A(read_data1),
.B(read_data2),
.alu_control(alu_control),
.result(alu_result)
);

endmodule
