##
## Copyright 2003-2019 Siemens
##
#------------------------------------------------------------
# Basic Training: C++: Lab2 Enable Stalling 
#------------------------------------------------------------

set sfd [file dirname [info script]]

options defaults
options set /Input/CppStandard c++11

project new

flow package require /SCVerify
flow package option set /SCVerify/USE_CCS_BLOCK true
flow package option set /SCVerify/USE_NCSIM true
flow package option set /SCVerify/USE_VCS true

# Read Design Files
solution file add [file join $sfd tb.cpp] -type C++ -exclude true -args -DSTALL
solution file add [file join $sfd mult_add_pipeline_ref.cpp] -type C++ -exclude true
solution file add [file join $sfd mult_add_pipeline.cpp] -type C++
go compile

# Load Libraries
solution library add nangate-45nm_beh -- -rtlsyntool OasysRTL
go libraries

directive set -CLOCKS {clk {-CLOCK_PERIOD 1.11 }}
go assembly

# Apply IO and Loop Constraints
directive set /mult_add_pipeline/a:rsc -MAP_TO_MODULE ccs_ioport.ccs_in_wait
directive set /mult_add_pipeline/b:rsc -MAP_TO_MODULE ccs_ioport.ccs_in_wait
directive set /mult_add_pipeline/c:rsc -MAP_TO_MODULE ccs_ioport.ccs_in_wait
directive set /mult_add_pipeline/gain:rsc        -MAP_TO_MODULE ccs_ioport.ccs_in
directive set /mult_add_pipeline/gain_adjust:rsc -MAP_TO_MODULE ccs_ioport.ccs_in
directive set /mult_add_pipeline/result:rsc      -MAP_TO_MODULE ccs_ioport.ccs_out_wait

directive set /mult_add_pipeline/core/main -PIPELINE_INIT_INTERVAL 1
directive set /mult_add_pipeline/core/main -PIPELINE_STALL_MODE stall
directive set /mult_add_pipeline/core -DESIGN_GOAL area
go architect

# Generate RTL Netlist
go extract

