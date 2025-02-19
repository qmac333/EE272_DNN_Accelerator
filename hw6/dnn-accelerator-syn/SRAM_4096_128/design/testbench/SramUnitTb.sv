`define CLK_PERIOD 20
`define ASSIGNMENT_DELAY 5
`define FINISH_TIME 200
`define NUM_WMASKS 4
`define DATA_WIDTH 32
`define ADDR_WIDTH 12

module SramUnitTb;
  
  reg clk;
  // reg rst_n;
  reg csb0; // active low chip select
  reg csb1; // active low chip select
  reg web0; // active low write control
  // reg [`NUM_WMASKS-1:0] wmask0; // write mask
  reg [`ADDR_WIDTH-1:0] addr0;
  reg [`ADDR_WIDTH-1:0] addr1;
  reg [`DATA_WIDTH-1:0] din0;
  // wire [`DATA_WIDTH-1:0] dout0;
  wire [`DATA_WIDTH-1:0] dout1;

  always #(`CLK_PERIOD/2) clk =~clk;
 
  sram_4096_128_db 
  SramUnit_inst (
    .clk0(clk),
    .csb0(csb0),
    .web0(web0),
    .addr0(addr0),
    .din0(din0),
    .clk1(clk),
    .csb1(csb1),
    .addr1(addr1),
    .dout1(dout1)
  );

  initial begin
    clk <= 0;
    // rst_n <= 0; // Reset the address
    csb0 <= 1; // SRAM port 0 not enabled
    csb1 <= 1; // SRAM port 1 not enabled
    web0 <= 1;
    addr0 <= 0;
    din0 <= 0;
    // #(1*`CLK_PERIOD) rst_n <= 1;
    #(1*`CLK_PERIOD) 
    // Write into addr 0
    csb0 <= 0;
    web0 <= 0;
    addr0 <= 0;
    din0 <= 32'haaaaaaaa;
    // wmask0 <= 4'b1111;
    #(1*`CLK_PERIOD) //csb0 <= 1;
    //csb1 <= 0;
    //Read
    csb0 <= 1;
    addr1 <= 0;
    csb1 <= 0;
    web0 <= 1; // Read
    #(1*`CLK_PERIOD) //csb1 <= 1;
    csb1 <= 1;
    #(`CLK_PERIOD/2) $display("dout1 = %h", dout1);
    assert(dout1 == 32'haaaaaaaa);
    #(`CLK_PERIOD/2)

    // Write into last addr, 4095
    csb0 <= 0;
    web0 <= 0;
    addr0 <= 4095;
    din0 <= 32'hbbbbbbbb;
    #(1*`CLK_PERIOD) //csb0 <= 1;

    //Read
    csb0 <= 1;
    addr1 <= 4095;
    csb1 <= 0;
    web0 <= 1; // Read
    #(1*`CLK_PERIOD) //csb1 <= 1;
    csb1 <= 1;
    #(`CLK_PERIOD/2) $display("dout1 = %h", dout1);
    assert(dout1 == 32'hbbbbbbbb);

  end

  initial begin
    $vcdplusfile("dump.vcd");
    $vcdplusmemon();
    $vcdpluson(0, SramUnitTb);
    #(`FINISH_TIME);
    $finish(2);
  end

endmodule 
