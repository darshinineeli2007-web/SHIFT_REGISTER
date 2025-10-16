module shiftregister (
    input clk,          // Clock input
    input rst,          // Active-high reset
    input serial_in,    // Serial data input
    output [3:0] q      // 4-bit output
);

    reg [3:0] q_reg;

    always @(posedge clk or posedge rst) begin
        if (rst)
            q_reg <= 4'b0000;              // Reset all bits to 0
        else
            q_reg <= {q_reg[2:0], serial_in};  // Shift left and insert serial_in
    end

    assign q = q_reg;

endmodule
