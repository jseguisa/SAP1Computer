module ring_counter #(
    parameter COUNTER_OUTPUT_BUS_WIDTH = 6)(
        input clk,
        input clr,
        output t_out);
    
    logic clk;
    logic clr;
    logic [COUNTER_OUTPUT_BUS_WIDTH-1:0] t_out;
    
    always_ff @(posedge clk, negedge clr) begin
        if (clr == 0) begin
            t_out <= 6'b1;
        end
        else begin
            if (t_out == (1 << COUNTER_OUTPUT_BUS_WIDTH-1)) begin
                t_out <= 6'b1;               
            end
            else begin
                t_out <= t_out * 2;
            end
        end
    end
endmodule
