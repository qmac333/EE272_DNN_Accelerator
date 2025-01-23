// Write a directed test for the weight double buffer module. Make sure you test 
// all its ports and its behaviour when your switch banks.

// Your code starts here

module double_buffer_tb;
//size of weight tile in one bank is IC0*OC0*FX*FY*IC1
//288 according to homework pdf

  parameter DATA_WIDTH = 64;
  parameter BANK_ADDR_WIDTH = 10;
  parameter BANK_DEPTH = 288;

  reg clk;
  reg rst_n;
  reg switch_banks;
  reg ren;
  reg wen;
  reg [BANK_ADDR_WIDTH-1:0] wadr, radr;
  reg [DATA_WIDTH-1:0] wdata;
  wire [DATA_WIDTH-1:0] rdata;

  always #10 clk = ~clk;

  double_buffer #(
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
    .wdata(wdata)
  );

  initial begin
    clk = 0;
    rst_n = 0;
    switch_banks = 0;
    ren = 0;
    wen = 0;
    wadr = 0;
    radr = 0;
    wdata = 0;

    #20 rst_n <= 0;
    #20 rst_n <= 1;

    $display("Test 1: Writing to bank 0");
    wen = 1;
    wadr = 287;
    wdata = 64'hDEADBEEFDEADBEEF; 
    #20 wen = 0;

    $display("Switching banks");
    switch_banks = 1;
    #20 switch_banks = 0;

    $display("Test 2: Reading from bank 0");
    ren = 1;
    radr = 287;
    #20 ren = 0;
    #10 $display("Read data: %h", rdata);
    assert(rdata == 64'hDEADBEEFDEADBEEF);



    $display("Writing to bank 1");
    wen = 1;
    wadr = 287;
    wdata = 64'hCAFEBABECAFEBABE; // Test data
    $display("Reading from bank 0 at the same time") ;
    ren = 1;
    radr = 287;
    #20 
    wen = 0;
    ren = 0;
    #10 $display("Read data: %h", rdata);
    assert(rdata == 64'hDEADBEEFDEADBEEF);

    $display("Switching banks");
    switch_banks = 1;
    #20 switch_banks = 0;

    $display("Reading from bank 1");
    ren = 1;
    radr = 287;
    #20 ren = 0;
    #10 $display("Read data: %h", rdata);
    assert(rdata == 64'hCAFEBABECAFEBABE);

    $display("Test 4: Verifying no cross-contamination between banks");
    switch_banks = 1;
    #20 switch_banks = 0;
    ren = 1;
    radr = 287;
    #20 ren = 0;
    #10 $display("Read data: %h", rdata); // Reading from bank 0
    assert(rdata == 64'hDEADBEEFDEADBEEF);

    //test switch bank and high at the same time
    //Writing to bank 1 and swtich banks
    switch_banks = 1;
    wen = 1;
    wadr = 0;
    wdata = 42;
    #20 
    switch_banks = 0;
    wen = 0;
    ren = 1;
    radr = 0; 
    #20 ren = 0;
    #10 $display("Read data: %h", rdata); // Reading from bank 1
    assert(rdata == 42);


    $display("All tests passed!");
    #100 $finish;
  end

  initial begin
    // Dump waveform for debugging
    $vcdplusfile("double_buffer.vcd");
    $vcdpluson(0, double_buffer_tb);
    `ifdef FSDB
    $fsdbDumpfile("double_buffer.fsdb");
    $fsdbDumpvars(0, double_buffer_tb);
    `endif
  end

endmodule

// Your code ends here
