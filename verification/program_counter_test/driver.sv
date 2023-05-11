`include "program_counter_txn_item.svh"

class driver #(parameter ADDR_WIDTH = 4);
    virtual program_counter_interface #(.ADDR_WIDTH(ADDR_WIDTH)) pc_if;
    event drv_done;
    mailbox drv_mbx;

    typedef program_counter_txn_item #(.ADDR_WIDTH(ADDR_WIDTH)) txn_item;

    task run();
        $display("T=%0t [Driver] starting ... ", $time);

        @ (negedge pc_if.CLK_n);
        forever begin
            txn_item txn;

            $display("T=%0t [Driver] waiting for item ...", $time);

            @ (negedge pc_if.CLK_n);
            drv_mbx.get(txn);
            print(txn);

            pc_if.Cp <= txn.Cp;
            pc_if.Ep <= txn.Ep;
            pc_if.CLR_n <= txn.CLR_n;
            -> drv_done;
        end
    endtask

    function void print(txn_item txn);
        $display("T=%0t [Driver] Cp=0x%0h, Ep=0x%0h, CLR_n=0x%0h", $time, txn.Cp, txn.Ep, txn.CLR_n);
    endfunction
endclass
