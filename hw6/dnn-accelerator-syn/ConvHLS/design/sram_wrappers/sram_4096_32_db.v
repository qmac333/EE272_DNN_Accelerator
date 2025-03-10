module sram_4096_32_db (
    input  clk0, // clock
    input   csb0, // active low chip select
    input  web0, // active low write control
    input [11:0]  addr0,
    input [31:0]  din0,
    input  clk1, // clock
    input   csb1, // active low chip select
    input [11:0]  addr1,
    output [31:0] dout1
);

wire [2:0] which_512sram_depth0;
wire [2:0] which_512sram_depth1;
wire [31:0] dout0_floating[0:7][0:3];
reg [2:0] addr1_reg;
wire [31:0] dout_eachsram [0:7];


assign which_512sram_depth0 = addr0[11:9];
assign which_512sram_depth1 = addr1[11:9];




//generate statements to create 16 instances to fill up 512 word size
genvar i; //i for width
generate 
  for (i = 0; i < 8; i = i + 1) begin
    sky130_sram_2kbyte_1rw1r_32x512_8 macro (
    // Port 0: W
        .clk0(clk0),.csb0(csb0 || (which_512sram_depth0 != j)),.web0(web0),.wmask0(4'hF),.addr0(addr0[8:0]),.din0(din0[(i+1)*32-1 : i*32]),.dout0(dout0_floating[i]),
    // Port 1: R
        .clk1(clk1),.csb1(csb1 || (which_512sram_depth0 != j)),.addr1(addr1[8:0]),.dout1(dout_eachsram[j])
    );
  end
endgenerate

always @ (posedge clk1) begin
    addr1_reg <= addr1[11:9];
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
