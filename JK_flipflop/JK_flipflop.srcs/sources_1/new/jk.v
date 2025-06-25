module jk (
input wire j,
input wire k,
input wire clk,
output reg q
);
wire qn;
wire nq;
assign qn = ~k & q;
assign nq = (j & ~q) | qn;
always @(posedge clk) begin
q <= nq;
end
endmodule