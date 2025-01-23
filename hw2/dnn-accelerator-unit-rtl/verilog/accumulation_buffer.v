module accumulation_buffer
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
  input [DATA_WIDTH - 1 : 0] wdata,

  input ren_wb,
  input [BANK_ADDR_WIDTH - 1 : 0] radr_wb,
  output [DATA_WIDTH - 1 : 0] rdata_wb
);

  // Implement an accumulation buffer with the dual-port SRAM (ram_sync_1r1w)
  // provided. This SRAM allows one read and one write every cycle. To read
  // from it you need to supply the address on radr and turn ren (read enable)
  // high. The read data will appear on rdata port after 1 cycle (1 cycle
  // latency). To write into the SRAM, provide write address and data on wadr
  // and wdata respectively and turn write enable (wen) high. 
  
  // Accumulation buffer is similar to a double buffer, but one of its banks
  // has both a read port (ren, radr, rdata) and a write port (wen, wadr,
  // wdata). This bank is used by the systolic array to store partial sums and
  // then read them back out. The other bank has a read port only (ren_wb,
  // radr_wb, rdata_wb). This bank is used to read out the final output (after
  // accumulation is complete) and send it out of the chip. The reason for
  // adopting two banks is so that we can overlap systolic array processing,
  // and data transfer out of the accelerator (otherwise one of them will
  // stall while the other is taking place). Note: both srams will be 1r1w, 
  // but the logical operation will be as described above.

  // If switch_banks is high, you need to switch the functionality of the two
  // banks at the positive edge of the clock. That means, you will use the bank
  // you were previously using for data transfer out of the chip for systolic
  // array and vice versa.

  // Your code starts here
  reg bank_read_write; // 1 bit register to keep track of which bank is doing both read and write, 1 meaning yea
  reg [BANK_ADDR_WIDTH - 1 : 0] sram_wadr0;
  reg [BANK_ADDR_WIDTH - 1 : 0] sram_radr0;
  reg [BANK_ADDR_WIDTH - 1 : 0] sram_wadr1;
  reg [BANK_ADDR_WIDTH - 1 : 0] sram_radr1;
  reg [DATA_WIDTH - 1 : 0] wdata0;
  reg [DATA_WIDTH - 1 : 0] wdata1;
  reg ren0;
  reg ren1;
  reg wen0;
  reg wen1;
  reg [DATA_WIDTH - 1 : 0] rdata0;
  reg [DATA_WIDTH - 1 : 0] rdata1;

  always @(posedge clk) begin
    if (!rst_n) begin
      // reset logic
      bank_read_write <= 0;
      sram_wadr0 <= 0;
      sram_radr0 <= 0;
      sram_wadr1 <= 0;
      sram_radr1 <= 0;
      wdata0 <= 0;
      wdata1 <= 0;
      ren0 <= 0;
      ren1 <= 0;
      wen0 <= 0;
      wen1 <= 0;
    end else begin
      if (switch_banks) begin
        // switch logic
        //if bank_read_write is 0, means we are reading/writing from bank 0
        //if bank_read_write is 1, means we are reading/writing from bank 1
        bank_read_write <= ~bank_read_write;
      end
    end
  end

  always @(*) begin
    if (bank_read_write) begin
      // bank 1 is doing both read and write, bank 0 is just reading
      if (wen) begin
        wen1 = wen;
        wen0 = !wen;
        sram_wadr1 = wadr;
        wdata1 = wdata;
      end
      if (ren) begin
        ren1 = ren;
        sram_radr1 = radr;
      end
      if (ren_wb) begin
        ren0 = ren_wb;
        sram_radr0 = radr_wb;
      end
    end else begin
      // bank 0 is doing both read and write, bank 1 is just reading
      if (wen) begin
        wen0 = wen;
        wen1 = !wen;
        sram_wadr0 = wadr;
        wdata0 = wdata;
      end
      if (ren) begin
        ren0 = ren;
        sram_radr0 = radr;
      end
      if (ren_wb) begin
        ren1 = ren_wb;
        sram_radr1 = radr_wb;
      end
    end
  end

  assign rdata = (bank_read_write && ren) ? rdata1 : (!bank_read_write && ren) ? rdata0 : rdata;
  assign rdata_wb = (bank_read_write && ren_wb) ? rdata0 : (!bank_read_write && ren_wb) ? rdata1 : rdata_wb;

  //instantiate the dual-port SRAM here
  ram_sync_1r1w #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(BANK_ADDR_WIDTH),
    .DEPTH(BANK_DEPTH)
  ) ram_inst0 (
    .clk(clk),
    .wen(wen0),
    .wadr(sram_wadr0),
    .wdata(wdata0),
    .ren(ren0),
    .radr(sram_radr0),
    .rdata(rdata0)
  );

  ram_sync_1r1w #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(BANK_ADDR_WIDTH),
    .DEPTH(BANK_DEPTH)
  ) ram_inst1 (
    .clk(clk),
    .wen(wen1),
    .wadr(sram_wadr1),
    .wdata(wdata1),
    .ren(ren1),
    .radr(sram_radr1),
    .rdata(rdata1)
  );
  // Your code ends here
endmodule
