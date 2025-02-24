module ram_sync_1r1w
#(
  parameter DATA_WIDTH = 8,
  parameter ADDR_WIDTH = 8,
  parameter DEPTH = 256
)(
  input clk,
  input wen,
  input [ADDR_WIDTH - 1 : 0] wadr,
  input [DATA_WIDTH - 1 : 0] wdata,
  input ren,
  input [ADDR_WIDTH - 1 : 0] radr,
  output [DATA_WIDTH - 1 : 0] rdata
);
  
  // // synopsys translate_off
  // reg [DATA_WIDTH - 1 : 0] rdata_reg;
  
  // reg [DATA_WIDTH - 1 : 0] mem [DEPTH - 1 : 0];
  
  // always @(posedge clk) begin
  //   if (wen) begin
  //     mem[wadr] <= wdata; // write port
  //   end
  //   if (ren) begin
  //     rdata_reg <= mem[radr]; // read port
  //   end
  // end
  // // synopsys translate_on

  // assign rdata = rdata_reg;

  wire [ADDR_WIDTH - 1 : 0] depth_to_write_to;
  wire [ADDR_WIDTH - 1 : 0] depth_to_read_from;

  // depth_to_write_to and depth_to_read_from are everything in wadr and radr except the last 8 bits
  // this is because the skywater macro has a depth of 256, so we need to use the upper bits of the address to select the bank
  // if the address is less than 8 bits, we set the depth bank to 0 since this is the only bank we have
  assign depth_to_write_to = (ADDR_WIDTH <= 8) ? 'b0 : wadr[ADDR_WIDTH-1:8];
  assign depth_to_read_from = (ADDR_WIDTH <= 8) ? 'b0 : radr[ADDR_WIDTH-1:8];

  wire [DATA_WIDTH - 1 : 0] dout_eachsram [DEPTH/256 - 1 : 0];

  // need to register the read address because a read will take a cycle to appear at dout1 for skywater macro
  reg [ADDR_WIDTH - 1 : 0] radr_reg;

  // create the size of the SRAM using the smaller skywater macro
  genvar depth, width;
  generate
    for (depth = 0; depth < DEPTH / 256; depth = depth + 1) begin
      for (width = 0; width < DATA_WIDTH / 32; width = width + 1) begin
        sky130_sram_1kbyte_1rw1r_32x256_8 macro (
          // Port 0: W
              .clk0(clk), .csb0(depth_to_write_to != depth), .web0(!wen), .wmask0(4'hF), .addr0(wadr[7:0]), .din0(wdata[(width+1)*32-1 : width*32]), .dout0(),
          // Port 1: R
              .clk1(clk), .csb1(depth_to_read_from != depth), .addr1(radr[7:0]), .dout1(dout_eachsram[depth][(width+1)*32-1 : width*32]) 
        );
      end
    end
  endgenerate

  always @(posedge clk) begin
    if (ADDR_WIDTH <= 8) begin
      radr_reg <= 'b0;
    end else begin
      radr_reg <= radr[ADDR_WIDTH-1:8];
    end
  end

  assign rdata = dout_eachsram[radr_reg];

endmodule


// OpenRAM SRAM model
// Words: 256
// Word size: 32
// Write size: 8
// synopsys translate_off
module sky130_sram_1kbyte_1rw1r_32x256_8#(
  parameter NUM_WMASKS = 4,
  parameter DATA_WIDTH = 32,
  parameter ADDR_WIDTH = 8,
  parameter RAM_DEPTH = 256,
  parameter DELAY = 0
)(
  input  clk0, // clock
  input   csb0, // active low chip select
  input  web0, // active low write control
  input [NUM_WMASKS-1:0]   wmask0, // write mask
  input [ADDR_WIDTH-1:0]  addr0,
  input [DATA_WIDTH-1:0]  din0,
  output reg [DATA_WIDTH-1:0] dout0,
  input  clk1, // clock
  input   csb1, // active low chip select
  input [ADDR_WIDTH-1:0]  addr1,
  output reg [DATA_WIDTH-1:0] dout1
);

  reg  csb0_reg;
  reg  web0_reg;
  reg [NUM_WMASKS-1:0]   wmask0_reg;
  reg [ADDR_WIDTH-1:0]  addr0_reg;
  reg [DATA_WIDTH-1:0]  din0_reg;

  reg  csb1_reg;
  reg [ADDR_WIDTH-1:0]  addr1_reg;
reg [DATA_WIDTH-1:0]    mem [0:RAM_DEPTH-1];

  // All inputs are registers
  always @(posedge clk0)
  begin
    csb0_reg = csb0;
    web0_reg = web0;
    wmask0_reg = wmask0;
    addr0_reg = addr0;
    din0_reg = din0;
    dout0 = 32'bx;
    if ( !csb0_reg && web0_reg ) 
      $display($time," Reading %m addr0=%b dout0=%b",addr0_reg,mem[addr0_reg]);
    if ( !csb0_reg && !web0_reg )
      $display($time," Writing %m addr0=%b din0=%b wmask0=%b",addr0_reg,din0_reg,wmask0_reg);
  end

  // All inputs are registers
  always @(posedge clk1)
  begin
    csb1_reg = csb1;
    addr1_reg = addr1;
    if (!csb0 && !web0 && !csb1 && (addr0 == addr1))
         $display($time," WARNING: Writing and reading addr0=%b and addr1=%b simultaneously!",addr0,addr1);
    dout1 = 32'bx;
    if ( !csb1_reg ) 
      $display($time," Reading %m addr1=%b dout1=%b",addr1_reg,mem[addr1_reg]);
  end


  // Memory Write Block Port 0
  // Write Operation : When web0 = 0, csb0 = 0
  always @ (negedge clk0)
  begin : MEM_WRITE0
    if ( !csb0_reg && !web0_reg ) begin
        if (wmask0_reg[0])
                mem[addr0_reg][7:0] = din0_reg[7:0];
        if (wmask0_reg[1])
                mem[addr0_reg][15:8] = din0_reg[15:8];
        if (wmask0_reg[2])
                mem[addr0_reg][23:16] = din0_reg[23:16];
        if (wmask0_reg[3])
                mem[addr0_reg][31:24] = din0_reg[31:24];
    end
  end

  // Memory Read Block Port 0
  // Read Operation : When web0 = 1, csb0 = 0
  always @ (negedge clk0)
  begin : MEM_READ0
    if (!csb0_reg && web0_reg)
       dout0 <= #(DELAY) mem[addr0_reg];
  end

  // Memory Read Block Port 1
  // Read Operation : When web1 = 1, csb1 = 0
  always @ (negedge clk1)
  begin : MEM_READ1
    if (!csb1_reg)
       dout1 <= #(DELAY) mem[addr1_reg];
  end

endmodule
// synopsys translate_on