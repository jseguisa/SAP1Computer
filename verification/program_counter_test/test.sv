`include "program_counter_txn_item.svh"
`include "environment.sv"

class test #(parameter ADDR_WIDTH = 4);
    environment #(.ADDR_WIDTH(ADDR_WIDTH)) env0;
    mailbox drv_mbx;

    typedef program_counter_txn_item #(.ADDR_WIDTH(ADDR_WIDTH)) txn_item;

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

    task apply_stim();
        txn_item txn;

        $display("T=%0t [Test] Starting stimulus ... ", $time);
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
        txn.CLR_n = 1;
        drv_mbx.put(txn);

        txn = new();
        txn.Cp = 1;
        txn.Ep = 1;
        txn.CLR_n = 0;
        drv_mbx.put(txn);

        for (int i = 0; i < 20; i++) begin
            txn = new();
            txn.Cp = 1;
            txn.Ep = 1;
            txn.CLR_n = 1;
            drv_mbx.put(txn);
        end

        toggle_CLR_n();
        toggle_Cp();
        toggle_Ep();
    endtask

    task toggle_CLR_n();
        txn_item txn;

        txn = new();
        txn.Cp = 1;
        txn.Ep = 1;
        txn.CLR_n = 0;
        drv_mbx.put(txn);

        txn = new();
        txn.Cp = 1;
        txn.Ep = 1;
        txn.CLR_n = 1;
        drv_mbx.put(txn);
    endtask

    task toggle_Cp();
        txn_item txn;

        txn = new();
        txn.Cp = 0;
        txn.Ep = 1;
        txn.CLR_n = 1;
        drv_mbx.put(txn);

        txn = new();
        txn.Cp = 0;
        txn.Ep = 1;
        txn.CLR_n = 1;
        drv_mbx.put(txn);

        txn = new();
        txn.Cp = 1;
        txn.Ep = 1;
        txn.CLR_n = 1;
        drv_mbx.put(txn);
    endtask

    task toggle_Ep();
        txn_item txn;

        txn = new();
        txn.Cp = 1;
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
        txn.CLR_n = 1;
        drv_mbx.put(txn);
    endtask
endclass
