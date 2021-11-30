module program_counter #(
    parameter PC_INPUT_BUS_WIDTH = 4)(
        input clk,
        input clr,
        input Cp,
        input Ep,
        output pc_out);
        
    logic clk;
    logic clr;
    logic Cp;
    logic Ep;
    logic [PC_INPUT_BUS_WIDTH-1:0] pc_out;    
    logic [PC_INPUT_BUS_WIDTH-1:0] buffer;

    always_ff @(posedge clk, negedge clr) begin
        if (~clr) begin
            buffer = 4'b0;
        end
        else if (Cp) begin
            buffer <= buffer + 1;
        end
    end
    
    always_comb begin
        if (Ep) begin
            pc_out = buffer;
        end
        else begin
            pc_out = 4'bzzzz;
        end
    end
endmodule
