module program_counter_tb;
    localparam ADDR_WIDTH = 4;
    logic clk;
    logic Cp;
    logic clear_bar;
    logic Ep;
    logic [ADDR_WIDTH-1:0] out;
    
    program_counter #(
        .ADDR_WIDTH(ADDR_WIDTH)) program_counter_0 (
            .clk(clk),
            .Cp(Cp),
            .clear_bar(clear_bar),
            .Ep(Ep),
            .out(out));
        
    always #10 clk = ~clk;
        
    initial begin
        clk = 0;
        clear_bar = 0;
        Cp = 0;
        Ep = 1;

        #90 clear_bar = 1;
        #10 Cp = 1;
        #340 clear_bar = 0;
        #80 clear_bar = 1;
        #100 Ep = 0;
        #90 Ep = 1;
    end
endmodule
