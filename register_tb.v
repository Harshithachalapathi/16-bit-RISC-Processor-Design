`timescale 1ns/1ps

module register_tb;

reg clk;
reg reg_write;
reg [2:0] read_reg1;
reg [2:0] read_reg2;
reg [2:0] write_reg;
reg [15:0] write_data;

wire [15:0] read_data1;
wire [15:0] read_data2;

register_file uut(
.clk(clk),
.reg_write(reg_write),
.read_reg1(read_reg1),
.read_reg2(read_reg2),
.write_reg(write_reg),
.write_data(write_data),
.read_data1(read_data1),
.read_data2(read_data2)
);

always #5 clk = ~clk;

initial begin

$dumpfile("dump.vcd");
$dumpvars(0,register_tb);

clk = 0;
reg_write = 1;

write_reg = 3'b001;
write_data = 16'd25;

#10

read_reg1 = 3'b001;
read_reg2 = 3'b001;

#50 $finish;

end

endmodule
