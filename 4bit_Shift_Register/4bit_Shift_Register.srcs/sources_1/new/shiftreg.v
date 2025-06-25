`timescale 1ns / 1ps
module shiftreg(
input wire clk,
input wire rst,
output reg [3:0] led
);
reg [26:0] clk_div;
wire enable;
always @(posedge clk or posedge rst) begin
if (rst)
clk_div <= 27'd0;
else if (clk_div == 27'd99_999_999)
clk_div <= 27'd0;
else
clk_div <= clk_div + 1;
end
assign enable = (clk_div == 27'd99_999_999);
always @(posedge clk or posedge rst) begin
if (rst)
led <= 4'b1110;
else if (enable)
led <= {led[2:0], led[3]};
end
endmodule