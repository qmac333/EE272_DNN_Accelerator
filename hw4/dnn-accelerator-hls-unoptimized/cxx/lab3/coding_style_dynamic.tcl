# Unpublished Work. Copyright 2019 Siemens
go new
set sfd [file dirname [info script]]

# Read Design Files
solution file add [file join $sfd dynamic_offset test_orig.cpp] -exclude true
solution file add [file join $sfd dynamic_offset test.cpp] -exclude false
solution file add [file join $sfd dynamic_offset tb.cpp] -exclude true
go compile

# Load Libraries
solution library add nangate-45nm_beh 
directive set -CLOCKS {clk {-CLOCK_PERIOD 2 }}
go assembly

# Pipeline the Design and Generate RTL Netlist
directive set /test_wrapper/core/main -PIPELINE_INIT_INTERVAL 1
go extract

# Flag to indicate SCVerify readiness
set can_simulate 0
