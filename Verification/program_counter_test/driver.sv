class driver;
    virtual program_counter_interface pc_if;
    event drv_done;
    mailbox drv_mbx;

    task run();
        $display("T=%0t [Driver] starting ... ", $time);

        @ (negedge pc_if.CLK_n);
        forever begin
            virtual program_counter_item txn;

            $display("T=%0t [Driver] waiting for item ...", $time);
            drv_mbx.get(txn);
            txn.print("Driver");
            pc_if.Cp <= 0;
            pc_if.Ep <= txn.Ep;
            pc_if.CLR_n <= txn.CLR_n;

            @ (negedge pc_if.CLK_n);
            pc_if.Cp <= 1;
            -> drv_done;
        end

    endtask
endclass
