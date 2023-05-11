module SAP1Top #(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 4,
    parameter INSTRUCTION_WIDTH = 4)
    (
        input clk,
        input clear_bar,
        input run_not_prog,
        input [ADDR_WIDTH-1:0] prog_addr_bus,
        input [DATA_WIDTH-1:0] prog_data_bus,
        output logic [DATA_WIDTH-1:0] data_out);

    // W_Bus
    logic [DATA_WIDTH-1:0] w_bus_data;
    logic [ADDR_WIDTH-1:0] w_bus_addr;
    logic [DATA_WIDTH-INSTRUCTION_WIDTH-1:0] w_bus_operand;

    // Program Counter
    logic Cp;
    logic Ep;

    // MAR
    logic Lm_bar;
    logic [ADDR_WIDTH-1:0] mar_to_sram_bus;

    // SRAM
    logic ce_bar;
    logic we_bar;

    // Instruction Register
    logic Li_bar;
    logic Ei_bar;
    logic [INSTRUCTION_WIDTH-1:0] instruction_bus;

    // Instruction Decoder
    logic lda;
    logic add;
    logic sub;
    logic out;
    logic hlt;

    always_comb w_bus_addr [ADDR_WIDTH-1:0] = w_bus_data[ADDR_WIDTH-1:0];
    always_comb w_bus_operand [DATA_WIDTH-INSTRUCTION_WIDTH-1:0] = w_bus_data[ADDR_WIDTH-1:0];

    program_counter #(
        .ADDR_WIDTH(ADDR_WIDTH)) program_counter_0 (
            .clk(clk),
            .Cp(Cp),
            .clear_bar(clear_bar),
            .Ep(Ep),
            .out(w_bus_addr));

    memory_address_register #(
        .ADDR_WIDTH(ADDR_WIDTH)) memory_address_register_0 (
            .clk(clk),
            .Lm_bar(Lm_bar),
            .run_not_prog(run_not_prog),
            .w_bus_in(w_bus_addr),
            .prog_bus_in(prog_addr_bus),
            .out(mar_to_sram_bus));

    sram #(
        .ADDR_WIDTH(ADDR_WIDTH),
        .DATA_WIDTH(DATA_WIDTH)) sram_0 (
            .ce_bar(ce_bar),
            .we_bar(we_bar),
            .run_not_prog(run_not_prog),
            .addr(mar_to_sram_bus),
            .wr_data(prog_data_bus),
            .rd_data(w_bus_data));

    instruction_register #(
        .DATA_WIDTH(DATA_WIDTH),
        .INSTRUCTION_WIDTH(INSTRUCTION_WIDTH)) instruction_register_0 (
            .clk(clk),
            .Li_bar(Li_bar),
            .Ei_bar(Ei_bar),
            .w_bus_data(w_bus_data),
            .instruction_bus(instruction_bus),
            .w_bus_operand(w_bus_operand));

    instruction_decoder #(
        .INSTRUCTION_WIDTH(INSTRUCTION_WIDTH)) instruction_decoder_0 (
            .instruction_bus(instruction_bus),
            .lda(lda),
            .add(add),
            .sub(sub),
            .out(out),
            .hlt(hlt));

endmodule
