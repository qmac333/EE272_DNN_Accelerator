// Write a UVM test for the sequential address generator (adr_gen_sequential).
// Especially make sure that the address generator works correctly with random
// stalls (meaning if adr_en goes low intermittently), that it resets properly, 
// and that it goes back to zero after reaching the maximum configured value.

// Your code starts here
`define TEST_LENGTH (100)
`define BANK_ADDR_WIDTH (32)

interface adr_gen_sequential_if (input bit clk);
    logic rst_n;
    logic adr_en;
    logic [`BANK_ADDR_WIDTH - 1 : 0] adr;
    logic config_en;
    logic [`BANK_ADDR_WIDTH - 1 : 0] config_data;
endinterface

// Transaction Object
class adr_gen_sequential_item;
    rand bit rst_n;
    rand bit adr_en;
    rand bit config_en;
    rand bit signed [`BANK_ADDR_WIDTH - 1 : 0] config_data;
    bit signed [`BANK_ADDR_WIDTH - 1 : 0] adr;

    constraint rst_n_dist {
        rst_n dist {0 := 1, 1 := 20}; // rst_n has 1/21 chance to be 0
    }

    function void print(int id="");
        $display("T=%0t [transaction_id=%0d] adr_en=%d config_en=%d config_data=%h adr=%h rst_n=%h", $time, id, adr_en, config_en, config_data, adr, rst_n);
    endfunction
endclass;


// Driver applies the generated stimulus to DUT
class driver;
    virtual adr_gen_sequential_if vif;
    mailbox drv_mbx;
    
    task run();
        $display ("T=%0t [Write driver] Starting ...", $time);
        
        // drive inputs at falling edges so that they are ready for the next rising edge

        @ (negedge vif.clk);  
        forever begin
            adr_gen_sequential_item transaction;
            drv_mbx.get(transaction);

            // send the signals to interface
            vif.rst_n = transaction.rst_n;
            vif.adr_en = transaction.adr_en;
            vif.config_en = transaction.config_en;
            vif.config_data = transaction.config_data;

            @ (negedge vif.clk);
        end
    endtask
endclass

class monitor;
    virtual adr_gen_sequential_if vif;
    mailbox scb_mbx; // mailbox connected to scoreboard. Monitor sends signals to scoreboard

    task run();
        $display("T=%0t [Read monitor] Starting ...", $time);
        forever begin
            adr_gen_sequential_item transaction = new;
            
            // wait for rising edges so that synchronous signals are updated
            @ (posedge vif.clk);
            transaction.rst_n = vif.rst_n;
            transaction.adr = vif.adr;
            transaction.adr_en = vif.adr_en;
            transaction.config_en = vif.config_en;
            transaction.config_data = vif.config_data;
            
            // send transaction to scoreboard
            scb_mbx.put(transaction);
        end
    endtask
endclass

class scoreboard;
    mailbox scb_mbx;
    int resp_id;
    // create a "golden" address generator to track the correct behavior
    reg signed [`BANK_ADDR_WIDTH - 1 : 0] expected_adr;
    reg signed [`BANK_ADDR_WIDTH - 1 : 0] expected_config_data;
    
    task run();
        forever begin
            adr_gen_sequential_item transaction;
            resp_id = 0;

            // the initial 2 cycles of data is garbage since no stimulus applied yet, skip it
            scb_mbx.get(transaction);
            // scb_mbx.get(transaction);
            // set the initial expected_adr to the initial adr to pass the first comparison
            expected_adr = transaction.adr;
            
            while(resp_id < `TEST_LENGTH) begin
                scb_mbx.get(transaction);
                transaction.print(resp_id);
            
                // Update the golden model
                if (!transaction.rst_n) begin
                    expected_adr <= 0;
                    expected_config_data <= 0;
                end
                else begin
                    if (transaction.config_en) begin
                        expected_config_data <= transaction.config_data;
                    end
                    // Check if the address is as expected
                    if (transaction.adr_en) begin
                        if (expected_adr == expected_config_data) begin
                            expected_adr <= 0;
                        end
                        else begin
                            // Increment the expected address
                            expected_adr <= (expected_adr + 1);
                        end
                        $display("GOLDEN MODEL COMPUTATION: expected_adr=%h expected_config_data=%h", expected_adr, expected_config_data);
                    end
                end

                // Comparison between golden model and transaction data
                if (transaction.adr !== expected_adr) begin
                    $display("T=%0t [scoreboard] ERROR: Expected adr=%h, got adr=%h", $time, expected_adr, transaction.adr);
                end
                else begin
                    $display("T=%0t [scoreboard] Pass: Expected adr=%h, got adr=%h", $time, expected_adr, transaction.adr);
                end

                resp_id = resp_id + 1;
            end
            $finish;
        end
    endtask
endclass

// Environment class contains all verification components
class env;
    driver d0;
    monitor m0;
    scoreboard s0;
    mailbox scb_mbx;
    virtual adr_gen_sequential_if vif;

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
        adr_gen_sequential_item transaction;
        $display ("T=%0t [Test] Starting stimulus ...", $time);
        stim_id = 0;
        while(stim_id < `TEST_LENGTH) begin
            transaction = new;
            // Randomly set the fields of the transaction
            assert(transaction.randomize());
            if (stim_id == 0) begin
                transaction.rst_n = 0;
            end
            $display ("transaction adr_en=%d config_en=%d config_data=%h, rst_n=%d", transaction.adr_en, transaction.config_en, transaction.config_data, transaction.rst_n);
            stim_id = stim_id + 1;
            drv_mbx.put(transaction);
        end
    endtask
endclass

module adr_gen_sequential_tb;
    reg clk;
    // reg rst_n;

    always #10 clk =~clk;

    adr_gen_sequential_if _if (clk);
    
    // Instantiate the DUT
    adr_gen_sequential #(
        .BANK_ADDR_WIDTH(`BANK_ADDR_WIDTH)
    ) adr_gen_inst (
        .clk(_if.clk),
        .rst_n(_if.rst_n),
        .adr_en(_if.adr_en),
        .adr(_if.adr),
        .config_en(_if.config_en),
        .config_data(_if.config_data)
    );

    // assign _if.rst_n = rst_n;

    initial begin
        test t0;

        clk <= 0;
        // rst_n <= 0;
        // #20 rst_n <= 1;
        t0 = new();
        t0.e0.vif = _if;
        t0.run();
    end

    initial begin
        $vcdplusfile("dump.vcd");
        $vcdplusmemon();
        $vcdpluson(0, adr_gen_sequential_tb);
        `ifdef FSDB
        $fsdbDumpfile("dump.fsdb");
        $fsdbDumpvars(0, adr_gen_sequential_tb);
        $fsdbDumpMDA();
        `endif 
        #20000000;
        $finish(2);
    end
endmodule


// Your code ends here