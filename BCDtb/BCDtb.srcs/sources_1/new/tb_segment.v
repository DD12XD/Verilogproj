`timescale 1ns / 1ps

module tb_segment;

    reg bcd3, bcd2, bcd1, bcd0;  
    wire a, b, c, d, e, f, g;    
    
    
    segment uut (
        .bcd3(bcd3), .bcd2(bcd2), .bcd1(bcd1), .bcd0(bcd0),
        .a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g)
    );

    initial begin
       
        $monitor("BCD = %b%b%b%b | Segments = %b%b%b%b%b%b%b", 
                  bcd3, bcd2, bcd1, bcd0, a, b, c, d, e, f, g);
        
        bcd3 = 0; bcd2 = 0; bcd1 = 0; bcd0 = 0; #10;  
        bcd3 = 0; bcd2 = 0; bcd1 = 0; bcd0 = 1; #10;  
        bcd3 = 0; bcd2 = 0; bcd1 = 1; bcd0 = 0; #10; 
        bcd3 = 0; bcd2 = 0; bcd1 = 1; bcd0 = 1; #10;  
        bcd3 = 0; bcd2 = 1; bcd1 = 0; bcd0 = 0; #10;  
        bcd3 = 0; bcd2 = 1; bcd1 = 0; bcd0 = 1; #10;  
        bcd3 = 0; bcd2 = 1; bcd1 = 1; bcd0 = 0; #10; 
        bcd3 = 0; bcd2 = 1; bcd1 = 1; bcd0 = 1; #10;  
        bcd3 = 1; bcd2 = 0; bcd1 = 0; bcd0 = 0; #10;  
        bcd3 = 1; bcd2 = 0; bcd1 = 0; bcd0 = 1; #10;  

    
        bcd3 = 1; bcd2 = 0; bcd1 = 1; bcd0 = 0; #10;  
        bcd3 = 1; bcd2 = 1; bcd1 = 0; bcd0 = 0; #10; 


        $finish;
    end

endmodule
