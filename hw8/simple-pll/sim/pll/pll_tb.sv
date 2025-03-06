// UPDATE THESE VARIABLES
`define KI_CTRL 15000
`define KP_CTRL 0.005
`define INIT_CTRL 1.45

// NO NEED TO MODIFY THE REST OF THIS FILE
`timescale 1s/1fs

module pll_tb;
    localparam real ref_freq=100e6;
    logic clkin;
    always begin
        clkin = 1'b0;
        #(0.5/ref_freq*1s);
        clkin = 1'b1;
        #(0.5/ref_freq*1s);
    end

    logic clkout;
    pll #(
        .ki_ctrl(`KI_CTRL),
        .kp_ctrl(`KP_CTRL),
        .init_ctrl(`INIT_CTRL)
    ) pll_i (
        .clkin(clkin),
        .clkout(clkout)
    );

    real freq;
    meas_freq meas_freq_i (
        .clk(clkout),
        .freq(freq)
    );

    always begin
        #(0.1e-6);
        $display("Frequency of clkout at t=%0.1e: %0.10f GHz", $realtime, freq/1e9);
    end

    task check_freq(input real expct, input real meas, input real tol);
        if (((expct-tol) <= meas) && (meas <= (expct+tol))) begin
            // do nothing
        end else begin
            $display("ERROR: frequency out of spec (%0.3f GHz)", meas*1.0e-9);
            $fatal;
        end
    endtask

    logic check_en = 1'b0;
    always @(freq or check_en) begin
        if (check_en) begin
            check_freq(1e9, freq, 1e6);
        end
    end

    initial begin
        // setup
        $shm_open("pll.shm");
        $shm_probe("AS");

        // let waveform settle
        #(5e-6*1s);

        // check that it has settled
        check_en = 1'b1;
        #(5e-6*1s);
        
        // end simulation
        $display("All tests passed.");
        $finish;
    end
endmodule
