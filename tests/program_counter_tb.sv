`timescale 1ns / 1ps

parameter PC_INPUT_BUS_WIDTH = 4;

module program_counter_tb;
    logic clk;
    logic clr;
    logic Cp;
    logic Ep;
    logic [PC_INPUT_BUS_WIDTH-1:0] pc_out;
    
    program_counter #(PC_INPUT_BUS_WIDTH) pc(
        .clk(clk),
        .clr(clr),
        .Cp(Cp),
        .Ep(Ep),
        .pc_out(pc_out));
        
    initial begin
        clk = 1;
        clr = 0;
        Cp = 0;
        Ep = 1;
        
        #10.5;
        Ep = 0;
        
        #10;
        Ep = 1;
        
        #10;
        clr = 1;
        Cp = 1;
        
        #40;
        clr = 0;
        
        #10;
        Cp = 0;
        
        #10;
        clr = 1;
        
        #10;
        Cp = 1;
        
        #40;
        Ep = 0;
        
        #10;
        Ep = 1;
        
        #40;
        $finish;
    end
    
    always #1 clk = ~clk;
endmodule
