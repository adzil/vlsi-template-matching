/*  # Template matching - Testbench
 *
 *  The template matching testbench will test linebuffer, SAD, and linecounter
 *  module as integrated template matching procedure. The template matching
 *  testbench will load black-and-white source image and the template image
 *  to their apropriate registers.
 */

module bench_template_matching;
    /* Register/wire declarations */
    // Master control line
    wire clk;
    reg rst;
    // Enable control line
    reg ena_linebuffer;
    // Block wiring
    reg d_linebuffer;
    wire [0:3999] d_sad;
    wire [3999:0] d_linecounter;
    wire [11:0] d_sad_threshold;

    /* Module imports */
    clock_gen clock_gen_i(clk);
    linebuffer linebuffer_i(d_linebuffer, clk, rst, ena_linebuffer, d_sad);
    sad sad_i(d_sad, d_linecounter);
    linecounter linecounter_i(d_linecounter, d_sad_threshold);

    /* Testbench command */
    initial begin
        rst <= 0;
        ena_linebuffer <= 1;
        d_linebuffer <= 0;
        #200
        rst <= 1;
        #25
        $readmemb("image.bin", linebuffer_i.d_buff);
        $readmemb("template.bin", sad_i.d_template);
        ena_linebuffer = 0;
    end

    always @ (d_sad_threshold) begin
        if (d_sad_threshold < 500) begin
            $display("SAD found");
            // Stop the SAD process
            ena_linebuffer <= 1;
        end
    end

endmodule
