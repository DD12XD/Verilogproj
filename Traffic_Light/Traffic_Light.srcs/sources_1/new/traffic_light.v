`timescale 1ns / 1ps
module traffic_light
(
input wire clk,
input wire reset,
output reg r1, y1, g1, r2, y2, g2, r3, gy3
);

reg [1:0] current_state1, next_state1, current_state2, next_state2, current_state3, next_state3;
reg [32:0] counter_r1, counter_y1, counter_g1, counter_r2, counter_y2, counter_g2, counter_r3, counter_gy3;

always @(posedge clk)
begin
    if(reset)
    begin
        current_state1 <= 2'b00;
        current_state2 <= 2'b00;
        current_state3 <= 2'b00;
    end
    else
    begin
        current_state1 <= next_state1;
        current_state2 <= next_state2;
        current_state3 <= next_state3;
    end
end

always @(*)
begin
    case(current_state1)
        2'b00: next_state1 = 2'b01;
        2'b01: next_state1 = (counter_r1 == 33'b110100001001110111000011000000000)? 2'b10 : 2'b01;
        2'b10: next_state1 = (counter_g1 == 33'b010110010110100000101111000000000)? 2'b11 : 2'b10;
        2'b11: next_state1 = (counter_y1 == 33'b000011101110011010110010100000000)? 2'b01 : 2'b11;
    endcase
end

always @(*)
begin
    case(current_state2)
        2'b00: next_state2 = 2'b01;
        2'b01: next_state2 = (counter_r2 == 33'b110100001001110111000011000000000)? 2'b10 : 2'b01;
        2'b10: next_state2 = (counter_g2 == 33'b010110010110100000101111000000000)? 2'b11 : 2'b10;
        2'b11: next_state2 = (counter_y2 == 33'b000011101110011010110010100000000)? 2'b01 : 2'b11;
    endcase
end

always @(*)
begin
    case(current_state3)
        2'b00: next_state3 = 2'b10;
        2'b01: next_state3 = (counter_r3 == 33'b110100001001110111000011000000000)? 2'b10 : 2'b01;
        2'b10: next_state3 = (counter_gy3 == 33'b011010000100111011100001100000000)? 2'b01 : 2'b10;
    endcase
end

always @(posedge clk)
begin
    case(current_state1)
        2'b00:
        begin
            r1 <= 1'b0;
            y1 <= 1'b0;
            g1 <= 1'b0;
            counter_r1 <= 33'b011010000100111011100001100000000;
            counter_y1 <= 33'b0;
            counter_g1 <= 33'b0;
        end
        
        2'b01:
        begin
            r1 <= 1'b1;
            y1 <= 1'b0;
            g1 <= 1'b0;
            counter_r1 <= counter_r1 + 1;
            counter_y1 <= 33'b0;
        end
        
        2'b10:
        begin
            r1 <= 1'b0;
            y1 <= 1'b0;
            g1 <= 1'b1;
            counter_g1 <= counter_g1 + 1;
            counter_r1 <= 33'b0;
        end
        
        2'b11:
        begin
            r1 <= 1'b0;
            y1 <= 1'b1;
            g1 <= 1'b0;
            counter_y1 <= counter_y1 + 1;
            counter_g1 <= 33'b0;
        end
    endcase
end

always @(posedge clk)
begin
    case(current_state2)
        2'b00:
        begin
            r2 <= 1'b0;
            y2 <= 1'b0;
            g2 <= 1'b0;
            counter_r2 <= 33'b0;
            counter_y2 <= 33'b0;
            counter_g2 <= 33'b0;
        end
        
        2'b01:
        begin
            r2 <= 1'b1;
            y2 <= 1'b0;
            g2 <= 1'b0;
            counter_r2 <= counter_r2 + 1;
            counter_y2 <= 33'b0;
        end
        
        2'b10:
        begin
            r2 <= 1'b0;
            y2 <= 1'b0;
            g2 <= 1'b1;
            counter_g2 <= counter_g2 + 1;
            counter_r2 <= 33'b0;
        end
        
        2'b11:
        begin
            r2 <= 1'b0;
            y2 <= 1'b1;
            g2 <= 1'b0;
            counter_y2 <= counter_y2 + 1;
            counter_g2 <= 33'b0;
        end
    endcase
end

always @(posedge clk)
begin
    case(current_state3)
        2'b00:
        begin
            r3 <= 1'b0;
            gy3 <= 1'b0;
            counter_r3 <= 33'b0;
            counter_gy3 <= 33'b0;
        end
        
        2'b01:
        begin
            r3 <= 1'b1;
            gy3 <= 1'b0;
            counter_r3 <= counter_r3 + 1;
            counter_gy3 <= 33'b0;
        end
        
        2'b10:
        begin
            r3 <= 1'b0;
            gy3 <= 1'b1;
            counter_gy3 <= counter_gy3 + 1;
            counter_r3 <= 33'b0;
        end
    endcase
end
endmodule