/*  # Sum of Absolute Difference (SAD) - Module
 *
 *  The SAD module will compare the image data from the linebuffer with the
 *  template data with XOR operation. The bit operation will be carried out
 *  with a population count (popcount) method using Hamming Weight algorithm
 *  to reduce addition operation at the SAD output stage.
 */

module sad (d_in, d_out);
    /* Input/output declarations */
    // Data input from linebuffer module
    input [0:3999] d_in;
    // Control line inputs
    input clk;
    input rst;
    input ena;
    // Data output to output comparator module
    // The output is ranging from (0/x0 to 4000/xFA0 ~ 12bit)
    output [11:0] d_out;

    /* Register/wire declarations */
    reg [0:3999] d_template;
    wire [0:3999] d_sad;

    assign d_sad = d_in ^ d_template;

    linecounter linecounter_i(d_sad, d_out);

endmodule
