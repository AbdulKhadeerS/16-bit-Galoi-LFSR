module tb_xorgate;

    // Testbench signals
    reg A_s = 0;
    reg B_s = 0;
    wire Y_s;

    // Instantiate the DUT (Device Under Test)
    xorgate uut (
        .A(A_s),
        .B(B_s),
        .Y(Y_s)
    );

    // Test stimulus
    initial begin
        // Test case 1: A = 0, B = 0
        A_s = 0; B_s = 0;
        #10;

        // Test case 2: A = 0, B = 1
        A_s = 0; B_s = 1;
        #10;

        // Test case 3: A = 1, B = 0
        A_s = 1; B_s = 0;
        #10;

        // Test case 4: A = 1, B = 1
        A_s = 1; B_s = 1;
        #10;

        // End of simulation
        $stop;
    end

endmodule