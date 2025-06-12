`timescale 1ns / 1ps
module segment (
    input wire s0,
    input wire s1,
    input wire s2,
    input wire s3,
    output wire a,
    output wire b,
    output wire c,
    output wire d,
    output wire e,
    output wire f,
    output wire g
);
assign a = s2 || (s1 & s3) || s0 || (~s1 & ~s3);
assign b = s0 || (~s2 & ~s3) || (s1 & ~s2) || (s1 & ~s3);
assign c = (s2 & ~s3) || (s0 & ~s3) || (~s1 & ~s3);
assign d = s0 || (s2 & ~s3) || (~s1 & ~s3) || (s1 & ~s2 & s3) || (~s1 & s2 & s3);
assign e = s0 || ~s2 || s3 || s1;
assign f = ~s1 || (s2 & s3) || (~s2 & ~s3);
assign g = s0 || (s1 & ~s2) || (~s1 & s2) || (s2 & ~s3);
endmodule
