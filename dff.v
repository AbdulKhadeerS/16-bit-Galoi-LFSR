module dff (
    input  wire D,     // Data input
    input  wire CLK,   // Clock input
    input  wire RST,   // Asynchronous reset
    output reg  Q      // Output
);

always @(posedge CLK or posedge RST) begin
    if (RST)
        Q <= 1'b0;
    else
        Q <= D;
end

endmodule