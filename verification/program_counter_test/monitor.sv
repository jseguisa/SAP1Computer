`include "program_counter_txn_item.svh"

class monitor;
    virtual program_counter_interface pc_if;
    mailbox scb_mbx;

    task run();
        $display("T=%0t [Monitor] starting ... ", $time);

        forever begin
            program_counter_txn_item txn;

            @ (negedge pc_if.CLK_n);
            txn = new();
            txn.Cp = pc_if.Cp;
            txn.Ep = pc_if.Ep;
            txn.CLR_n = pc_if.CLR_n;
            txn.w_bus_addr = pc_if.w_bus_addr;
            print(txn);
        end
    endtask

    function void print(program_counter_txn_item txn);
        $display("T=%0t [Monitor] Cp=0x%0h, Ep=0x%0h, CLR_n=0x%0h, w_bus_addr=0x%0h",
            $time, txn.Cp, txn.Ep, txn.CLR_n, txn.w_bus_addr);
    endfunction
endclass
