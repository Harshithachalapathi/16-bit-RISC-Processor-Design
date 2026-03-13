module control_unit(
input [3:0] opcode,

output reg reg_write,
output reg [2:0] alu_control
);

always @(*)
begin

case(opcode)

4'b0001: begin
reg_write = 1;
alu_control = 3'b000; // ADD
end

4'b0010: begin
reg_write = 1;
alu_control = 3'b001; // SUB
end

4'b0011: begin
reg_write = 1;
alu_control = 3'b010; // AND
end

4'b0100: begin
reg_write = 1;
alu_control = 3'b011; // OR
end

default: begin
reg_write = 0;
alu_control = 3'b000;
end

endcase

end

endmodule
