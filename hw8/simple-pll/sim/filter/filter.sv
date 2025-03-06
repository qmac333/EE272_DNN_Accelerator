`timescale 1s/1fs

module filter #(
    parameter real tau=50e-9
) (
    input real in
);
    // ADD VARIABLE DECLARATIONS HERE AS NECESSARY
    real initialout;
    real initialtime;
    real actualtime;
    real prev_in;
    real prev_in_reg;
    real prev_startingtime;
    real initialout_reg;
    initial begin
        initialout = 0;
        initialtime = 0;
        prev_in_reg = 0;
        prev_startingtime = 0;
    end

    function real out();
        // FILL IN FUNCTION IMPLEMENTATION
        actualtime = $realtime - initialtime;
        out = $exp(-actualtime / tau) * initialout + (1 - $exp(-actualtime / tau)) * in;
        // initialout = out;
    endfunction

    always @(in) begin
        // UPDATE INTERNAL STATE VARIABLES AS NECESSARY
        // $display("---------------------------------------");
        // $display("IN CHANGED in = %f", in);
        prev_startingtime = initialtime;
        initialtime = $realtime;
        prev_in_reg = prev_in;
        prev_in = in;
        initialout_reg = initialout;
        initialout = $exp(-(initialtime-prev_startingtime) / tau) * initialout_reg + (1 - $exp(-(initialtime-prev_startingtime) / tau)) * prev_in_reg;
    end

endmodule
