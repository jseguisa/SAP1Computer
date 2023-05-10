module ring_counter #(parameter COUNTER_OUTPUT_BUS_WIDTH = 6)(
    input clk,
    input clr_,
    output logic [COUNTER_OUTPUT_BUS_WIDTH-1:0] counter_out);
    
    always_ff @(posedge clk, negedge clr_) begin
        if (~clr_) begin
            counter_out <= 1;
        end else begin
            counter_out <= {counter_out[COUNTER_OUTPUT_BUS_WIDTH-2:0],
                counter_out[COUNTER_OUTPUT_BUS_WIDTH-1]};
        end
    end
endmodule