`include "program_counter_txn_item.svh"
`include "environment.sv"

class test;
    environment env0;
    mailbox drv_mbx;

    function new();
        drv_mbx = new();
        env0 = new();
    endfunction

    virtual task run();
        env0.d0.drv_mbx = drv_mbx;

        fork
            env0.run();
        join_none

        apply_stim();
    endtask

    virtual task apply_stim();
        program_counter_txn_item txn;

        $display("T=%0t [Test] Stating stimulus ... ", $time);
        txn = new();
        txn.Cp = 0;
        txn.Ep = 0;
        txn.CLR_n = 1;
        drv_mbx.put(txn);

        txn = new();
        txn.Cp = 1;
        txn.Ep = 0;
        txn.CLR_n = 1;
        drv_mbx.put(txn);

        txn = new();
        txn.Cp = 1;
        txn.Ep = 1;
        txn.CLR_n = 0;
        drv_mbx.put(txn);

        for (int i = 0; i < 16; i++) begin
            txn = new();
            txn.Cp = 1;
            txn.Ep = 1;
            txn.CLR_n = 1;
            drv_mbx.put(txn);
        end
    endtask
endclass
