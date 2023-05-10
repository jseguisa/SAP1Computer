module program_counter #(parameter ADDR_WIDTH = 4)(
    input clk,
    input Cp,
    input clear_bar,
    input Ep,
    output logic [ADDR_WIDTH-1:0] out);
    
    logic [ADDR_WIDTH-1:0] counter;
    
    always_ff @(negedge clk or negedge clear_bar) begin
        if (1'b0 == clear_bar)
            counter <= 4'b0;
        else begin
            if (1'b1 == Cp)
                counter <= counter + 1;
            else
                counter <= counter;
        end
    end
    
    always_comb begin
        if (1'b1 == Ep)
            out = counter;
        else
            out = 4'bZ;
    end
endmodule
