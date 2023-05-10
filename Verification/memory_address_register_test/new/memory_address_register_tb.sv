module memory_address_register_tb;
    localparam ADDR_WIDTH = 4;
    logic clk;
    logic Lm_bar;
    logic run_not_prog;
    logic [ADDR_WIDTH-1:0] w_bus;
    logic [ADDR_WIDTH-1:0] prog_bus;
    logic [ADDR_WIDTH-1:0] out;
    
    memory_address_register #(
        .ADDR_WIDTH(ADDR_WIDTH)) memory_address_register_0 (
            .clk(clk),
            .Lm_bar(Lm_bar),
            .run_not_prog(run_not_prog),
            .w_bus_in(w_bus),
            .prog_bus_in(prog_bus),
            .out(out));
        
    always #10 clk = ~clk;
        
    initial begin
        clk = 1;
        Lm_bar = 1;
        run_not_prog = 1;
        prog_bus = 4'hF;
        w_bus = 4'h0;
        
        #50 Lm_bar = 0;
        
        repeat(16) begin
            #20 w_bus = w_bus + 1;
        end
        
        #10
        run_not_prog = 0;
        prog_bus = 4'hA;
        
        repeat(16) begin
            #20 prog_bus = prog_bus + 1;
        end
    end
endmodule
