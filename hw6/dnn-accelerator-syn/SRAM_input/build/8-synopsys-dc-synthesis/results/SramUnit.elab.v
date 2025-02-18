/////////////////////////////////////////////////////////////
// Created by: Synopsys Design Compiler(R)
// Version   : S-2021.06-SP5-4
// Date      : Mon Feb 17 10:39:20 2025
/////////////////////////////////////////////////////////////


module SramUnit ( clk, rst_n, csb0, csb1, web0, wmask0, addr0, din0, dout0, 
        dout1 );
  input [3:0] wmask0;
  input [7:0] addr0;
  input [31:0] din0;
  output [31:0] dout0;
  output [31:0] dout1;
  input clk, rst_n, csb0, csb1, web0;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15,
         N16, N17, N18, N19, N20, N21;
  wire   [7:0] addr1;

  sky130_sram_1kbyte_1rw1r_32x256_8 sram ( .din0(din0), .dout0(dout0), .addr0(
        addr0), .wmask0(wmask0), .dout1(dout1), .addr1(addr1), .csb0(csb0), 
        .web0(web0), .clk0(clk), .csb1(csb1), .clk1(clk) );
  \**SEQGEN**  \addr1_reg[7]  ( .clear(1'b0), .preset(1'b0), .next_state(N21), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(addr1[7]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N13) );
  \**SEQGEN**  \addr1_reg[6]  ( .clear(1'b0), .preset(1'b0), .next_state(N20), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(addr1[6]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N13) );
  \**SEQGEN**  \addr1_reg[5]  ( .clear(1'b0), .preset(1'b0), .next_state(N19), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(addr1[5]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N13) );
  \**SEQGEN**  \addr1_reg[4]  ( .clear(1'b0), .preset(1'b0), .next_state(N18), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(addr1[4]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N13) );
  \**SEQGEN**  \addr1_reg[3]  ( .clear(1'b0), .preset(1'b0), .next_state(N17), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(addr1[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N13) );
  \**SEQGEN**  \addr1_reg[2]  ( .clear(1'b0), .preset(1'b0), .next_state(N16), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(addr1[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N13) );
  \**SEQGEN**  \addr1_reg[1]  ( .clear(1'b0), .preset(1'b0), .next_state(N15), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(addr1[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N13) );
  \**SEQGEN**  \addr1_reg[0]  ( .clear(1'b0), .preset(1'b0), .next_state(N14), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(addr1[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N13) );
  ADD_UNS_OP add_42 ( .A(addr1), .B(1'b1), .Z({N12, N11, N10, N9, N8, N7, N6, 
        N5}) );
  SELECT_OP C47 ( .DATA1(N4), .DATA2(1'b1), .CONTROL1(N0), .CONTROL2(N1), .Z(
        N13) );
  GTECH_BUF B_0 ( .A(rst_n), .Z(N0) );
  GTECH_BUF B_1 ( .A(N2), .Z(N1) );
  SELECT_OP C48 ( .DATA1({N12, N11, N10, N9, N8, N7, N6, N5}), .DATA2({1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CONTROL1(N0), .CONTROL2(
        N1), .Z({N21, N20, N19, N18, N17, N16, N15, N14}) );
  GTECH_NOT I_0 ( .A(rst_n), .Z(N2) );
  GTECH_BUF B_2 ( .A(rst_n), .Z(N3) );
  GTECH_NOT I_1 ( .A(csb1), .Z(N4) );
  GTECH_AND2 C57 ( .A(N3), .B(N4) );
endmodule

