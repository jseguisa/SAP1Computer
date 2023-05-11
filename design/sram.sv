module sram #(
    parameter ADDR_WIDTH = 4,
    parameter DATA_WIDTH = 8)(
        input ce_bar,
        input we_bar,
        input run_not_prog,
        input [ADDR_WIDTH-1:0] addr,
        input [DATA_WIDTH-1:0] wr_data,
        output logic [DATA_WIDTH-1:0] rd_data);


    localparam int SRAM_DEPTH = $pow(ADDR_WIDTH, 2);
    logic [DATA_WIDTH-1:0] sram_data [SRAM_DEPTH-1:0];
    logic ce_bar_int;

    always_comb begin
        if (1'b1 == run_not_prog)
            ce_bar_int = ce_bar;
        else
            ce_bar_int = 1'b0;
    end

    always_latch begin
        if (1'b0 == ce_bar_int) begin
            if (1'b0 == we_bar)
                sram_data[addr] <= wr_data;
            else
                rd_data <= sram_data[addr];
        end
    end
endmodule
