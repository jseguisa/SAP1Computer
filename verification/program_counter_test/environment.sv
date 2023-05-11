`include "driver.sv"
`include "monitor.sv"

class environment #(parameter ADDR_WIDTH = 4);
    virtual program_counter_interface #(.ADDR_WIDTH(ADDR_WIDTH)) pc_if;
    driver #(.ADDR_WIDTH(ADDR_WIDTH)) d0;
    monitor #(.ADDR_WIDTH(ADDR_WIDTH)) m0;

    function new();
        d0 = new();
        m0 = new();
    endfunction

    virtual task run();
        d0.pc_if = pc_if;
        m0.pc_if = pc_if;

        fork
            d0.run();
            m0.run();
        join_any
    endtask
endclass
