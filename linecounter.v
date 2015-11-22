/*  # Line counter - Module
 *
 *  The line counter module will calculate the hamming weight of resulting SAD.
 *  This module should be synthesizable, but mainly I create this Verilog just
 *  for functional simulation on ModelSim only.
 */

module linecounter (d_in, d_out);
    /* Input/output declarations */
    // Input data from SAD calculation
    input [3999:0] d_in;
    // Line count output data
    output d_out;

    /* Register/wire declarations */
    // Output register
    reg [11:0] d_out;
    // Counter buffer register
    reg [3999:0] d0;
    reg [2999:0] d1;
    reg [1999:0] d2;
    reg [1249:0] d3;
    reg [749:0] d4;
    reg [440:0] d5;
    reg [255:0] d6;
    reg [143:0] d7;
    reg [79:0] d8;
    reg [43:0] d9;
    reg [23:0] d10;


    integer i_d0, i_d1, i_d2, i_d3, i_d4, i_d5;
    integer i_d6, i_d7, i_d8, i_d9, i_d10;

    always @ (*) begin
        for (i_d0 = 0; i_d0 < 2000; i_d0 = i_d0 + 1)
            d0[(i_d0*2) +: 2] = d_in[(i_d0*2)] + d_in[(i_d0*2)+1];
    end

    always @ (*) begin
        for (i_d1 = 0; i_d1 < 1000; i_d1 = i_d1 + 1)
            d1[(i_d1*3) +: 3] = d0[(i_d1*4) +: 2] + d0[(i_d1*4)+2 +: 2];
    end

    always @ (*) begin
        for (i_d2 = 0; i_d2 < 500; i_d2 = i_d2 + 1)
            d2[(i_d2*4) +: 4] = d1[(i_d2*6) +: 3] + d1[(i_d2*6)+3 +: 3];
    end

    always @ (*) begin
        for (i_d3 = 0; i_d3 < 250; i_d3 = i_d3 + 1)
            d3[(i_d3*5) +: 5] = d2[(i_d3*8) +: 4] + d2[(i_d3*8)+4 +: 4];
    end

    always @ (*) begin
        for (i_d4 = 0; i_d4 < 125; i_d4 = i_d4 + 1)
            d4[(i_d4*6) +: 6] = d3[(i_d4*10) +: 5] + d3[(i_d4*10)+5 +: 5];
    end

    always @ (*) begin
        for (i_d5 = 0; i_d5 < 62; i_d5 = i_d5 + 1)
            d5[(i_d5*7) +: 7] = d4[(i_d5*12) +: 6] + d4[(i_d5*12)+6 +: 6];
        d5[62*7 +: 7] <= {1'd0, d4[124*6 +: 6]};
    end

    always @ (*) begin
        for (i_d6 = 0; i_d6 < 31; i_d6 = i_d6 + 1)
            d6[(i_d6*8) +: 8] = d5[(i_d6*14) +: 7] + d5[(i_d6*14)+7 +: 7];
        d6[31*8 +: 8] <= {1'd0, d5[62*7 +: 7]};
    end

    always @ (*) begin
        for (i_d7 = 0; i_d7 < 16; i_d7 = i_d7 + 1)
            d7[(i_d7*9) +: 9] = d6[(i_d7*16) +: 8] + d6[(i_d7*16)+8 +: 8];
    end

    always @ (*) begin
        for (i_d8 = 0; i_d8 < 8; i_d8 = i_d8 + 1)
            d8[(i_d8*10) +: 10] = d7[(i_d8*18) +: 9] + d7[(i_d8*18)+9 +: 9];
    end

    always @ (*) begin
        for (i_d9 = 0; i_d9 < 4; i_d9 = i_d9 + 1)
            d9[(i_d9*11) +: 11] = d8[(i_d9*20) +: 10] + d8[(i_d9*20)+10 +: 10];
    end

    always @ (*) begin
        for (i_d10 = 0; i_d10 < 2; i_d10 = i_d10 + 1)
            d10[(i_d10*12) +: 12] = d9[(i_d10*22) +: 11] + d9[(i_d10*22)+11 +: 11];
    end

    always @ (*) begin
        d_out = d10[11:0] + d10[23:12];
    end

endmodule
