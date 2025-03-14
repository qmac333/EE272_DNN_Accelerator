###################################################################

# Created by write_sdc on Mon Feb 17 10:42:10 2025

###################################################################
set sdc_version 2.1

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_max_fanout 20 [current_design]
set_max_transition 5 [current_design]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -no_design_rule [get_ports clk]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -no_design_rule [get_ports rst_n]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -no_design_rule [get_ports csb0]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -no_design_rule [get_ports csb1]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -no_design_rule [get_ports web0]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -no_design_rule [get_ports {wmask0[3]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -no_design_rule [get_ports {wmask0[2]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -no_design_rule [get_ports {wmask0[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -no_design_rule [get_ports {wmask0[0]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -no_design_rule [get_ports {addr0[7]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -no_design_rule [get_ports {addr0[6]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -no_design_rule [get_ports {addr0[5]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -no_design_rule [get_ports {addr0[4]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -no_design_rule [get_ports {addr0[3]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -no_design_rule [get_ports {addr0[2]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -no_design_rule [get_ports {addr0[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -no_design_rule [get_ports {addr0[0]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -no_design_rule [get_ports {din0[31]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -no_design_rule [get_ports {din0[30]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -no_design_rule [get_ports {din0[29]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -no_design_rule [get_ports {din0[28]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -no_design_rule [get_ports {din0[27]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -no_design_rule [get_ports {din0[26]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -no_design_rule [get_ports {din0[25]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -no_design_rule [get_ports {din0[24]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -no_design_rule [get_ports {din0[23]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -no_design_rule [get_ports {din0[22]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -no_design_rule [get_ports {din0[21]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -no_design_rule [get_ports {din0[20]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -no_design_rule [get_ports {din0[19]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -no_design_rule [get_ports {din0[18]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -no_design_rule [get_ports {din0[17]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -no_design_rule [get_ports {din0[16]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -no_design_rule [get_ports {din0[15]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -no_design_rule [get_ports {din0[14]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -no_design_rule [get_ports {din0[13]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -no_design_rule [get_ports {din0[12]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -no_design_rule [get_ports {din0[11]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -no_design_rule [get_ports {din0[10]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -no_design_rule [get_ports {din0[9]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -no_design_rule [get_ports {din0[8]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -no_design_rule [get_ports {din0[7]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -no_design_rule [get_ports {din0[6]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -no_design_rule [get_ports {din0[5]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -no_design_rule [get_ports {din0[4]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -no_design_rule [get_ports {din0[3]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -no_design_rule [get_ports {din0[2]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -no_design_rule [get_ports {din0[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -no_design_rule [get_ports {din0[0]}]
set_load -pin_load 0.009 [get_ports {dout0[31]}]
set_load -pin_load 0.009 [get_ports {dout0[30]}]
set_load -pin_load 0.009 [get_ports {dout0[29]}]
set_load -pin_load 0.009 [get_ports {dout0[28]}]
set_load -pin_load 0.009 [get_ports {dout0[27]}]
set_load -pin_load 0.009 [get_ports {dout0[26]}]
set_load -pin_load 0.009 [get_ports {dout0[25]}]
set_load -pin_load 0.009 [get_ports {dout0[24]}]
set_load -pin_load 0.009 [get_ports {dout0[23]}]
set_load -pin_load 0.009 [get_ports {dout0[22]}]
set_load -pin_load 0.009 [get_ports {dout0[21]}]
set_load -pin_load 0.009 [get_ports {dout0[20]}]
set_load -pin_load 0.009 [get_ports {dout0[19]}]
set_load -pin_load 0.009 [get_ports {dout0[18]}]
set_load -pin_load 0.009 [get_ports {dout0[17]}]
set_load -pin_load 0.009 [get_ports {dout0[16]}]
set_load -pin_load 0.009 [get_ports {dout0[15]}]
set_load -pin_load 0.009 [get_ports {dout0[14]}]
set_load -pin_load 0.009 [get_ports {dout0[13]}]
set_load -pin_load 0.009 [get_ports {dout0[12]}]
set_load -pin_load 0.009 [get_ports {dout0[11]}]
set_load -pin_load 0.009 [get_ports {dout0[10]}]
set_load -pin_load 0.009 [get_ports {dout0[9]}]
set_load -pin_load 0.009 [get_ports {dout0[8]}]
set_load -pin_load 0.009 [get_ports {dout0[7]}]
set_load -pin_load 0.009 [get_ports {dout0[6]}]
set_load -pin_load 0.009 [get_ports {dout0[5]}]
set_load -pin_load 0.009 [get_ports {dout0[4]}]
set_load -pin_load 0.009 [get_ports {dout0[3]}]
set_load -pin_load 0.009 [get_ports {dout0[2]}]
set_load -pin_load 0.009 [get_ports {dout0[1]}]
set_load -pin_load 0.009 [get_ports {dout0[0]}]
set_load -pin_load 0.009 [get_ports {dout1[31]}]
set_load -pin_load 0.009 [get_ports {dout1[30]}]
set_load -pin_load 0.009 [get_ports {dout1[29]}]
set_load -pin_load 0.009 [get_ports {dout1[28]}]
set_load -pin_load 0.009 [get_ports {dout1[27]}]
set_load -pin_load 0.009 [get_ports {dout1[26]}]
set_load -pin_load 0.009 [get_ports {dout1[25]}]
set_load -pin_load 0.009 [get_ports {dout1[24]}]
set_load -pin_load 0.009 [get_ports {dout1[23]}]
set_load -pin_load 0.009 [get_ports {dout1[22]}]
set_load -pin_load 0.009 [get_ports {dout1[21]}]
set_load -pin_load 0.009 [get_ports {dout1[20]}]
set_load -pin_load 0.009 [get_ports {dout1[19]}]
set_load -pin_load 0.009 [get_ports {dout1[18]}]
set_load -pin_load 0.009 [get_ports {dout1[17]}]
set_load -pin_load 0.009 [get_ports {dout1[16]}]
set_load -pin_load 0.009 [get_ports {dout1[15]}]
set_load -pin_load 0.009 [get_ports {dout1[14]}]
set_load -pin_load 0.009 [get_ports {dout1[13]}]
set_load -pin_load 0.009 [get_ports {dout1[12]}]
set_load -pin_load 0.009 [get_ports {dout1[11]}]
set_load -pin_load 0.009 [get_ports {dout1[10]}]
set_load -pin_load 0.009 [get_ports {dout1[9]}]
set_load -pin_load 0.009 [get_ports {dout1[8]}]
set_load -pin_load 0.009 [get_ports {dout1[7]}]
set_load -pin_load 0.009 [get_ports {dout1[6]}]
set_load -pin_load 0.009 [get_ports {dout1[5]}]
set_load -pin_load 0.009 [get_ports {dout1[4]}]
set_load -pin_load 0.009 [get_ports {dout1[3]}]
set_load -pin_load 0.009 [get_ports {dout1[2]}]
set_load -pin_load 0.009 [get_ports {dout1[1]}]
set_load -pin_load 0.009 [get_ports {dout1[0]}]
create_clock [get_ports clk]  -name ideal_clock  -period 20  -waveform {0 10}
group_path -name FEEDTHROUGH  -from [list [get_ports rst_n] [get_ports csb0] [get_ports csb1] [get_ports web0] [get_ports {wmask0[3]}] [get_ports {wmask0[2]}] [get_ports {wmask0[1]}] [get_ports {wmask0[0]}] [get_ports {addr0[7]}] [get_ports {addr0[6]}] [get_ports {addr0[5]}] [get_ports {addr0[4]}] [get_ports {addr0[3]}] [get_ports {addr0[2]}] [get_ports {addr0[1]}] [get_ports {addr0[0]}] [get_ports {din0[31]}] [get_ports {din0[30]}] [get_ports {din0[29]}] [get_ports {din0[28]}] [get_ports {din0[27]}] [get_ports {din0[26]}] [get_ports {din0[25]}] [get_ports {din0[24]}] [get_ports {din0[23]}] [get_ports {din0[22]}] [get_ports {din0[21]}] [get_ports {din0[20]}] [get_ports {din0[19]}] [get_ports {din0[18]}] [get_ports {din0[17]}] [get_ports {din0[16]}] [get_ports {din0[15]}] [get_ports {din0[14]}] [get_ports {din0[13]}] [get_ports {din0[12]}] [get_ports {din0[11]}] [get_ports {din0[10]}] [get_ports {din0[9]}] [get_ports {din0[8]}] [get_ports {din0[7]}] [get_ports {din0[6]}] [get_ports {din0[5]}] [get_ports {din0[4]}] [get_ports {din0[3]}] [get_ports {din0[2]}] [get_ports {din0[1]}] [get_ports {din0[0]}]]  -to [list [get_ports {dout0[31]}] [get_ports {dout0[30]}] [get_ports {dout0[29]}] [get_ports {dout0[28]}] [get_ports {dout0[27]}] [get_ports {dout0[26]}] [get_ports {dout0[25]}] [get_ports {dout0[24]}] [get_ports {dout0[23]}] [get_ports {dout0[22]}] [get_ports {dout0[21]}] [get_ports {dout0[20]}] [get_ports {dout0[19]}] [get_ports {dout0[18]}] [get_ports {dout0[17]}] [get_ports {dout0[16]}] [get_ports {dout0[15]}] [get_ports {dout0[14]}] [get_ports {dout0[13]}] [get_ports {dout0[12]}] [get_ports {dout0[11]}] [get_ports {dout0[10]}] [get_ports {dout0[9]}] [get_ports {dout0[8]}] [get_ports {dout0[7]}] [get_ports {dout0[6]}] [get_ports {dout0[5]}] [get_ports {dout0[4]}] [get_ports {dout0[3]}] [get_ports {dout0[2]}] [get_ports {dout0[1]}] [get_ports {dout0[0]}] [get_ports {dout1[31]}] [get_ports {dout1[30]}] [get_ports {dout1[29]}] [get_ports {dout1[28]}] [get_ports {dout1[27]}] [get_ports {dout1[26]}] [get_ports {dout1[25]}] [get_ports {dout1[24]}] [get_ports {dout1[23]}] [get_ports {dout1[22]}] [get_ports {dout1[21]}] [get_ports {dout1[20]}] [get_ports {dout1[19]}] [get_ports {dout1[18]}] [get_ports {dout1[17]}] [get_ports {dout1[16]}] [get_ports {dout1[15]}] [get_ports {dout1[14]}] [get_ports {dout1[13]}] [get_ports {dout1[12]}] [get_ports {dout1[11]}] [get_ports {dout1[10]}] [get_ports {dout1[9]}] [get_ports {dout1[8]}] [get_ports {dout1[7]}] [get_ports {dout1[6]}] [get_ports {dout1[5]}] [get_ports {dout1[4]}] [get_ports {dout1[3]}] [get_ports {dout1[2]}] [get_ports {dout1[1]}] [get_ports {dout1[0]}]]
group_path -name REGIN  -from [list [get_ports rst_n] [get_ports csb0] [get_ports csb1] [get_ports web0] [get_ports {wmask0[3]}] [get_ports {wmask0[2]}] [get_ports {wmask0[1]}] [get_ports {wmask0[0]}] [get_ports {addr0[7]}] [get_ports {addr0[6]}] [get_ports {addr0[5]}] [get_ports {addr0[4]}] [get_ports {addr0[3]}] [get_ports {addr0[2]}] [get_ports {addr0[1]}] [get_ports {addr0[0]}] [get_ports {din0[31]}] [get_ports {din0[30]}] [get_ports {din0[29]}] [get_ports {din0[28]}] [get_ports {din0[27]}] [get_ports {din0[26]}] [get_ports {din0[25]}] [get_ports {din0[24]}] [get_ports {din0[23]}] [get_ports {din0[22]}] [get_ports {din0[21]}] [get_ports {din0[20]}] [get_ports {din0[19]}] [get_ports {din0[18]}] [get_ports {din0[17]}] [get_ports {din0[16]}] [get_ports {din0[15]}] [get_ports {din0[14]}] [get_ports {din0[13]}] [get_ports {din0[12]}] [get_ports {din0[11]}] [get_ports {din0[10]}] [get_ports {din0[9]}] [get_ports {din0[8]}] [get_ports {din0[7]}] [get_ports {din0[6]}] [get_ports {din0[5]}] [get_ports {din0[4]}] [get_ports {din0[3]}] [get_ports {din0[2]}] [get_ports {din0[1]}] [get_ports {din0[0]}]]
group_path -name REGOUT  -to [list [get_ports {dout0[31]}] [get_ports {dout0[30]}] [get_ports {dout0[29]}] [get_ports {dout0[28]}] [get_ports {dout0[27]}] [get_ports {dout0[26]}] [get_ports {dout0[25]}] [get_ports {dout0[24]}] [get_ports {dout0[23]}] [get_ports {dout0[22]}] [get_ports {dout0[21]}] [get_ports {dout0[20]}] [get_ports {dout0[19]}] [get_ports {dout0[18]}] [get_ports {dout0[17]}] [get_ports {dout0[16]}] [get_ports {dout0[15]}] [get_ports {dout0[14]}] [get_ports {dout0[13]}] [get_ports {dout0[12]}] [get_ports {dout0[11]}] [get_ports {dout0[10]}] [get_ports {dout0[9]}] [get_ports {dout0[8]}] [get_ports {dout0[7]}] [get_ports {dout0[6]}] [get_ports {dout0[5]}] [get_ports {dout0[4]}] [get_ports {dout0[3]}] [get_ports {dout0[2]}] [get_ports {dout0[1]}] [get_ports {dout0[0]}] [get_ports {dout1[31]}] [get_ports {dout1[30]}] [get_ports {dout1[29]}] [get_ports {dout1[28]}] [get_ports {dout1[27]}] [get_ports {dout1[26]}] [get_ports {dout1[25]}] [get_ports {dout1[24]}] [get_ports {dout1[23]}] [get_ports {dout1[22]}] [get_ports {dout1[21]}] [get_ports {dout1[20]}] [get_ports {dout1[19]}] [get_ports {dout1[18]}] [get_ports {dout1[17]}] [get_ports {dout1[16]}] [get_ports {dout1[15]}] [get_ports {dout1[14]}] [get_ports {dout1[13]}] [get_ports {dout1[12]}] [get_ports {dout1[11]}] [get_ports {dout1[10]}] [get_ports {dout1[9]}] [get_ports {dout1[8]}] [get_ports {dout1[7]}] [get_ports {dout1[6]}] [get_ports {dout1[5]}] [get_ports {dout1[4]}] [get_ports {dout1[3]}] [get_ports {dout1[2]}] [get_ports {dout1[1]}] [get_ports {dout1[0]}]]
set_input_delay -clock ideal_clock  10  [get_ports clk]
set_input_delay -clock ideal_clock  10  [get_ports rst_n]
set_input_delay -clock ideal_clock  10  [get_ports csb0]
set_input_delay -clock ideal_clock  10  [get_ports csb1]
set_input_delay -clock ideal_clock  10  [get_ports web0]
set_input_delay -clock ideal_clock  10  [get_ports {wmask0[3]}]
set_input_delay -clock ideal_clock  10  [get_ports {wmask0[2]}]
set_input_delay -clock ideal_clock  10  [get_ports {wmask0[1]}]
set_input_delay -clock ideal_clock  10  [get_ports {wmask0[0]}]
set_input_delay -clock ideal_clock  10  [get_ports {addr0[7]}]
set_input_delay -clock ideal_clock  10  [get_ports {addr0[6]}]
set_input_delay -clock ideal_clock  10  [get_ports {addr0[5]}]
set_input_delay -clock ideal_clock  10  [get_ports {addr0[4]}]
set_input_delay -clock ideal_clock  10  [get_ports {addr0[3]}]
set_input_delay -clock ideal_clock  10  [get_ports {addr0[2]}]
set_input_delay -clock ideal_clock  10  [get_ports {addr0[1]}]
set_input_delay -clock ideal_clock  10  [get_ports {addr0[0]}]
set_input_delay -clock ideal_clock  10  [get_ports {din0[31]}]
set_input_delay -clock ideal_clock  10  [get_ports {din0[30]}]
set_input_delay -clock ideal_clock  10  [get_ports {din0[29]}]
set_input_delay -clock ideal_clock  10  [get_ports {din0[28]}]
set_input_delay -clock ideal_clock  10  [get_ports {din0[27]}]
set_input_delay -clock ideal_clock  10  [get_ports {din0[26]}]
set_input_delay -clock ideal_clock  10  [get_ports {din0[25]}]
set_input_delay -clock ideal_clock  10  [get_ports {din0[24]}]
set_input_delay -clock ideal_clock  10  [get_ports {din0[23]}]
set_input_delay -clock ideal_clock  10  [get_ports {din0[22]}]
set_input_delay -clock ideal_clock  10  [get_ports {din0[21]}]
set_input_delay -clock ideal_clock  10  [get_ports {din0[20]}]
set_input_delay -clock ideal_clock  10  [get_ports {din0[19]}]
set_input_delay -clock ideal_clock  10  [get_ports {din0[18]}]
set_input_delay -clock ideal_clock  10  [get_ports {din0[17]}]
set_input_delay -clock ideal_clock  10  [get_ports {din0[16]}]
set_input_delay -clock ideal_clock  10  [get_ports {din0[15]}]
set_input_delay -clock ideal_clock  10  [get_ports {din0[14]}]
set_input_delay -clock ideal_clock  10  [get_ports {din0[13]}]
set_input_delay -clock ideal_clock  10  [get_ports {din0[12]}]
set_input_delay -clock ideal_clock  10  [get_ports {din0[11]}]
set_input_delay -clock ideal_clock  10  [get_ports {din0[10]}]
set_input_delay -clock ideal_clock  10  [get_ports {din0[9]}]
set_input_delay -clock ideal_clock  10  [get_ports {din0[8]}]
set_input_delay -clock ideal_clock  10  [get_ports {din0[7]}]
set_input_delay -clock ideal_clock  10  [get_ports {din0[6]}]
set_input_delay -clock ideal_clock  10  [get_ports {din0[5]}]
set_input_delay -clock ideal_clock  10  [get_ports {din0[4]}]
set_input_delay -clock ideal_clock  10  [get_ports {din0[3]}]
set_input_delay -clock ideal_clock  10  [get_ports {din0[2]}]
set_input_delay -clock ideal_clock  10  [get_ports {din0[1]}]
set_input_delay -clock ideal_clock  10  [get_ports {din0[0]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout0[31]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout0[30]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout0[29]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout0[28]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout0[27]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout0[26]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout0[25]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout0[24]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout0[23]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout0[22]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout0[21]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout0[20]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout0[19]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout0[18]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout0[17]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout0[16]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout0[15]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout0[14]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout0[13]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout0[12]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout0[11]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout0[10]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout0[9]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout0[8]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout0[7]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout0[6]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout0[5]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout0[4]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout0[3]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout0[2]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout0[1]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout0[0]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout1[31]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout1[30]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout1[29]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout1[28]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout1[27]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout1[26]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout1[25]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout1[24]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout1[23]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout1[22]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout1[21]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout1[20]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout1[19]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout1[18]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout1[17]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout1[16]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout1[15]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout1[14]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout1[13]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout1[12]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout1[11]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout1[10]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout1[9]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout1[8]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout1[7]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout1[6]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout1[5]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout1[4]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout1[3]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout1[2]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout1[1]}]
set_output_delay -clock ideal_clock  0  [get_ports {dout1[0]}]
