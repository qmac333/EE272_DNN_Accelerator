##
## Copyright 2003-2019 Siemens
##
#------------------------------------------------------------
# Basic Training: C++: Lab5 Single Block
#------------------------------------------------------------

# Establish the location of this script and use it to reference all
# other files in this example
set sfd [file dirname [info script]]

# Setup Environment
options defaults

project new

flow package require /SCVerify
flow package option set /SCVerify/USE_NCSIM true
flow package option set /SCVerify/USE_VCS true
flow package option set /SCVerify/USE_CCS_BLOCK true

# Read Design Files
solution file add [file join $sfd test_single_block.h] -type CHEADER
solution file add [file join $sfd tb_single_block.cpp] -type C++ -exclude true
go compile

# Load Libraries
solution library add nangate-45nm_beh -- -rtlsyntool OasysRTL
solution library add ccs_sample_mem 
directive set -CLOCKS {clk {-CLOCK_PERIOD 3.33 }}
go assembly

# Apply Constraints
directive set /matrixMultiply<8,8>::run/run/B_transpose:rsc -MAP_TO_MODULE ccs_sample_mem.ccs_ram_sync_singleport
go architect

# Generate the RTL Netlist
go extract

