interface program_counter_interface #(
    parameter ADDR_WIDTH = 4)(
        input logic CLK_n);
        logic Cp;
        logic Ep;
        logic CLR_n;
        logic [ADDR_WIDTH-1:0] w_bus_addr;
endinterface
