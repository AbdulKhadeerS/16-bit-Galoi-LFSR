module galoi_lfsr_tb;

    // Testbench signals
    reg clk = 0;
    reg rst = 0;
    wire [15:0] out_lfsr;

    // Instantiate the DUT
    galoi_lfsr dut (
        .clk(clk),
        .rst(rst),
        .out_lfsr(out_lfsr)
    );

    // Clock generation: 50 ns period (toggle every 25 ns)
    always #25 clk = ~clk;

    // Stimulus process
    initial begin
        // Apply asynchronous reset
        rst = 1;
        #30;
        rst = 0;

        // Wait for 20 clock cycles (20 * 50 ns = 1000 ns)
        #1000;

        // Stop simulation
        $stop;
    end

endmodule