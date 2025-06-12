`timescale 1ns / 1ps
module segment (
    input wire bcd3,  // MSB
    input wire bcd2,
    input wire bcd1,
    input wire bcd0,  // LSB
    output wire a,
    output wire b,
    output wire c,
    output wire d,
    output wire e,
    output wire f,
    output wire g
);

    assign a = ~bcd3 & (bcd1 | (bcd2 & bcd0) | (~bcd2 & ~bcd0));
    assign b = ~bcd3 & ((~bcd2 & bcd0) | (bcd2 & ~bcd0));
    assign c = ~bcd3 & ((~bcd1 & ~bcd0) | bcd2);
    assign d = ~bcd3 & ((bcd2 & ~bcd1 & bcd0) | (~bcd2 & ~bcd0 & bcd1) | (~bcd2 & bcd0) | (bcd1 & bcd2));
    assign e = ~bcd3 & ((~bcd2 & bcd0) | (bcd1 & ~bcd2));
    assign f = ~bcd3 & ((bcd1 & bcd2) | (~bcd1 & ~bcd2 & bcd0) | (~bcd1 & bcd2));
    assign g = ~bcd3 & ((bcd1 & ~bcd2) | (bcd2 & ~bcd1) | (~bcd2 & bcd0));

endmodule
