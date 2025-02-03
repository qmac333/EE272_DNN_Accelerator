##
## Copyright 2003-2019 Siemens
##
#------------------------------------------------------------
# Basic Training: C++: Lab6  Run shared memory 
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
flow package option set /SCVerify/DISABLE_EMPTY_INPUTS true
flow package option set /SCVerify/USE_CCS_BLOCK true

# Read Design Files
solution file add [file join $sfd test.h] -type CHEADER
solution file add [file join $sfd tb.cpp] -type C++ -exclude true
go analyze
solution design set top -block
solution design set readWriteBlock -block
solution design set sharedMem -top
go compile

# Load Libraries
solution library add nangate-45nm_beh -- -rtlsyntool OasysRTL
solution library add ccs_sample_mem 
directive set -CLOCKS {clk {-CLOCK_PERIOD 3.33}}
go assembly

# Apply Constraints
directive set /sharedMem/run/main -PIPELINE_INIT_INTERVAL 1
#directive set /top::run/sharedMem::run/run/main -PIPELINE_INIT_INTERVAL 1
#directive set /top::run/readWriteBlock::run/run/main -PIPELINE_INIT_INTERVAL 1
go architect

# Ignore Write before Read 

directive set /sharedMem/run/if#4:io_write(rd_data0)/if#4:read_mem(mem:rsc.@) \
                        -IGNORE_DEPENDENCY_FROM {if#5:write_mem(mem:rsc.@) else#5:if:write_mem(mem:rsc.@)}
directive set /sharedMem/run/else#4:if:io_write(rd_data1)/else#4:if:read_mem(mem:rsc.@) \
                        -IGNORE_DEPENDENCY_FROM {if#5:write_mem(mem:rsc.@) else#5:if:write_mem(mem:rsc.@)}
go allocate

# Generate RTL Netlist
go extract

