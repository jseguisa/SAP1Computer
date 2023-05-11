// Transaction Object

`ifndef __PROGRAM_COUNTER_TXN_ITEM__
`define __PROGRAM_COUNTER_TXN_ITEM__

class program_counter_txn_item #(parameter ADDR_WIDTH = 4);
    rand bit Cp;
    rand bit Ep;
    rand bit CLR_n;
    logic [ADDR_WIDTH-1:0] w_bus_addr;
endclass

`endif
