/*  # Clock generator - Module
 *
 *  The clock generator module will clock the system on simulation. This
 *  file should used on ModelSim functional simulation only and **must not** be
 *  used on FPGA implementation.
 */

module clock_gen(clk);
    /* Input/output declarations */
    // Clock output
    output clk;
    // Set clock output as register
    reg clk;

    /* Clock generator */
    always begin
        #25
        // Invert clock pin value
        clk <= ~clk;
    end

    /* Clock generator initialization */
    initial begin
        // Set initial clock value
        clk <= 0;
    end
endmodule
