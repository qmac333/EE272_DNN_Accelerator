###############################################################
#  Generated by:      Cadence Innovus 22.13-s094_1
#  OS:                Linux x86_64(Host ID iron-07)
#  Generated on:      Thu Feb 27 15:18:01 2025
#  Design:            conv
#  Command:           saveDesign ../../conv_glitch4_nodrc
###############################################################
current_design conv
create_clock [get_ports {clk}]  -name ideal_clock -period 10.000000 -waveform {0.000000 5.000000}
set_propagated_clock  [get_ports {clk}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -min -no_design_rule [get_ports {clk}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -min -no_design_rule [get_ports {clk}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -max -no_design_rule [get_ports {clk}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -max -no_design_rule [get_ports {clk}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -min -no_design_rule [get_ports {rst_n}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -min -no_design_rule [get_ports {rst_n}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -max -no_design_rule [get_ports {rst_n}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -max -no_design_rule [get_ports {rst_n}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -min -no_design_rule [get_ports {ifmap_weight_data[16]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -min -no_design_rule [get_ports {ifmap_weight_data[16]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -max -no_design_rule [get_ports {ifmap_weight_data[16]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -max -no_design_rule [get_ports {ifmap_weight_data[16]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -min -no_design_rule [get_ports {ifmap_weight_data[15]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -min -no_design_rule [get_ports {ifmap_weight_data[15]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -max -no_design_rule [get_ports {ifmap_weight_data[15]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -max -no_design_rule [get_ports {ifmap_weight_data[15]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -min -no_design_rule [get_ports {ifmap_weight_data[14]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -min -no_design_rule [get_ports {ifmap_weight_data[14]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -max -no_design_rule [get_ports {ifmap_weight_data[14]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -max -no_design_rule [get_ports {ifmap_weight_data[14]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -min -no_design_rule [get_ports {ifmap_weight_data[13]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -min -no_design_rule [get_ports {ifmap_weight_data[13]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -max -no_design_rule [get_ports {ifmap_weight_data[13]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -max -no_design_rule [get_ports {ifmap_weight_data[13]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -min -no_design_rule [get_ports {ifmap_weight_data[12]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -min -no_design_rule [get_ports {ifmap_weight_data[12]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -max -no_design_rule [get_ports {ifmap_weight_data[12]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -max -no_design_rule [get_ports {ifmap_weight_data[12]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -min -no_design_rule [get_ports {ifmap_weight_data[11]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -min -no_design_rule [get_ports {ifmap_weight_data[11]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -max -no_design_rule [get_ports {ifmap_weight_data[11]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -max -no_design_rule [get_ports {ifmap_weight_data[11]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -min -no_design_rule [get_ports {ifmap_weight_data[10]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -min -no_design_rule [get_ports {ifmap_weight_data[10]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -max -no_design_rule [get_ports {ifmap_weight_data[10]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -max -no_design_rule [get_ports {ifmap_weight_data[10]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -min -no_design_rule [get_ports {ifmap_weight_data[9]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -min -no_design_rule [get_ports {ifmap_weight_data[9]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -max -no_design_rule [get_ports {ifmap_weight_data[9]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -max -no_design_rule [get_ports {ifmap_weight_data[9]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -min -no_design_rule [get_ports {ifmap_weight_data[8]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -min -no_design_rule [get_ports {ifmap_weight_data[8]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -max -no_design_rule [get_ports {ifmap_weight_data[8]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -max -no_design_rule [get_ports {ifmap_weight_data[8]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -min -no_design_rule [get_ports {ifmap_weight_data[7]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -min -no_design_rule [get_ports {ifmap_weight_data[7]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -max -no_design_rule [get_ports {ifmap_weight_data[7]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -max -no_design_rule [get_ports {ifmap_weight_data[7]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -min -no_design_rule [get_ports {ifmap_weight_data[6]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -min -no_design_rule [get_ports {ifmap_weight_data[6]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -max -no_design_rule [get_ports {ifmap_weight_data[6]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -max -no_design_rule [get_ports {ifmap_weight_data[6]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -min -no_design_rule [get_ports {ifmap_weight_data[5]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -min -no_design_rule [get_ports {ifmap_weight_data[5]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -max -no_design_rule [get_ports {ifmap_weight_data[5]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -max -no_design_rule [get_ports {ifmap_weight_data[5]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -min -no_design_rule [get_ports {ifmap_weight_data[4]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -min -no_design_rule [get_ports {ifmap_weight_data[4]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -max -no_design_rule [get_ports {ifmap_weight_data[4]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -max -no_design_rule [get_ports {ifmap_weight_data[4]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -min -no_design_rule [get_ports {ifmap_weight_data[3]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -min -no_design_rule [get_ports {ifmap_weight_data[3]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -max -no_design_rule [get_ports {ifmap_weight_data[3]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -max -no_design_rule [get_ports {ifmap_weight_data[3]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -min -no_design_rule [get_ports {ifmap_weight_data[2]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -min -no_design_rule [get_ports {ifmap_weight_data[2]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -max -no_design_rule [get_ports {ifmap_weight_data[2]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -max -no_design_rule [get_ports {ifmap_weight_data[2]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -min -no_design_rule [get_ports {ifmap_weight_data[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -min -no_design_rule [get_ports {ifmap_weight_data[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -max -no_design_rule [get_ports {ifmap_weight_data[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -max -no_design_rule [get_ports {ifmap_weight_data[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -min -no_design_rule [get_ports {ifmap_weight_data[0]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -min -no_design_rule [get_ports {ifmap_weight_data[0]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -max -no_design_rule [get_ports {ifmap_weight_data[0]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -max -no_design_rule [get_ports {ifmap_weight_data[0]}]
set_load -pin_load -max  0.009  [get_ports {ifmap_weight_rdy}]
set_load -pin_load -min  0.009  [get_ports {ifmap_weight_rdy}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -min -no_design_rule [get_ports {ifmap_weight_vld}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -min -no_design_rule [get_ports {ifmap_weight_vld}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -max -no_design_rule [get_ports {ifmap_weight_vld}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -max -no_design_rule [get_ports {ifmap_weight_vld}]
set_load -pin_load -max  0.009  [get_ports {ofmap_data[31]}]
set_load -pin_load -min  0.009  [get_ports {ofmap_data[31]}]
set_load -pin_load -max  0.009  [get_ports {ofmap_data[30]}]
set_load -pin_load -min  0.009  [get_ports {ofmap_data[30]}]
set_load -pin_load -max  0.009  [get_ports {ofmap_data[29]}]
set_load -pin_load -min  0.009  [get_ports {ofmap_data[29]}]
set_load -pin_load -max  0.009  [get_ports {ofmap_data[28]}]
set_load -pin_load -min  0.009  [get_ports {ofmap_data[28]}]
set_load -pin_load -max  0.009  [get_ports {ofmap_data[27]}]
set_load -pin_load -min  0.009  [get_ports {ofmap_data[27]}]
set_load -pin_load -max  0.009  [get_ports {ofmap_data[26]}]
set_load -pin_load -min  0.009  [get_ports {ofmap_data[26]}]
set_load -pin_load -max  0.009  [get_ports {ofmap_data[25]}]
set_load -pin_load -min  0.009  [get_ports {ofmap_data[25]}]
set_load -pin_load -max  0.009  [get_ports {ofmap_data[24]}]
set_load -pin_load -min  0.009  [get_ports {ofmap_data[24]}]
set_load -pin_load -max  0.009  [get_ports {ofmap_data[23]}]
set_load -pin_load -min  0.009  [get_ports {ofmap_data[23]}]
set_load -pin_load -max  0.009  [get_ports {ofmap_data[22]}]
set_load -pin_load -min  0.009  [get_ports {ofmap_data[22]}]
set_load -pin_load -max  0.009  [get_ports {ofmap_data[21]}]
set_load -pin_load -min  0.009  [get_ports {ofmap_data[21]}]
set_load -pin_load -max  0.009  [get_ports {ofmap_data[20]}]
set_load -pin_load -min  0.009  [get_ports {ofmap_data[20]}]
set_load -pin_load -max  0.009  [get_ports {ofmap_data[19]}]
set_load -pin_load -min  0.009  [get_ports {ofmap_data[19]}]
set_load -pin_load -max  0.009  [get_ports {ofmap_data[18]}]
set_load -pin_load -min  0.009  [get_ports {ofmap_data[18]}]
set_load -pin_load -max  0.009  [get_ports {ofmap_data[17]}]
set_load -pin_load -min  0.009  [get_ports {ofmap_data[17]}]
set_load -pin_load -max  0.009  [get_ports {ofmap_data[16]}]
set_load -pin_load -min  0.009  [get_ports {ofmap_data[16]}]
set_load -pin_load -max  0.009  [get_ports {ofmap_data[15]}]
set_load -pin_load -min  0.009  [get_ports {ofmap_data[15]}]
set_load -pin_load -max  0.009  [get_ports {ofmap_data[14]}]
set_load -pin_load -min  0.009  [get_ports {ofmap_data[14]}]
set_load -pin_load -max  0.009  [get_ports {ofmap_data[13]}]
set_load -pin_load -min  0.009  [get_ports {ofmap_data[13]}]
set_load -pin_load -max  0.009  [get_ports {ofmap_data[12]}]
set_load -pin_load -min  0.009  [get_ports {ofmap_data[12]}]
set_load -pin_load -max  0.009  [get_ports {ofmap_data[11]}]
set_load -pin_load -min  0.009  [get_ports {ofmap_data[11]}]
set_load -pin_load -max  0.009  [get_ports {ofmap_data[10]}]
set_load -pin_load -min  0.009  [get_ports {ofmap_data[10]}]
set_load -pin_load -max  0.009  [get_ports {ofmap_data[9]}]
set_load -pin_load -min  0.009  [get_ports {ofmap_data[9]}]
set_load -pin_load -max  0.009  [get_ports {ofmap_data[8]}]
set_load -pin_load -min  0.009  [get_ports {ofmap_data[8]}]
set_load -pin_load -max  0.009  [get_ports {ofmap_data[7]}]
set_load -pin_load -min  0.009  [get_ports {ofmap_data[7]}]
set_load -pin_load -max  0.009  [get_ports {ofmap_data[6]}]
set_load -pin_load -min  0.009  [get_ports {ofmap_data[6]}]
set_load -pin_load -max  0.009  [get_ports {ofmap_data[5]}]
set_load -pin_load -min  0.009  [get_ports {ofmap_data[5]}]
set_load -pin_load -max  0.009  [get_ports {ofmap_data[4]}]
set_load -pin_load -min  0.009  [get_ports {ofmap_data[4]}]
set_load -pin_load -max  0.009  [get_ports {ofmap_data[3]}]
set_load -pin_load -min  0.009  [get_ports {ofmap_data[3]}]
set_load -pin_load -max  0.009  [get_ports {ofmap_data[2]}]
set_load -pin_load -min  0.009  [get_ports {ofmap_data[2]}]
set_load -pin_load -max  0.009  [get_ports {ofmap_data[1]}]
set_load -pin_load -min  0.009  [get_ports {ofmap_data[1]}]
set_load -pin_load -max  0.009  [get_ports {ofmap_data[0]}]
set_load -pin_load -min  0.009  [get_ports {ofmap_data[0]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -min -no_design_rule [get_ports {ofmap_rdy}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -min -no_design_rule [get_ports {ofmap_rdy}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -max -no_design_rule [get_ports {ofmap_rdy}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -max -no_design_rule [get_ports {ofmap_rdy}]
set_load -pin_load -max  0.009  [get_ports {ofmap_vld}]
set_load -pin_load -min  0.009  [get_ports {ofmap_vld}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -min -no_design_rule [get_ports {config_data[15]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -min -no_design_rule [get_ports {config_data[15]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -max -no_design_rule [get_ports {config_data[15]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -max -no_design_rule [get_ports {config_data[15]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -min -no_design_rule [get_ports {config_data[14]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -min -no_design_rule [get_ports {config_data[14]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -max -no_design_rule [get_ports {config_data[14]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -max -no_design_rule [get_ports {config_data[14]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -min -no_design_rule [get_ports {config_data[13]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -min -no_design_rule [get_ports {config_data[13]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -max -no_design_rule [get_ports {config_data[13]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -max -no_design_rule [get_ports {config_data[13]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -min -no_design_rule [get_ports {config_data[12]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -min -no_design_rule [get_ports {config_data[12]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -max -no_design_rule [get_ports {config_data[12]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -max -no_design_rule [get_ports {config_data[12]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -min -no_design_rule [get_ports {config_data[11]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -min -no_design_rule [get_ports {config_data[11]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -max -no_design_rule [get_ports {config_data[11]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -max -no_design_rule [get_ports {config_data[11]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -min -no_design_rule [get_ports {config_data[10]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -min -no_design_rule [get_ports {config_data[10]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -max -no_design_rule [get_ports {config_data[10]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -max -no_design_rule [get_ports {config_data[10]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -min -no_design_rule [get_ports {config_data[9]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -min -no_design_rule [get_ports {config_data[9]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -max -no_design_rule [get_ports {config_data[9]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -max -no_design_rule [get_ports {config_data[9]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -min -no_design_rule [get_ports {config_data[8]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -min -no_design_rule [get_ports {config_data[8]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -max -no_design_rule [get_ports {config_data[8]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -max -no_design_rule [get_ports {config_data[8]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -min -no_design_rule [get_ports {config_data[7]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -min -no_design_rule [get_ports {config_data[7]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -max -no_design_rule [get_ports {config_data[7]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -max -no_design_rule [get_ports {config_data[7]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -min -no_design_rule [get_ports {config_data[6]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -min -no_design_rule [get_ports {config_data[6]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -max -no_design_rule [get_ports {config_data[6]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -max -no_design_rule [get_ports {config_data[6]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -min -no_design_rule [get_ports {config_data[5]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -min -no_design_rule [get_ports {config_data[5]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -max -no_design_rule [get_ports {config_data[5]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -max -no_design_rule [get_ports {config_data[5]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -min -no_design_rule [get_ports {config_data[4]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -min -no_design_rule [get_ports {config_data[4]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -max -no_design_rule [get_ports {config_data[4]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -max -no_design_rule [get_ports {config_data[4]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -min -no_design_rule [get_ports {config_data[3]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -min -no_design_rule [get_ports {config_data[3]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -max -no_design_rule [get_ports {config_data[3]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -max -no_design_rule [get_ports {config_data[3]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -min -no_design_rule [get_ports {config_data[2]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -min -no_design_rule [get_ports {config_data[2]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -max -no_design_rule [get_ports {config_data[2]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -max -no_design_rule [get_ports {config_data[2]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -min -no_design_rule [get_ports {config_data[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -min -no_design_rule [get_ports {config_data[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -max -no_design_rule [get_ports {config_data[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -max -no_design_rule [get_ports {config_data[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -min -no_design_rule [get_ports {config_data[0]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -min -no_design_rule [get_ports {config_data[0]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -max -no_design_rule [get_ports {config_data[0]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -max -no_design_rule [get_ports {config_data[0]}]
set_load -pin_load -max  0.009  [get_ports {config_rdy}]
set_load -pin_load -min  0.009  [get_ports {config_rdy}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -min -no_design_rule [get_ports {config_vld}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -min -no_design_rule [get_ports {config_vld}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -rise -max -no_design_rule [get_ports {config_vld}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -fall -max -no_design_rule [get_ports {config_vld}]
set_max_fanout 20  [get_designs {conv}]
set_max_transition 2.5  [get_designs {conv}]
set_input_delay -add_delay 5 -clock [get_clocks {ideal_clock}] [get_ports {ifmap_weight_data[5]}]
set_input_delay -add_delay 5 -clock [get_clocks {ideal_clock}] [get_ports {config_data[11]}]
set_input_delay -add_delay 5 -clock [get_clocks {ideal_clock}] [get_ports {config_data[1]}]
set_input_delay -add_delay 5 -clock [get_clocks {ideal_clock}] [get_ports {ifmap_weight_data[3]}]
set_input_delay -add_delay 5 -clock [get_clocks {ideal_clock}] [get_ports {config_vld}]
set_input_delay -add_delay 5 -clock [get_clocks {ideal_clock}] [get_ports {ifmap_weight_data[1]}]
set_input_delay -add_delay 5 -clock [get_clocks {ideal_clock}] [get_ports {ifmap_weight_data[15]}]
set_input_delay -add_delay 5 -clock [get_clocks {ideal_clock}] [get_ports {ifmap_weight_data[13]}]
set_input_delay -add_delay 5 -clock [get_clocks {ideal_clock}] [get_ports {ifmap_weight_data[11]}]
set_input_delay -add_delay 5 -clock [get_clocks {ideal_clock}] [get_ports {config_data[8]}]
set_input_delay -add_delay 5 -clock [get_clocks {ideal_clock}] [get_ports {config_data[6]}]
set_input_delay -add_delay 5 -clock [get_clocks {ideal_clock}] [get_ports {ifmap_weight_data[8]}]
set_input_delay -add_delay 5 -clock [get_clocks {ideal_clock}] [get_ports {config_data[14]}]
set_input_delay -add_delay 5 -clock [get_clocks {ideal_clock}] [get_ports {config_data[4]}]
set_input_delay -add_delay 5 -clock [get_clocks {ideal_clock}] [get_ports {ifmap_weight_data[6]}]
set_input_delay -add_delay 5 -clock [get_clocks {ideal_clock}] [get_ports {ifmap_weight_vld}]
set_input_delay -add_delay 5 -clock [get_clocks {ideal_clock}] [get_ports {config_data[12]}]
set_input_delay -add_delay 5 -clock [get_clocks {ideal_clock}] [get_ports {config_data[2]}]
set_input_delay -add_delay 5 -clock [get_clocks {ideal_clock}] [get_ports {ifmap_weight_data[4]}]
set_input_delay -add_delay 5 -clock [get_clocks {ideal_clock}] [get_ports {config_data[10]}]
set_input_delay -add_delay 5 -clock [get_clocks {ideal_clock}] [get_ports {config_data[0]}]
set_input_delay -add_delay 5 -clock [get_clocks {ideal_clock}] [get_ports {ifmap_weight_data[2]}]
set_input_delay -add_delay 5 -clock [get_clocks {ideal_clock}] [get_ports {ifmap_weight_data[0]}]
set_input_delay -add_delay 5 -clock [get_clocks {ideal_clock}] [get_ports {ifmap_weight_data[16]}]
set_input_delay -add_delay 5 -clock [get_clocks {ideal_clock}] [get_ports {ifmap_weight_data[14]}]
set_input_delay -add_delay 5 -clock [get_clocks {ideal_clock}] [get_ports {ifmap_weight_data[12]}]
set_input_delay -add_delay 5 -clock [get_clocks {ideal_clock}] [get_ports {config_data[9]}]
set_input_delay -add_delay 5 -clock [get_clocks {ideal_clock}] [get_ports {ifmap_weight_data[10]}]
set_input_delay -add_delay 5 -clock [get_clocks {ideal_clock}] [get_ports {config_data[7]}]
set_input_delay -add_delay 5 -clock [get_clocks {ideal_clock}] [get_ports {rst_n}]
set_input_delay -add_delay 5 -clock [get_clocks {ideal_clock}] [get_ports {ifmap_weight_data[9]}]
set_input_delay -add_delay 5 -clock [get_clocks {ideal_clock}] [get_ports {ofmap_rdy}]
set_input_delay -add_delay 5 -clock [get_clocks {ideal_clock}] [get_ports {config_data[15]}]
set_input_delay -add_delay 5 -clock [get_clocks {ideal_clock}] [get_ports {config_data[5]}]
set_input_delay -add_delay 5 -clock [get_clocks {ideal_clock}] [get_ports {ifmap_weight_data[7]}]
set_input_delay -add_delay 5 -clock [get_clocks {ideal_clock}] [get_ports {config_data[13]}]
set_input_delay -add_delay 5 -clock [get_clocks {ideal_clock}] [get_ports {config_data[3]}]
set_output_delay -add_delay 0 -clock [get_clocks {ideal_clock}] [get_ports {ofmap_data[11]}]
set_output_delay -add_delay 0 -clock [get_clocks {ideal_clock}] [get_ports {ofmap_data[1]}]
set_output_delay -add_delay 0 -clock [get_clocks {ideal_clock}] [get_ports {ofmap_vld}]
set_output_delay -add_delay 0 -clock [get_clocks {ideal_clock}] [get_ports {ofmap_data[29]}]
set_output_delay -add_delay 0 -clock [get_clocks {ideal_clock}] [get_ports {ofmap_data[27]}]
set_output_delay -add_delay 0 -clock [get_clocks {ideal_clock}] [get_ports {ifmap_weight_rdy}]
set_output_delay -add_delay 0 -clock [get_clocks {ideal_clock}] [get_ports {ofmap_data[25]}]
set_output_delay -add_delay 0 -clock [get_clocks {ideal_clock}] [get_ports {ofmap_data[18]}]
set_output_delay -add_delay 0 -clock [get_clocks {ideal_clock}] [get_ports {ofmap_data[8]}]
set_output_delay -add_delay 0 -clock [get_clocks {ideal_clock}] [get_ports {ofmap_data[30]}]
set_output_delay -add_delay 0 -clock [get_clocks {ideal_clock}] [get_ports {ofmap_data[23]}]
set_output_delay -add_delay 0 -clock [get_clocks {ideal_clock}] [get_ports {ofmap_data[16]}]
set_output_delay -add_delay 0 -clock [get_clocks {ideal_clock}] [get_ports {ofmap_data[6]}]
set_output_delay -add_delay 0 -clock [get_clocks {ideal_clock}] [get_ports {ofmap_data[21]}]
set_output_delay -add_delay 0 -clock [get_clocks {ideal_clock}] [get_ports {ofmap_data[14]}]
set_output_delay -add_delay 0 -clock [get_clocks {ideal_clock}] [get_ports {ofmap_data[4]}]
set_output_delay -add_delay 0 -clock [get_clocks {ideal_clock}] [get_ports {ofmap_data[12]}]
set_output_delay -add_delay 0 -clock [get_clocks {ideal_clock}] [get_ports {ofmap_data[2]}]
set_output_delay -add_delay 0 -clock [get_clocks {ideal_clock}] [get_ports {ofmap_data[10]}]
set_output_delay -add_delay 0 -clock [get_clocks {ideal_clock}] [get_ports {ofmap_data[0]}]
set_output_delay -add_delay 0 -clock [get_clocks {ideal_clock}] [get_ports {ofmap_data[28]}]
set_output_delay -add_delay 0 -clock [get_clocks {ideal_clock}] [get_ports {ofmap_data[26]}]
set_output_delay -add_delay 0 -clock [get_clocks {ideal_clock}] [get_ports {ofmap_data[19]}]
set_output_delay -add_delay 0 -clock [get_clocks {ideal_clock}] [get_ports {ofmap_data[9]}]
set_output_delay -add_delay 0 -clock [get_clocks {ideal_clock}] [get_ports {ofmap_data[31]}]
set_output_delay -add_delay 0 -clock [get_clocks {ideal_clock}] [get_ports {ofmap_data[24]}]
set_output_delay -add_delay 0 -clock [get_clocks {ideal_clock}] [get_ports {ofmap_data[17]}]
set_output_delay -add_delay 0 -clock [get_clocks {ideal_clock}] [get_ports {ofmap_data[7]}]
set_output_delay -add_delay 0 -clock [get_clocks {ideal_clock}] [get_ports {ofmap_data[22]}]
set_output_delay -add_delay 0 -clock [get_clocks {ideal_clock}] [get_ports {ofmap_data[15]}]
set_output_delay -add_delay 0 -clock [get_clocks {ideal_clock}] [get_ports {ofmap_data[5]}]
set_output_delay -add_delay 0 -clock [get_clocks {ideal_clock}] [get_ports {config_rdy}]
set_output_delay -add_delay 0 -clock [get_clocks {ideal_clock}] [get_ports {ofmap_data[20]}]
set_output_delay -add_delay 0 -clock [get_clocks {ideal_clock}] [get_ports {ofmap_data[13]}]
set_output_delay -add_delay 0 -clock [get_clocks {ideal_clock}] [get_ports {ofmap_data[3]}]
