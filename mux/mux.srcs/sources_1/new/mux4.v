`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.06.2025 19:03:22
// Design Name: 
// Module Name: mux4
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mux4(
input wire x1,
input wire x2,
input wire x3,
input wire x4,
input wire s1,
input wire s2,
output reg out
);
always@(*) begin
case({s1, s2})
2'b00: out=x1;
2'b01: out=x2;
2'b10: out=x3;
2'b11: out=x4;
endcase
end
endmodule



