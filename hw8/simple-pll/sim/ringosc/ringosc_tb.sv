// NO NEED TO MODIFY THIS FILE

`timescale 1s/1fs

module ringosc_tb;
    real vdd;
    logic out;
    ringosc ringosc_i (
        .vdd(vdd),
        .out(out)
    );

    real freq;
    meas_freq meas_freq_i (
        .clk(out),
        .freq(freq)
    );

    task check_freq_is(input real expct, input real tol=1e6);
        $display("At t=%0.1f ns, voltage=%0.3f and frequency=%0.5f GHz.  Expecting %0.5f GHz...", $realtime*1e9, vdd, freq/1e9, expct/1e9);
        if (((expct-tol) <= freq) && (freq <= (expct+tol))) begin
            $display("OK.");
        end else begin
            $fatal("Check failed.");
        end
    endtask

    integer fid;
    initial begin
        // setup
        $shm_open("ringosc.shm");
        $shm_probe("AS");

        // measure frequency vs vdd and write results to a file
        fid = $fopen("ringosc.csv", "w");
        $fwrite(fid, "VDD (V), Frequency (GHz)\n");
        for (vdd=1; vdd<1.801; vdd=vdd+10e-3) begin
            #(100ns);
            $fwrite(fid, "%0.10f,%0.10f\n", vdd, freq/1e9);
        end
        $fclose(fid);

        // spot-check at a few specific input voltages
        for (vdd=1; vdd<1.21; vdd=vdd+0.1) begin
            #(100ns);
            check_freq_is(0.5e9);
        end
        vdd = 1.3;
        #(100ns);
        check_freq_is(0.52e9);
        vdd = 1.4;
        #(100ns);
        check_freq_is(0.86e9);
        vdd = 1.5;
        #(100ns);
        check_freq_is(1.20e9);
        vdd = 1.6;
        #(100ns);
        check_freq_is(1.54e9);
        vdd = 1.7;
        #(100ns);
        check_freq_is(1.88e9);
        vdd = 1.8;
        #(100ns);
        check_freq_is(2.00e9);
    
        // end simulation
        $display("All tests passed.");
        $finish;
    end
endmodule
