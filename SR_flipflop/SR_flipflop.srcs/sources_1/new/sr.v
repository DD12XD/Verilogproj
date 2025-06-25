module sr(
input wire s,
input wire r,
input wire clk,
output reg q
);
wire qn;
wire nq;
assign qn = ~r & q;
assign nq = s||qn;
always @(posedge clk) begin
if (s & r)
q <= 1'bx;
else
q <=nq;
end
endmodule