# Unpublished Work. Copyright 2019 Siemens
go new
set sfd [file dirname [info script]]

# Read Design Files
solution file add [file join $sfd conditional_mac test_orig.cpp] -exclude true
solution file add [file join $sfd conditional_mac test.cpp] -exclude false
go compile

# Load Libraries
solution library add nangate-45nm_beh 
directive set -CLOCKS {clk {-CLOCK_PERIOD 2 }}
go assembly

# Pipeline the Design and Generate RTL Netlist
directive set /test/core/main -PIPELINE_INIT_INTERVAL 1
directive set /test/core/main/MAC -UNROLL yes
go extract

# Flag to indicate SCVerify readiness
set can_simulate 0
