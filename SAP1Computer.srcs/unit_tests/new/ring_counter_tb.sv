`timescale 1ns / 1ps

parameter COUNTER_OUTPUT_BUS_WIDTH = 6;

module ring_counter_tb;
    
    logic clk;
    logic clr;
    logic [COUNTER_OUTPUT_BUS_WIDTH-1:0] t_out;

    ring_counter #(COUNTER_OUTPUT_BUS_WIDTH) rc(
        .clk(clk),
        .clr(clr),
        .t_out(t_out));
        
    initial begin
        clk = 1;
        clr = 0;
        
        #10.5;
        clr = 1;
        
        #40;
        clr = 0;
        
        #40;
        clr = 1;
        
        #40;
        $finish;
    end
    
    always #1 clk = ~clk;
endmodule
