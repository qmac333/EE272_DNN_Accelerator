`define DATA_WIDTH 16
`define FETCH_WIDTH 4

module deaggregator_tb;

  reg clk;
  reg rst_n;
  wire [`FETCH_WIDTH * `DATA_WIDTH - 1 : 0] sender_data;
  reg [`DATA_WIDTH - 1 : 0] sender_data_r [`FETCH_WIDTH - 1 : 0];
  wire sender_empty_n;
  wire sender_deq;
  wire [`DATA_WIDTH - 1 : 0] fifo_din;
  wire [`DATA_WIDTH - 1 : 0] fifo_dout;
  wire fifo_full_n;
  wire fifo_empty_n;
  wire fifo_enq;
  wire fifo_deq;
  
  reg stall;
  reg [`DATA_WIDTH - 1 : 0] expected_dout;

  always #10 clk =~clk;
  
  deaggregator
  #(
    .DATA_WIDTH(`DATA_WIDTH),
    .FETCH_WIDTH(`FETCH_WIDTH)
  ) deaggregator_inst
  (
    .clk(clk),
    .rst_n(rst_n),
    .sender_data(sender_data),
    .sender_empty_n(sender_empty_n),
    .sender_deq(sender_deq),
    .receiver_data(fifo_din),
    .receiver_full_n(fifo_full_n),
    .receiver_enq(fifo_enq)
  );

  fifo
  #(
    .DATA_WIDTH(`DATA_WIDTH),
    .FIFO_DEPTH(3),
    .COUNTER_WIDTH(1)
  ) fifo_inst (
    .clk(clk),
    .rst_n(rst_n),
    .din(fifo_din),
    .enq(fifo_enq),
    .full_n(fifo_full_n),
    .dout(fifo_dout),
    .deq(fifo_deq),
    .empty_n(fifo_empty_n),
    .clr(1'b0)
  );

  initial begin
    clk <= 0;
    rst_n <= 0;
    stall <= 0;
    sender_data_r[0] <= 0;
    sender_data_r[1] <= 1;
    sender_data_r[2] <= 2;
    sender_data_r[3] <= 3;
    expected_dout <= 4;
    #20 rst_n <= 0;
    #20 rst_n <= 1;
  end

  assign sender_empty_n = 1;

  genvar i;
  generate
    for (i = 0; i < `FETCH_WIDTH; i = i + 1) begin: flatten
      assign sender_data[(i + 1)*`DATA_WIDTH - 1 : i*`DATA_WIDTH] = sender_data_r[i];
      always @ (posedge clk) begin
        if (rst_n) begin
          if (sender_deq) begin
            sender_data_r[i] <= sender_data_r[i] + 4;  
          end
        end
      end
    end
  endgenerate

  assign fifo_deq = rst_n && fifo_empty_n && (!stall);

  always @ (posedge clk) begin
    if (rst_n) begin
      stall <= $urandom % 2;
      if (fifo_deq) begin
        $display("%t: fifo_dout = %d, expected_dout = %d", $time, fifo_dout, expected_dout);
        assert(fifo_dout == expected_dout);
        expected_dout <= expected_dout + 1;
      end
    end
  end

  initial begin
    $vcdplusfile("dump.vcd");
    $vcdplusmemon();
    $vcdpluson(0, deaggregator_tb);
    `ifdef FSDB
    $fsdbDumpfile("dump.fsdb");
    $fsdbDumpvars(0, deaggregator_tb);
    $fsdbDumpMDA();
    `endif
    #2000;
    $finish(2);
  end

endmodule
