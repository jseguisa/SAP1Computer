module instruction_register #(
    parameter DATA_WIDTH = 8,
    parameter INSTRUCTION_WIDTH = 4)(
        input clk,
        input Li_bar,
        input Ei_bar,
        input [DATA_WIDTH-1:0] w_bus_data,
        output logic [INSTRUCTION_WIDTH-1:0] instruction_bus,
        output logic [DATA_WIDTH-INSTRUCTION_WIDTH-1:0] w_bus_operand);

    logic [DATA_WIDTH-1:0] internal_register;

    always_ff @(posedge clk) begin
        if (1'b0 == Li_bar) begin
            internal_register <= w_bus_data;
        end
    end

    always_latch begin
        if (1'b0 == Ei_bar) begin
            w_bus_operand[3:0] = internal_register[3:0];
        end
    end

    always_comb begin
        instruction_bus[3:0] = internal_register[7:4];
    end
endmodule
