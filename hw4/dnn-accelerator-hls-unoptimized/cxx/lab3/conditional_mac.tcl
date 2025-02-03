##
## Copyright 2003-2019 Siemens
##
#------------------------------------------------------------
# Basic Training: C++: Lab3 conditional acc
#------------------------------------------------------------

# Establish the location of this script and use it to reference all
# other files in this example
set sfd [file dirname [info script]]

options defaults

project new

flow package require /SCVerify
flow package option set /SCVerify/USE_CCS_BLOCK true

# Read Design Files
solution file add [file join $sfd conditional_mac/test_orig.cpp] -type C++
solution file add [file join $sfd conditional_mac/test.cpp] -type C++ 
solution file add [file join $sfd conditional_mac/tb.cpp] -type C++ -exclude true
go compile 

# Load Libraries
solution library add nangate-45nm_beh -- -rtlsyntool OasysRTL
go libraries

directive set -CLOCKS {clk {-CLOCK_PERIOD 1.0 }}
go assembly

