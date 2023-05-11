module program_counter #(parameter ADDR_WIDTH = 4)(
    input CLK_n,
    input Cp,
    input CLR_n,
    input Ep,
    output logic [ADDR_WIDTH-1:0] w_bus_addr);

    reg [ADDR_WIDTH-1:0] counter;

    always_ff @(negedge CLK_n or negedge CLR_n) begin
        if (1'b0 == CLR_n)
            counter <= 4'b0;
        else begin
            if (1'b1 == Cp)
                counter <= counter + 1;
            else
                counter <= counter;
        end
    end

    always_comb begin
        if (1'b1 == Ep)
            w_bus_addr = counter;
        else
            w_bus_addr = 4'bZ;
    end
endmodule
