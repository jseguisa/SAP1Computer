`timescale 1ns / 1ps

module instruction_decoder_tb;
    logic [7:4] i_bus;
    logic lda;
    logic add;
    logic sub;
    logic out;
    logic hlt_bar;
    
    instruction_decoder id(
        .i_bus(i_bus),
        .lda(lda),
        .add(add),
        .sub(sub),
        .out(out),
        .hlt_bar(hlt_bar));
    
    initial begin
        for (int i = 0; i <= 16; i++) begin
            i_bus = i;
            #40;
        end
        $finish;
    end
endmodule
