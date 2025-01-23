module double_buffer
#( 
  parameter DATA_WIDTH = 64,
  parameter BANK_ADDR_WIDTH = 7,
  parameter [BANK_ADDR_WIDTH : 0] BANK_DEPTH = 128
)(
  input clk,
  input rst_n,
  input switch_banks,
  input ren,
  input [BANK_ADDR_WIDTH - 1 : 0] radr,
  output [DATA_WIDTH - 1 : 0] rdata,
  input wen,
  input [BANK_ADDR_WIDTH - 1 : 0] wadr,
  input [DATA_WIDTH - 1 : 0] wdata
);
  // Implement a double buffer with the dual-port SRAM (ram_sync_1r1w)
  // provided. This SRAM allows one read and one write every cycle. To read
  // from it you need to supply the address on radr and turn ren (read enable)
  // high. The read data will appear on rdata port after 1 cycle (1 cycle
  // latency). To write into the SRAM, provide write address and data on wadr
  // and wdata respectively and turn write enable (wen) high. 
  
  // You can implement both double buffer banks with one dual-port SRAM.
  // Think of one bank consisting of the first half of the addresses of the
  // SRAM, and the second bank consisting of the second half of the addresses.
  // If switch_banks is high, you need to switch the bank you are reading with
  // the bank you are writing on the clock edge.

  // Your code starts here

  reg bank_write; // 1 bit register to keep track of which bank is currently being written to
  logic [BANK_ADDR_WIDTH - 1 : 0] sram_wadr;
  logic [BANK_ADDR_WIDTH - 1 : 0] sram_radr;

  always @(posedge clk) begin
    if (!rst_n) begin
      // reset logic
      bank_write <= 0;
    end else begin
      if (switch_banks) begin
        // switch logic
        //if bank_write is 0, means we are writing from addr 0 to BANK_DEPTH/2-1
        //if bank_write is 1, means we are writing from addr BANK_DEPTH/2 to BANK_DEPTH-1
        bank_write <= ~bank_write;
      end
    end
  end

  always @(*) begin
    if (wen) begin
      // write logic
      if (bank_write) begin
        // write to the bank 1, so need to offset the address
        sram_wadr = wadr + (BANK_DEPTH);
      end
      else begin
        // write to the bank 0, so no offset needed
        sram_wadr = wadr;
      end
    end
    if (ren) begin
      // read logic
      if (!bank_write) begin //if bank_write is 0, means we are reading from bank 1, which is addr BANK_DEPTH/2 to BANK_DEPTH-1
        // read from bank 1, so need to offset the address
        sram_radr = radr + (BANK_DEPTH);
      end
      else begin
        // read from bank 0, so no offset needed
        sram_radr = radr;
      end
    end
  end
    
 
  //instantiate the dual-port SRAM here
  ram_sync_1r1w #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(BANK_ADDR_WIDTH),
    .DEPTH(2*BANK_DEPTH)
  ) ram_inst (
    .clk(clk),
    .wen(wen),
    .wadr(sram_wadr),
    .wdata(wdata),
    .ren(ren),
    .radr(sram_radr),
    .rdata(rdata)
  );

  // Your code ends here
endmodule
