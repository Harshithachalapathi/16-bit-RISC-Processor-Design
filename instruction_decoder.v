module instruction_decoder(
input [15:0] instruction,

output [3:0] opcode,
output [2:0] reg1,
output [2:0] reg2
);

assign opcode = instruction[15:12];
assign reg1   = instruction[11:9];
assign reg2   = instruction[8:6];

endmodule
