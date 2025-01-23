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
    rand bit [`IFMAP_WIDTH - 1 : 0] ifmap_in;
    rand bit [`WEIGHT_WIDTH - 1 : 0] weight_in;
    rand bit [`OFMAP_WIDTH - 1 : 0] ofmap_in;
    bit [`IFMAP_WIDTH - 1 : 0] ifmap_out;
    bit [`OFMAP_WIDTH - 1 : 0] ofmap_out;


  function void print(int id = "");
    $display("T=%0t [transaction_id=%0d] din=%h enq=%d deq=%h ofmap_out=%h", $time, id, din, enq, deq, ofmap_out);
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
  reg [`DATA_WIDTH - 1 : 0] expected_data;
  // create a "golden" mac to track the correct behavior
  reg [`DATA_WIDTH - 1 : 0] data_queue[0 : `mac_DEPTH - 1];
  int get_idx = 0;
  int put_idx = 0;
  bit full = 0;
  bit empty = 1;

  task run();
    forever begin
      mac_item transaction;
      resp_id = 0;

      // the initial data is garbage since no stimulus applied yet, skip it
      scb_mbx.get(transaction);  // at 30ns
      // set the initial expected_data to the initial ofmap_out to pass the first comparison
      expected_data = transaction.ofmap_out; 

      while(resp_id < `TEST_LENGTH) begin
        scb_mbx.get(transaction);  // first mail arrives at 50ns
        transaction.print(resp_id);

        // Comparison
        if (transaction.ofmap_out !== expected_data) begin
          $display("T=%0t [Scoreboard] Error! Received = %h, expected = %h", $time, transaction.ofmap_out, expected_data);
        end else begin
          $display("T=%0t [Scoreboard] Pass! Received = %h, expected = %h", $time, transaction.ofmap_out, expected_data);
        end

        // Update golden model
        if (transaction.enq) begin
          data_queue[put_idx] = transaction.din;
          put_idx = (put_idx + 1) % `mac_DEPTH;
          empty = 0; // since we just push something, cannot be empty
          if (put_idx == get_idx) begin
            full = 1;
          end else begin
            full = 0;
          end
        end

        if (transaction.deq) begin
          get_idx = (get_idx + 1) % `mac_DEPTH;
          full = 0; // since we just pop something, cannot be full
          if (put_idx == get_idx) begin
            empty = 1;
          end else begin
            empty = 0;
          end
        end

        // update expected_data for next transaction
        // when mac is empty, ofmap_out always shows the last dequeued data (this is how mac.v behaves)        
        if (!empty) begin
          expected_data = data_queue[get_idx];
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
    reg clr;

    always #10 clk =~clk;
    
    mac_if _if (clk);

    mac #(
      .DATA_WIDTH(`DATA_WIDTH), 
      .mac_DEPTH(`mac_DEPTH), 
      .COUNTER_WIDTH(`COUNTER_WIDTH)
    ) dut (
      .clk(_if.clk),
      .rst_n(_if.rst_n),
      .din(_if.din),
      .enq(_if.enq),
      .full_n(_if.full_n),
      .ofmap_out(_if.ofmap_out),
      .deq(_if.deq),
      .empty_n(_if.empty_n),
      .clr(_if.clr)
    );

    assign _if.rst_n = rst_n;
    assign _if.clr = clr;

    initial begin
        test t0;

        clk <= 0;
        rst_n <= 0;
        clr <= 0;
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
