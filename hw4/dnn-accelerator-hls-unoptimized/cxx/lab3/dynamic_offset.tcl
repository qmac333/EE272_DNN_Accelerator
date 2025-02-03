##
## Copyright 2003-2019 Siemens
##
#------------------------------------------------------------
# Basic Training: C++: Lab3 Dynamic offset
#------------------------------------------------------------

# Establish the location of this script and use it to reference all
# other files in this example
set sfd [file dirname [info script]]

options defaults

project new

# Read Design Files
solution file add [file join $sfd dynamic_offset/test_orig.cpp]
solution file add [file join $sfd dynamic_offset/tb.cpp] -exclude true
solution file add [file join $sfd dynamic_offset/test.cpp] -exclude true
go compile

# Load Libraries
solution library add nangate-45nm_beh -- -rtlsyntool OasysRTL -vendor Nangate -technology 045nm
go libraries

directive set -CLOCKS {clk {-CLOCK_PERIOD 2 }}
go assembly

# Pipeline the Design and Generate RTL Netlist
directive set /test_orig_wrapper/core/main -PIPELINE_INIT_INTERVAL 1
go extract

