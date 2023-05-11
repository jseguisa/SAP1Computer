`include "test.sv"

module program_counter_tb;
    localparam ADDR_WIDTH = 4;
    logic CLK_n;
    always #10 CLK_n = ~CLK_n;

    program_counter_interface #(
        .ADDR_WIDTH(ADDR_WIDTH)) pc_if(
            CLK_n);

    program_counter #(
        .ADDR_WIDTH(ADDR_WIDTH)) program_counter_0 (
            .CLK_n(CLK_n),
            .Cp(pc_if.Cp),
            .CLR_n(pc_if.CLR_n),
            .Ep(pc_if.Ep),
            .w_bus_addr(pc_if.w_bus_addr));


    initial begin
        test #(.ADDR_WIDTH(ADDR_WIDTH)) t0;

        CLK_n <= 1;
        pc_if.Cp <= 0;
        pc_if.Ep <= 0;
        pc_if.CLR_n <= 1;

        t0 = new();
        t0.env0.pc_if = pc_if;
        t0.run();

        #1000 $finish;
    end

    initial begin
        $wlfdumpvars();
    end
endmodule
