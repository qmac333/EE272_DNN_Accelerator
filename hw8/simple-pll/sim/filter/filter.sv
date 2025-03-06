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
    initial begin
        initialout = 0;
        initialtime = 0;
        // prev_in = 0;
        prev_in_reg = 0;
        prev_startingtime = 0;
    end

    function real out();
        // FILL IN FUNCTION IMPLEMENTATION
        $display("OUT GETTING CALLED");
        $display("At t=%0.1f ns", $realtime * 1e9);
        $display("initialtime = %f", initialtime*1e9);
        $display("---------------------------------------");
        actualtime = $realtime - initialtime;
        out = $exp(-actualtime / tau) * initialout + (1 - $exp(-actualtime / tau)) * in;
        initialout = out;
    endfunction

    always @(in) begin
        // UPDATE INTERNAL STATE VARIABLES AS NECESSARY
        prev_startingtime = initialtime;
        initialtime = $realtime;
        prev_in_reg = prev_in;
        prev_in = in;
        $display("out value = %f", out());
        // initialout = out();
        initialout = $exp(-(initialtime-prev_startingtime) / tau) * initialout + (1 - $exp(-(initialtime-prev_startingtime) / tau)) * prev_in_reg;
    end

endmodule
