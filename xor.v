module xorgate (
    input  wire A,     // input A
    input  wire B,     // input B
    output wire Y      // output Y
);

assign Y = A ^ B;      // XOR operation

endmodule