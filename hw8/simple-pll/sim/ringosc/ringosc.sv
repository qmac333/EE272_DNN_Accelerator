`timescale 1s/1fs

module ringosc (
    input real vdd,
    output var logic out
);
    // YOUR IMPLEMENTATION HERE
real A_vco;
real b_vco;
real f_vco;
real period;

initial begin
    out = 1;
    f_vco = 1;
    // vdd = 1;
    A_vco = 3.4;
    b_vco = -3.9;
end

always @(vdd) begin
    // if (vdd != 0.000000) begin
        f_vco = A_vco * vdd + b_vco;
        // $display("f_vco = %f", f_vco);
        if (f_vco < 0.5) begin
            f_vco = 0.5;
        end
        else if (f_vco > 2) begin
            f_vco = 2;
        end
        else begin
            f_vco = f_vco;
        end
        $display("f_vco = %f", f_vco);
        period = (1/f_vco);
        $display("period = %f", period);

    // end
end

always begin
        #((period/2) * 1e-9) out = ~out;
        // $display("period2 = %f", period);
        // $display("out = %d", out);
        // $display("vdd = %f", vdd);
end


endmodule
