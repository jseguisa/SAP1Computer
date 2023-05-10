module memory_address_register #(parameter ADDR_WIDTH = 4)(
    input clk,
    input Lm_bar,
    input run_not_prog,
    input [ADDR_WIDTH-1:0] w_bus_in,
    input [ADDR_WIDTH-1:0] prog_bus_in,
    output logic [ADDR_WIDTH-1:0] out);
    
    logic [ADDR_WIDTH-1:0] internal_reg;
    
    always_ff @(posedge clk) begin
        if (1'b0 == Lm_bar)
            internal_reg <= w_bus_in;
        else
            internal_reg <= internal_reg;
    end
    
    always_comb begin
        if (1'b1 == run_not_prog)
            out = internal_reg;
        else
            out = prog_bus_in;
    end
endmodule
