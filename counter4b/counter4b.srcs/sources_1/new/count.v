module count (
    input wire clk,       
    input wire rst,
    output reg [3:0] count
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
            count <= 4'd0;
        else if (enable)
            count <= count + 1;
    end
endmodule

