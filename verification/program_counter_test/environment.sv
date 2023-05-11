`include "driver.sv"
`include "monitor.sv"

class environment;
    virtual program_counter_interface pc_if;
    driver d0;
    monitor m0;

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
