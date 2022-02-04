module instruction_decoder (
        input logic [7:4]   i_bus,
        output logic        lda,
        output logic        add,
        output logic        sub,
        output logic        out,
        output logic        hlt_bar);
    
    always_comb begin
        if (i_bus == 'h0) begin
            lda = 1'b1;
        end
        else begin
            lda = 1'b0;
        end
        
        if (i_bus == 'h1) begin
            add = 1'b1;
        end
        else begin
            add = 1'b0;
        end
        
        if (i_bus == 'h2) begin
            sub = 1'b1;
        end
        else begin
            sub = 1'b0;
        end
        
        if (i_bus == 'hE) begin
            out = 1'b1;
        end
        else begin
            out = 1'b0;
        end
        
        if (i_bus == 'hF) begin
            hlt_bar = 1'b0;
        end
        else begin
            hlt_bar = 1'b1;
        end
    end
endmodule
