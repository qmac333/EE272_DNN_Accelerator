##
## Copyright 2003-2019 Siemens
##
#------------------------------------------------------------
# Basic Training: C++: Lab4 Memory Merge
#------------------------------------------------------------

# Establish the location of this script and use it to reference all
# other files in this example
set sfd [file dirname [info script]]

# Setup environment
options defaults

project new

flow package require /SCVerify
flow package option set /SCVerify/USE_CCS_BLOCK true
flow package option set /SCVerify/USE_NCSIM true
flow package option set /SCVerify/USE_VCS true

# Read Design Files
solution file add [file join $sfd test.cpp] -type C++
solution file add [file join $sfd tb.cpp] -type C++ -exclude true
go compile

# Load Libraries
solution library add nangate-45nm_beh -- -rtlsyntool OasysRTL
solution library add ccs_sample_mem 
go libraries

directive set -CLOCKS {clk {-CLOCK_PERIOD 3.33}}

# Solution 1: Pipeline top level design
go assembly
directive set /test/core/main -PIPELINE_INIT_INTERVAL 1
go extract

# Solution 2: Unroll loop 4x and widen memory by 4
go assembly
directive set /test/coeffs -WORD_WIDTH 28
directive set /test/core/main/MAC -UNROLL yes
go extract

# Solution 3: Interleave memory by 4
go assembly
directive set /test/coeffs -WORD_WIDTH 7
directive set /test/coeffs:rsc -INTERLEAVE 4
go extract
