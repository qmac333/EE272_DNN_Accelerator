module sram_8192_128_db (
    input  clk0, // clock
    input   csb0, // active low chip select
    input  web0, // active low write control
    input [12:0]  addr0,
    input [127:0]  din0,
    input  clk1, // clock
    input   csb1, // active low chip select
    input [12:0]  addr1,
    output [127:0] dout1
);

wire [3:0] which_512sram_depth0;
wire [3:0] which_512sram_depth1;
wire [31:0] dout0_floating [0:15][0:3];
reg [3:0] addr1_reg;
wire [127:0] dout_eachsram [0:15];


assign which_512sram_depth0 = addr0[12:9];
assign which_512sram_depth1 = addr1[12:9];


//generate statements to create 4 instances of the sky130_sram_2kbyte_1rw1r_32x512_8 module for the width and 8 instances for the depth
genvar i, j; //i for width, j for depth
generate 
  for (j = 0; j<16; j = j +1) begin
    for (i = 0; i<4; i = i +1) begin
      sky130_sram_2kbyte_1rw1r_32x512_8 macro (
      // Port 0: W
          .clk0(clk0),.csb0(csb0 || (which_512sram_depth0 != j)),.web0(web0),.wmask0(4'hF),.addr0(addr0[8:0]),.din0(din0[(i+1)*32-1 : i*32]),.dout0(dout0_floating[j][i]),
      // Port 1: R
          .clk1(clk1),.csb1(csb1 || (which_512sram_depth1 != j)),.addr1(addr1[8:0]),.dout1(dout_eachsram[j][(i+1)*32-1 : i*32])
      );
    end
  end
endgenerate

always @ (posedge clk1) begin
    addr1_reg <= addr1[12:9];
end

assign dout1 = dout_eachsram[addr1_reg];




endmodule

// OpenRAM SRAM model
// Words: 512
// Word size: 32
// Write size: 8
// synopsys translate_off
module sky130_sram_2kbyte_1rw1r_32x512_8#(
  parameter NUM_WMASKS = 4,
  parameter DATA_WIDTH = 32,
  parameter ADDR_WIDTH = 12,
  parameter RAM_DEPTH = 1 << ADDR_WIDTH,
  parameter DELAY = 1
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

  reg  csb1_reg;
  reg [ADDR_WIDTH-1:0]  addr1_reg;

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
