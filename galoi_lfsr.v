module galoi_lfsr (
    input wire clk,
    input wire rst,
    output wire [15:0] out_lfsr
);

    // Internal state register
    reg [15:0] Q = 16'd0;
    reg seed = 1'b0;

    // Intermediate wires for feedback and XOR outputs
    wire feedback;
    wire xor14_s, xor4_s, xor2_s;

    // Feedback taken from Q[1]
    assign feedback = Q[1];

    // XOR gate instances
    xorgate xor14_inst (
        .A(Q[15]),
        .B(feedback),
        .Y(xor14_s)
    );

    xorgate xor4_inst (
        .A(Q[5]),
        .B(feedback),
        .Y(xor4_s)
    );

    xorgate xor2_inst (
        .A(Q[3]),
        .B(feedback),
        .Y(xor2_s)
    );

    // Shift register logic with one-time seed injection
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            Q <= 16'd0;
            seed <= 1'b0;
        end else if (!seed) begin
            Q <= 16'd0;
            Q[10] <= 1'b1; // ? Set seed only once
            seed <= 1'b1;
        end else begin
            Q[15] <= Q[1];
            Q[14] <= xor14_s;
            Q[13] <= Q[14];
            Q[12] <= Q[13];
            Q[11] <= Q[12];
            Q[10] <= Q[11];
            Q[9]  <= Q[10];
            Q[8]  <= Q[9];
            Q[7]  <= Q[8];
            Q[6]  <= Q[7];
            Q[5]  <= Q[6];
            Q[4]  <= xor4_s;
            Q[3]  <= Q[4];
            Q[2]  <= xor2_s;
            Q[1]  <= Q[2];
            Q[0]  <= Q[1];
        end
    end

    assign out_lfsr = Q;

endmodule
