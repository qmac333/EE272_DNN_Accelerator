##
## Copyright 2003-2019 Siemens
##
#------------------------------------------------------------
# Basic Training: C++: Lab7 run all 
#------------------------------------------------------------

# Establish the location of this script and use it to reference all
# other files in this example
set sfd [file dirname [info script]]

# Setup Environment
options defaults
options set Input/CppStandard c++11

project new

flow package require /SCVerify
flow package option set /SCVerify/USE_NCSIM true
flow package option set /SCVerify/USE_VCS true
flow package option set /SCVerify/USE_CCS_BLOCK true

# Read Design Files
solution file add [file join $sfd mem_block_orig.h] -type CHEADER -exclude true
solution file add [file join $sfd tb_orig.cpp] -type C++ -exclude true
solution file add [file join $sfd mem_block_ref.h] -type CHEADER
go compile

# Load Libraries
solution library add nangate-45nm_beh -- -rtlsyntool OasysRTL
solution library add ccs_sample_mem 
directive set -CLOCKS {clk {-CLOCK_PERIOD 3.34 } }
go assembly

# Apply Loop Constraints
directive set /mem_block_ref::run/run/main -PIPELINE_INIT_INTERVAL 1
go architect 

# Ignore write before read dependencies
#ignore_memory_precedences -from write_mem(mem:rsc.@) -to *if:read_mem(mem:rsc.@)
dofile [file join $sfd ignore_mem_err.tcl]
go allocate

# Generate RTL Netlist
go extract
