`define DATA_WIDTH 4
`define FIFO_DEPTH 3
`define COUNTER_WIDTH 1

module fifo_tb;

  // Write five directed tests for the fifo module that test different corner
  // cases. For example, whether it raises the empty and full flags correctly,
  // whether it clears (empties) when you assert the clr signal. Verify its
  // behaviour on reset. You should also test whether the fifo gives the
  // expected latency between when a data goes in and the earliest it can come
  // out. 

  reg clk;
  reg rst_n;
  reg [`DATA_WIDTH - 1 : 0] din;
  reg enq;
  reg deq;
  wire full_n;
  wire [`DATA_WIDTH - 1 : 0] dout;
  wire empty_n;
  reg clr;

  always #10 clk =~clk;
  // Your code starts here
  //instantiate the fifo module
  fifo #(
    .DATA_WIDTH(`DATA_WIDTH),
    .FIFO_DEPTH(`FIFO_DEPTH),
    .COUNTER_WIDTH(`COUNTER_WIDTH)
  ) fifo_inst (
    .clk(clk),
    .rst_n(rst_n),
    .din(din),
    .enq(enq),
    .full_n(full_n),
    .dout(dout),
    .deq(deq),
    .empty_n(empty_n),
    .clr(clr)
  );

  integer start_time, end_time;
  initial begin
    clk <= 0;
    rst_n <= 1;
    enq <= 0;
    deq <= 0;
    clr <= 0;

    #20 rst_n <= 0;
    #20 rst_n <= 1;
    //check if fifo is empty on reset
    $display("test 1 empty_n = %b", empty_n); assert(empty_n == 0);
    #20
    //fill the fifo and check full flag
    din <= 1;
    enq <= 1;
    //check if empty is deasserted
    #20
    $display("test 2 empty_n = %b", empty_n); assert(empty_n == 1);
    din <= 2;
    #20
    din <= 3;
    #20
    enq <= 0;
    $display("test 2.1 empty_n = %b", empty_n); assert(empty_n == 1);
    $display("test 3 full_n = %b", full_n); assert(full_n == 0);
    //check clr signal
    clr <= 1;
    #20
    clr <= 0;
    $display("test 4 empty_n = %b", empty_n); assert(empty_n == 0);
    //check latency
    start_time = $time;
    din <= 4;
    enq <= 1;
    //if if dout is 4
    #20
    enq <= 0;
    deq <= 1;
    $display("test 5 dout = %d", dout); assert(dout == 4);
    //print latency
    end_time = $time;
    $display("latency = %d", end_time - start_time);
    #20
    deq <= 0;

  end

  // Your code ends here

  initial begin
    $vcdplusfile("dump.vcd");
    $vcdplusmemon();
    $vcdpluson(0, fifo_tb);
    `ifdef FSDB
    $fsdbDumpfile("dump.fsdb");
    $fsdbDumpvars(0, fifo_tb);
    $fsdbDumpMDA();
    `endif
    #20000000;
    $finish(2);
  end

endmodule
