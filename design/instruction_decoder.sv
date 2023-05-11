module instruction_decoder #(
    parameter INSTRUCTION_WIDTH = 4)(
        input [INSTRUCTION_WIDTH-1:0] instruction_bus,
        output logic lda,
        output logic add,
        output logic sub,
        output logic out,
        output logic hlt);

    always_comb begin
        if (4'b0000 == instruction_bus)
            lda = 1;
        else
            lda = 0;

        if (4'b0001 == instruction_bus)
            add = 1;
        else
            add = 0;

        if (4'b0010 == instruction_bus)
            sub = 1;
        else
            sub = 0;

        if (4'b1110 == instruction_bus)
            out = 1;
        else
            out = 0;

        if (4'b1111 == instruction_bus)
            hlt = 0;
        else
            hlt = 1;
    end
endmodule
