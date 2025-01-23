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
    rand bit adr_en;
    rand bit config_en;
    rand bit signed [`BANK_ADDR_WIDTH - 1 : 0] config_data;
    bit signed [`BANK_ADDR_WIDTH - 1 : 0] adr;

    function void print(int id="");
        $display("T=%0t [transaction_id=%0d] adr_en=%d config_en=%d config_data=%h adr=%h", $time, id, adr_en, config_en, config_data, adr);
    endfunction
endclass;


// Driver applies the generated stimulus to DUT
class driver;
    virtual adr_gen_sequential_if vif;
    mailbox drv_mbx;
    
    task run();
        $display ("T=%0t [Write driver] Starting ...", $time);
        
        // drive inputs at falling edges so that they are ready for the next rising edge

        @ (negedge vif.clk);  // first negative edge is at 40ns
        forever begin
            adr_gen_sequential_item transaction;
            drv_mbx.get(transaction);

            // send the signals to interface
            vif.adr_en = transaction.adr_en;
            vif.config_en = transaction.config_en;
            vif.config_data = transaction.config_data;

            @ (negedge vif.clk);
        end
    endtask
endclass
// Your code ends here