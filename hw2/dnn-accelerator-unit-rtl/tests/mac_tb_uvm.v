// Write a UVM test for the MAC unit. Especially make sure that the MAC unit
// works correctly with random stalls (meaning if en goes low intermittently)
// and that it resets properly.

// Your code starts here
// `define DATA_WIDTH (4)
// `define mac_DEPTH (3)
// `define COUNTER_WIDTH (1)
`define TEST_LENGTH (100)
`define IFMAP_WIDTH (16)
`define WEIGHT_WIDTH (16)
`define OFMAP_WIDTH (32)

interface mac_if (input bit clk);
    logic rst_n;
    logic en;
    logic weight_wen;
    logic [`IFMAP_WIDTH - 1 : 0] ifmap_in;
    logic [`WEIGHT_WIDTH - 1 : 0] weight_in;
    logic [`OFMAP_WIDTH - 1 : 0] ofmap_in;
    logic [`IFMAP_WIDTH - 1 : 0] ifmap_out;
    logic [`OFMAP_WIDTH - 1 : 0] ofmap_out;
endinterface

// Transaction Object
class mac_item;
    rand bit en;
    rand bit weight_wen;
    rand bit signed [`IFMAP_WIDTH - 1 : 0] ifmap_in;
    rand bit signed [`WEIGHT_WIDTH - 1 : 0] weight_in;
    rand bit signed [`OFMAP_WIDTH - 1 : 0] ofmap_in;
    bit signed [`IFMAP_WIDTH - 1 : 0] ifmap_out;
    bit signed [`OFMAP_WIDTH - 1 : 0] ofmap_out;


  function void print(int id = "");
    // $display("T=%0t [transaction_id=%0d] din=%h enq=%d deq=%h ofmap_out=%h", $time, id, din, enq, deq, ofmap_out);
    $display("T=%0t [transaction_id=%0d] en=%d weight_wen=%d ifmap_in=%h weight_in=%h ofmap_in=%h ifmap_out=%h ofmap_out=%h", $time, id, en, weight_wen, ifmap_in, weight_in, ofmap_in, ifmap_out, ofmap_out);
  endfunction
endclass;

// Driver applies the generated stimulus to DUT
class driver;
  virtual mac_if vif;
  mailbox drv_mbx;
  
  task run();
    $display ("T=%0t [Write driver] Starting ...", $time);
    
    // drive inputs at falling edges so that they are ready for the next rising edge

    @ (negedge vif.clk);  // first negative edge is at 40ns
    forever begin
      mac_item transaction;
      drv_mbx.get(transaction);

      // send the signals to interface
    vif.en = transaction.en;
    vif.weight_wen = transaction.weight_wen;
    vif.ifmap_in = transaction.ifmap_in;
    vif.weight_in = transaction.weight_in;
    vif.ofmap_in = transaction.ofmap_in;

      @ (negedge vif.clk);
    end
  endtask
endclass

// Monitor captures data from interface and sends the transaction to scoreboard
class monitor; 
  virtual mac_if vif;
  mailbox scb_mbx; // mailbox connected to scoreboard


  task run();
    $display("T=%0t [Read monitor] Starting ...", $time);
    forever begin
      mac_item transaction = new;

      // wait for rising edges so that synchronous signals are updated
      @ (posedge vif.clk); // first positive edge is at 30ns
      
        transaction.en = vif.en;
        transaction.weight_wen = vif.weight_wen;
        transaction.ifmap_in = vif.ifmap_in;
        transaction.weight_in = vif.weight_in;
        transaction.ofmap_in = vif.ofmap_in;
        transaction.ifmap_out = vif.ifmap_out;
        transaction.ofmap_out = vif.ofmap_out;

      
      // send transaction to scoreboard
      scb_mbx.put(transaction);
    end
  endtask
endclass

class scoreboard;
  mailbox scb_mbx;
  int resp_id;
  reg signed [`IFMAP_WIDTH - 1 : 0] expected_ifindata;
  reg signed [`WEIGHT_WIDTH - 1 : 0] expected_weightindata;
  reg signed [`OFMAP_WIDTH - 1 : 0] expected_ofindata;
  reg signed [`IFMAP_WIDTH - 1 : 0] expected_ifdata;
  reg signed [`OFMAP_WIDTH - 1 : 0] expected_ofdata;
  // create a "golden" mac to track the correct behavior
  // reg [`DATA_WIDTH - 1 : 0] data_queue[0 : `mac_DEPTH - 1];
  int get_idx = 0;
  int put_idx = 0;
  bit full = 0;
  bit empty = 1;

  task run();
    forever begin
      mac_item transaction;
      resp_id = 0;
      //initialise them
      expected_weightindata = 0;
      expected_ifdata = 0;
      expected_ofdata = 0;

      // the initial data is garbage since no stimulus applied yet, skip it
      scb_mbx.get(transaction);  // at 30ns
      // set the initial expected_data to the initial ofmap_out to pass the first comparison
      expected_ofdata = transaction.ofmap_out; 
      expected_ifdata = transaction.ifmap_out;

      while(resp_id < `TEST_LENGTH) begin
        scb_mbx.get(transaction);  // first mail arrives at 50ns
        transaction.print(resp_id);

        // Update golden model
        if (transaction.weight_wen)  begin
          expected_weightindata <= transaction.weight_in;
        end
        if (transaction.en) begin
          expected_ofdata <= (transaction.ifmap_in * expected_weightindata) + transaction.ofmap_in;
          expected_ifdata <= transaction.ifmap_in;
          $display("GOLDEN MODEL COMPUTATION: input = %h, weight = %h, ofmap_in = %h, expected_ofdata = %h", transaction.ifmap_in, expected_weightindata, transaction.ofmap_in, expected_ofdata);
        end
        // Comparison
        if (transaction.ofmap_out !== expected_ofdata) begin
          $display("T=%0t [Output out Scoreboard] Error! Received = %h, expected = %h", $time, transaction.ofmap_out, expected_ofdata);
          //print the weight, ifmap_in, and ofmap_in
          // $display("T=%0t [Output out Scoreboard] weight_in=%h ifmap_in=%h ofmap_in=%h", $time, transaction.weight_in, transaction.ifmap_in, transaction.ofmap_in);
        end else begin
    
          $display("T=%0t [Output out Scoreboard] Pass! Received = %h, expected = %h", $time, transaction.ofmap_out, expected_ofdata);
        end
        //comparison for if
        if (transaction.ifmap_out !== expected_ifdata) begin
          $display("T=%0t [Input out Scoreboard] Error! Received = %h, expected = %h", $time, transaction.ifmap_out, expected_ifdata);
        end else begin
          $display("T=%0t [Input out Scoreboard] Pass! Received = %h, expected = %h", $time, transaction.ifmap_out, expected_ifdata);
        end
        resp_id = resp_id + 1;
      end
      $finish;
    end
  endtask
endclass

// Environment class contains all verification components
class env;
  driver            d0;           
  monitor           m0;           
  scoreboard        s0;           
  mailbox           scb_mbx;      // maillbox connecting monitor and scoreboard
  virtual mac_if   vif;          

  function new();
    d0 = new; 
    m0 = new;
    s0 = new;
    scb_mbx = new();
    
    m0.scb_mbx = scb_mbx;
    s0.scb_mbx = scb_mbx;
  endfunction

  virtual task run();
    d0.vif = vif;
    m0.vif = vif;

    fork
      s0.run();
      d0.run();
      m0.run();    
    join_any 
  endtask   
endclass


class test;
  env e0;
  mailbox drv_mbx;
  int stim_id;

  function new();
    drv_mbx = new();
    e0 = new();
  endfunction

  virtual task run();
    e0.d0.drv_mbx = drv_mbx;
    fork 
      e0.run();
    join_none

    apply_stim();
  endtask

  virtual task apply_stim();
    mac_item transaction;
    $display ("T=%0t [Test] Starting write stimulus ...", $time);

    stim_id = 0;
    while(stim_id < `TEST_LENGTH) begin
      transaction = new;
      transaction.randomize();
      stim_id = stim_id + 1;
      drv_mbx.put(transaction);
    end

  endtask
endclass

module mac_tb;

    reg clk;
    reg rst_n;

    always #10 clk =~clk;
    
    mac_if _if (clk);

    mac #(
      .IFMAP_WIDTH(`IFMAP_WIDTH),
      .WEIGHT_WIDTH(`WEIGHT_WIDTH),
      .OFMAP_WIDTH(`OFMAP_WIDTH)
    ) mac_inst (
      .clk(_if.clk),
      .rst_n(_if.rst_n),
      .en(_if.en),
      .weight_wen(_if.weight_wen),
      .ifmap_in(_if.ifmap_in),
      .weight_in(_if.weight_in),
      .ofmap_in(_if.ofmap_in),
      .ifmap_out(_if.ifmap_out),
      .ofmap_out(_if.ofmap_out)
    );

    assign _if.rst_n = rst_n;

    initial begin
        test t0;

        clk <= 0;
        rst_n <= 0;
        #20 rst_n <= 1;
        t0 = new(); 
        t0.e0.vif = _if;
        t0.run();
    end

    initial begin
        $vcdplusfile("dump.vcd");
        $vcdplusmemon();
        $vcdpluson(0, mac_tb);
        `ifdef FSDB
        $fsdbDumpfile("dump.fsdb");
    		$fsdbDumpvars(0, mac_tb);
    		$fsdbDumpMDA();
			  `endif
        #20000000;
        $finish(2);
    end

endmodule


// Your code ends here
