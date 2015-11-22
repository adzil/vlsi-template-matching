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
    // SAD raw output, should be connected to the linecounter module
    output [3999:0] d_out;

    /* Register/wire declarations */
    reg [0:3999] d_template[0:0];
    wire [0:3999] d_out;

    assign d_out = d_in ^ d_template[0];

endmodule
