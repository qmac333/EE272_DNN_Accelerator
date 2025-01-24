// Write a directed test for the accumulation buffer module. Make sure you test 
// all its ports and its behaviour when your switch banks.

// Your code starts here
module accumulation_buffer_tb;

    parameter DATA_WIDTH = 64;
    parameter BANK_ADDR_WIDTH = 6;
    parameter BANK_DEPTH = 36;

    reg clk;
    reg rst_n;
    reg switch_banks;
    reg ren;
    reg [BANK_ADDR_WIDTH-1:0] radr;
    wire [DATA_WIDTH-1:0] rdata;
    reg wen;
    reg [BANK_ADDR_WIDTH-1:0] wadr;
    reg [DATA_WIDTH-1:0] wdata;
    reg ren_wb;
    reg [BANK_ADDR_WIDTH-1:0] radr_wb;
    wire [DATA_WIDTH-1:0] rdata_wb;

    always #10 clk = ~clk;

    accumulation_buffer #(
        .DATA_WIDTH(DATA_WIDTH),
        .BANK_ADDR_WIDTH(BANK_ADDR_WIDTH),
        .BANK_DEPTH(BANK_DEPTH)
    ) dut (
        .clk(clk),
        .rst_n(rst_n),
        .switch_banks(switch_banks),
        .ren(ren),
        .radr(radr),
        .rdata(rdata),
        .wen(wen),
        .wadr(wadr),
        .wdata(wdata),
        .ren_wb(ren_wb),
        .radr_wb(radr_wb),
        .rdata_wb(rdata_wb)
    );

    initial begin
        clk <= 0;
        rst_n <= 0;
        switch_banks <= 0;
        ren <= 0;
        radr <= 0;
        wen <= 0;
        wadr <= 0;
        wdata <= 0;
        ren_wb <= 0;
        radr_wb <= 0;

        #20 rst_n <= 1;

        $display("Writing to bank 0 and reading from bank 0 in different cycles");
        wen <= 1;
        wadr <= 2;
        wdata <= 64'hABEDBEADABEDBEAD;

        #20 wen <= 0;
        ren <= 1;
        radr <= 2;
        #20 ren <= 0;
        assert(rdata == 64'hABEDBEADABEDBEAD);
        
        $display("Reading and writing to bank 0 in the same cycle");
        wen <= 1;
        wadr <= 34;
        wdata <= 64'hDEADBEEFDEADBEEF;
        ren <= 1;
        radr <= 2;
        #20 wen <= 0;
        ren <= 0;
        assert(rdata == 64'hABEDBEADABEDBEAD);

        switch_banks <= 1;
        #20 switch_banks = 0;

        $display("Writing to bank 1 and reading from bank 1");
        #20 wen <= 1;
        wadr <= 2;
        wdata <= 64'hCAFEBABECAFEBABE;
        #20 wen <= 0;
        #20 wen <= 1;
        wadr <= 22;
        wdata <= 64'hABCDABCDABCDABCD;

        ren <= 1;
        radr <= 2;
        #20 ren <= 0;
        assert(rdata == 64'hCAFEBABECAFEBABE);
        wen <= 0;

        $display("Reading from bank 0");
        ren_wb <= 1;
        radr_wb <= 2;
        #20 ren_wb <= 0;
        $display("Read data from bank 0: %h", rdata_wb);
        assert(rdata_wb == 64'hABEDBEADABEDBEAD);

        $display("Reading from bank 0 and bank 1 at same time");
        #20 ren_wb <= 1;
        radr_wb <= 2;
        ren <= 1;
        radr <= 22;
        #20 ren <= 0;
        ren_wb <= 0;
        $display("Read data from bank 1: %h", rdata);
        $display("Read data from bank 0: %h", rdata_wb);
        assert(rdata == 64'hABCDABCDABCDABCD);
        assert(rdata_wb == 64'hABEDBEADABEDBEAD);

        $display("Writing to bank 1");
        wen <= 1;
        wadr <= 34;
        wdata <= 64'h1234567890ABCDEF;
        #20 wen <= 0;

        switch_banks <= 1;
        #20 switch_banks <= 0;

        ren <= 1;
        radr <= 34;
        ren_wb <= 1;
        radr_wb <= 34;
        #20 ren <= 0;
        ren_wb <= 0;
        assert(rdata == 64'hDEADBEEFDEADBEEF);
        assert(rdata_wb == 64'h1234567890ABCDEF);

        $display("Making sure data stays constant after a long time");
        #100 assert(rdata == 64'hDEADBEEFDEADBEEF);
        assert(rdata_wb == 64'h1234567890ABCDEF);

        $display("Reading and writing to the same address in same cycle in Bank 0, the read operation should read the old value");
        ren <= 1;
        radr <= 34;
        wen <= 1;
        wadr <= 34;
        wdata <= 64'hFEDCBA0987654321;
        #20 ren <= 0;
        wen <= 0;
        assert(rdata == 64'hDEADBEEFDEADBEEF);

        $display("Switching banks at same time as writing to bank 0, so it should write to bank 1 and then switch banks");
        #20 switch_banks <= 1;
        wen <= 1;
        wadr <= 22;
        wdata <= 64'h8910891089108910;
        #20 switch_banks <= 0;
        ren_wb <= 1;
        radr_wb <= 22;
        #20 ren_wb <= 0;
        wen <= 0;
        $display("This is the end: Read data from bank 0: %h", rdata_wb);
        assert(rdata_wb == 64'h8910891089108910);

        $display("Reading from both banks at the same time while also switching banks.");
        #20 switch_banks <= 1;
        ren <= 1;
        radr <= 2;
        ren_wb <= 1;
        radr_wb <= 2;
        #20 switch_banks <= 0;
        #20 ren <= 0;
        ren_wb <= 0;
        $display("Read data from bank 0: %h", rdata);
        $display("Read data from bank 1: %h", rdata_wb);
        assert(rdata == 64'hABEDBEADABEDBEAD);
        assert(rdata_wb == 64'hCAFEBABECAFEBABE);

        $display("Test finished!");
    end

    initial begin
        $vcdplusfile("accumulation_buffer.vcd");
        $vcdplusmemon();
        $vcdpluson(0, accumulation_buffer_tb);
        `ifdef FSDB
        $fsdbDumpfile("accumulation_buffer.fsdb");
        $fsdbDumpvars(0, accumulation_buffer_tb);
        $fsdbDumpMDA();
        `endif
        #20000000;
        $finish(2);
    end

endmodule
// Your code ends here
