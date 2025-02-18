`ifndef SYNTHESIS

//
// This is an automatically generated file from 
// dc_shell Version S-2021.06-SP5-4 -- Aug 05, 2022
//

// For simulation only. Do not modify.

module SramUnit_svsim #(
  parameter NUM_WMASKS = 4,
  parameter DATA_WIDTH = 32,
  parameter ADDR_WIDTH = 8
)(
  input clk,   input rst_n,
  input csb0,   input csb1,   input web0,   input [NUM_WMASKS-1:0] wmask0,   input [ADDR_WIDTH-1:0] addr0,
  input [DATA_WIDTH-1:0] din0,
  output [DATA_WIDTH-1:0] dout0,
  output [DATA_WIDTH-1:0] dout1
);

  

  SramUnit SramUnit( {>>{ clk }}, {>>{ rst_n }}, {>>{ csb0 }}, {>>{ csb1 }}, 
        {>>{ web0 }}, {>>{ wmask0 }}, {>>{ addr0 }}, {>>{ din0 }}, 
        {>>{ dout0 }}, {>>{ dout1 }} );
endmodule
`endif
