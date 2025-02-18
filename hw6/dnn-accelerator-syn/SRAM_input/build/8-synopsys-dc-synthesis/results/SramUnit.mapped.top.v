/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in topographical mode
// Version   : S-2021.06-SP5-4
// Date      : Mon Feb 17 10:42:10 2025
/////////////////////////////////////////////////////////////


module SramUnit_SramUnit_DW01_inc_J1_0_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;
  wire   n27, n28, n29, n30, n31, n32;

  sky130_fd_sc_hd__xor2_1 U12 ( .A(n27), .B(A[7]), .X(SUM[7]) );
  sky130_fd_sc_hd__ha_1 U13 ( .A(A[1]), .B(A[0]), .COUT(n28), .SUM(SUM[1]) );
  sky130_fd_sc_hd__ha_1 U14 ( .A(A[2]), .B(n28), .COUT(n29), .SUM(SUM[2]) );
  sky130_fd_sc_hd__ha_1 U15 ( .A(A[3]), .B(n29), .COUT(n30), .SUM(SUM[3]) );
  sky130_fd_sc_hd__ha_1 U16 ( .A(A[4]), .B(n30), .COUT(n31), .SUM(SUM[4]) );
  sky130_fd_sc_hd__ha_1 U17 ( .A(A[5]), .B(n31), .COUT(n32), .SUM(SUM[5]) );
  sky130_fd_sc_hd__ha_1 U18 ( .A(A[6]), .B(n32), .COUT(n27), .SUM(SUM[6]) );
  sky130_fd_sc_hd__inv_1 U11 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module SramUnit ( clk, rst_n, csb0, csb1, web0, wmask0, addr0, din0, dout0, 
        dout1 );
  input [3:0] wmask0;
  input [7:0] addr0;
  input [31:0] din0;
  output [31:0] dout0;
  output [31:0] dout1;
  input clk, rst_n, csb0, csb1, web0;
  wire   n_Logic0_, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17,
         N18, N19, N20, N21, net51, n1, n2, n3, n4, n50, n60, n70, n80;
  wire   [7:0] addr1;

  sky130_sram_1kbyte_1rw1r_32x256_8 sram ( .din0(din0), .dout0(dout0), .addr0(
        addr0), .wmask0(wmask0), .dout1(dout1), .addr1({n80, n70, n60, n50, n4, 
        n3, n2, n1}), .csb0(csb0), .web0(web0), .clk0(clk), .csb1(csb1), 
        .clk1(clk) );
  SramUnit_SNPS_CLOCK_GATE_HIGH_SramUnit_0 clk_gate_addr1_reg ( .CLK(clk), 
        .EN(N13), .ENCLK(net51), .TE(n_Logic0_) );
  sky130_fd_sc_hd__dfxtp_1 addr1_reg_7_ ( .D(N21), .CLK(net51), .Q(addr1[7])
         );
  sky130_fd_sc_hd__dfxtp_1 addr1_reg_6_ ( .D(N20), .CLK(net51), .Q(addr1[6])
         );
  sky130_fd_sc_hd__dfxtp_1 addr1_reg_5_ ( .D(N19), .CLK(net51), .Q(addr1[5])
         );
  sky130_fd_sc_hd__dfxtp_1 addr1_reg_4_ ( .D(N18), .CLK(net51), .Q(addr1[4])
         );
  sky130_fd_sc_hd__dfxtp_1 addr1_reg_3_ ( .D(N17), .CLK(net51), .Q(addr1[3])
         );
  sky130_fd_sc_hd__dfxtp_1 addr1_reg_2_ ( .D(N16), .CLK(net51), .Q(addr1[2])
         );
  sky130_fd_sc_hd__dfxtp_1 addr1_reg_1_ ( .D(N15), .CLK(net51), .Q(addr1[1])
         );
  sky130_fd_sc_hd__dfxtp_1 addr1_reg_0_ ( .D(N14), .CLK(net51), .Q(addr1[0])
         );
  SramUnit_SramUnit_DW01_inc_J1_0_0 add_x_1 ( .A(addr1), .SUM({N12, N11, N10, 
        N9, N8, N7, N6, N5}) );
  sky130_fd_sc_hd__and2_1 U13 ( .A(rst_n), .B(N11), .X(N20) );
  sky130_fd_sc_hd__and2_1 U14 ( .A(rst_n), .B(N10), .X(N19) );
  sky130_fd_sc_hd__and2_1 U15 ( .A(rst_n), .B(N9), .X(N18) );
  sky130_fd_sc_hd__and2_1 U16 ( .A(rst_n), .B(N8), .X(N17) );
  sky130_fd_sc_hd__and2_1 U17 ( .A(rst_n), .B(N12), .X(N21) );
  sky130_fd_sc_hd__and2_1 U18 ( .A(rst_n), .B(N7), .X(N16) );
  sky130_fd_sc_hd__and2_1 U19 ( .A(rst_n), .B(N6), .X(N15) );
  sky130_fd_sc_hd__and2_1 U20 ( .A(rst_n), .B(N5), .X(N14) );
  sky130_fd_sc_hd__nand2_1 U22 ( .A(rst_n), .B(csb1), .Y(N13) );
  sky130_fd_sc_hd__buf_12 U30 ( .A(addr1[7]), .X(n80) );
  sky130_fd_sc_hd__buf_12 U29 ( .A(addr1[6]), .X(n70) );
  sky130_fd_sc_hd__buf_12 U27 ( .A(addr1[4]), .X(n50) );
  sky130_fd_sc_hd__buf_6 U25 ( .A(addr1[2]), .X(n3) );
  sky130_fd_sc_hd__buf_6 U26 ( .A(addr1[3]), .X(n4) );
  sky130_fd_sc_hd__buf_6 U28 ( .A(addr1[5]), .X(n60) );
  sky130_fd_sc_hd__buf_6 U23 ( .A(addr1[0]), .X(n1) );
  sky130_fd_sc_hd__buf_6 U24 ( .A(addr1[1]), .X(n2) );
  sky130_fd_sc_hd__conb_1 U21 ( .LO(n_Logic0_) );
endmodule

