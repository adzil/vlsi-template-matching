/*  # linebuffer - Module
 *
 *  The linebuffer module is used to store a serial input black-and-white
 *  pixel onto a buffer that consist a bunch of shift registers.
 *  The SAD module will take first 40 data on every line to compare it with
 *  the template data.
 */

module linebuffer (d_in, clk, rst, ena, d_out);
    /* Input/output declarations */
    // Data input from grayscale thresholding module
    input d_in;
    // Control line inputs
    input clk;
    input rst;
    input ena;
    // Data output to SAD module
    output d_out;

    /* Register/wire declarations */
    // Output type
    reg [0:3999] d_out;
    // Buffer register
    reg [0:307199] buff;
    reg d_buff [0:307199];

    /* Combinational circuit for line buffer output */
    integer i;
    always @ (*) begin
        for (i = 0; i < 100; i = i + 1)
            d_out[(i*40) +: 40] = buff[(i*640) +: 40];
    end

    /* Synchronous machine realization */
    integer j;
    always @ (posedge clk or negedge rst) begin
        if (rst) begin
            if (!ena)
                buff <= {buff[1:307199], d_in};
            else
                buff <= buff;
        end
        else begin
            for (j = 0; j < 307200; j = j + 1)
                buff[j] <= 1'd0;
        end
    end

    integer k;
    always @ (*) begin
        for (k = 0; k < 307200; k = k + 1)
            buff[k] = d_buff[k];
    end

endmodule
