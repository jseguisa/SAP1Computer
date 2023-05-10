// Transaction Object

class program_counter_item;
    rand bit Cp;
    rand bit Ep;
    rand bit CLR_n;
    bit [3:0] w_bus_addr;
    
    function void print(string tag="");
        $display("T=%0t [%s] Cp=0x%0h, Ep=0x%0h, CLR_n=0x%0h, w_bus_addr=0x%0h", $time, tag, Cp, Ep, CLR_n, w_bus_addr);
    endfunction
endclass