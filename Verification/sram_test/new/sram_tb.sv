module sram_tb;
    localparam ADDR_WIDTH = 4;
    localparam DATA_WIDTH = 8;
    localparam SRAM_DEPTH = $pow(ADDR_WIDTH, 2);   
    
    logic ce_bar;
    logic we_bar;
    logic run_not_prog;
    logic [ADDR_WIDTH-1:0] addr;
    logic [DATA_WIDTH-1:0] wr_data;
    logic [DATA_WIDTH-1:0] rd_data;
    byte data;

    sram #(
        .ADDR_WIDTH(ADDR_WIDTH),
        .DATA_WIDTH(DATA_WIDTH)) sram_0 (
            .ce_bar(ce_bar),
            .we_bar(we_bar),
            .addr(addr),
            .wr_data(wr_data),
            .rd_data(rd_data));
    
    always #10 ce_bar = ~ce_bar;
             
    initial begin
        wr_data = 0;
        ce_bar = 1;
        we_bar = 0;
        addr = 0;
        run_not_prog = 1;
    end
    
    always begin
        repeat(SRAM_DEPTH * 2) begin
            #20 wr_data = $urandom() % 255;
            #20 data = rd_data;
            #20 we_bar = 1;
            
            #20
            addr = addr + 1;
            we_bar = 0;
        end
    end
endmodule
