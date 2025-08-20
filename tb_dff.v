module tb_dff;

    // Signal declarations
    reg D_s = 0;
    reg CLK_s = 0;
    reg RST_s = 0;
    wire Q_s;

    // Instantiate the D flip-flop module
    dff dut (
        .D(D_s),
        .CLK(CLK_s),
        .RST(RST_s),
        .Q(Q_s)
    );

    // Test stimulus
    initial begin
        // Test case 1: CLK = 0, RST = 0, D = 0
        CLK_s = 0; RST_s = 0; D_s = 0;
        #10;

        // Test case 2: CLK = 0, RST = 1, D = 0
        CLK_s = 0; RST_s = 1; D_s = 0;
        #10;

        // Test case 3: CLK = 1, RST = 0, D = 1
        CLK_s = 1; RST_s = 0; D_s = 1;
        #10;

        // Test case 4: CLK = 1, RST = 1, D = 1
        CLK_s = 1; RST_s = 1; D_s = 1;
        #10;

        // Test case 5: CLK = 0, RST = 0, D = 1
        CLK_s = 0; RST_s = 0; D_s = 1;
        #10;

        // Test case 6: CLK = 0, RST = 1, D = 1
        CLK_s = 0; RST_s = 1; D_s = 1;
        #10;

        // Test case 7: CLK = 1, RST = 0, D = 0
        CLK_s = 1; RST_s = 0; D_s = 0;
        #10;

        // Test case 8: CLK = 1, RST = 1, D = 0
        CLK_s = 1; RST_s = 1; D_s = 0;
        #10;

        $stop; // End of simulation
    end

endmodule
