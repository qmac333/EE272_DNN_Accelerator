##
## Copyright 2003-2019 Siemens
##
#------------------------------------------------------------
# Basic Training: C++: Lab5 Multiple Blocks
#------------------------------------------------------------

# Establish the location of this script and use it to reference all
# other files in this example
set sfd [file dirname [info script]]

# Setup Environment
options defaults
options set /ComponentLibs/SearchPath $sfd -append

project new

flow package require /SCVerify
flow package option set /SCVerify/USE_NCSIM true
flow package option set /SCVerify/USE_VCS true
flow package option set /SCVerify/USE_CCS_BLOCK true

# Read Design Files
solution file add [file join $sfd test_multi_block.h] -type CHEADER
solution file add [file join $sfd tb.cpp] -type C++
go analyze

directive set -DESIGN_HIERARCHY {{matrixMultiplyTop<8, 8>} {matrixMultiplyTop<8, 8>::run} {transpose<8, 8>::run} {transpose<8, 8>} {matrixMultiply<8, 8>::run} {matrixMultiply<8, 8>} {matrixMultiplyTop<8, 8>::run} {transpose<8, 8>::run} {transpose<8, 8>} {matrixMultiply<8, 8>::run} {matrixMultiply<8, 8>} {matrixMultiplyTop<8, 8>}}
go compile

# Load Libraries
solution library add nangate-45nm_beh -- -rtlsyntool OasysRTL -vendor Nangate -technology 045nm
solution library add ram_nangate-45nm-singleport_beh
solution library add SPRAM_MASK
go libraries

directive set -CLOCKS {clk {-CLOCK_PERIOD 3.33}}
go assembly

# Apply Constraints
directive set /matrixMultiplyTop<8,8>::run/A -WORD_WIDTH 64
directive set /matrixMultiplyTop<8,8>::run/A -WORD_WIDTH 64
directive set /matrixMultiplyTop<8,8>::run/B_mem -WORD_WIDTH 64
directive set /matrixMultiplyTop<8,8>::run/B_mem:cns -STAGE_REPLICATION 2
directive set /matrixMultiplyTop<8,8>::run/B_mem:cns -MAP_TO_MODULE {SPRAM_MASK.SPRAM_MASK num_byte_enables=8}

directive set /matrixMultiplyTop<8,8>::run/matrixMultiply<8,8>::run/A -WORD_WIDTH 64
directive set /matrixMultiplyTop<8,8>::run/matrixMultiply<8,8>::run/run/main -PIPELINE_INIT_INTERVAL 1
directive set /matrixMultiplyTop<8,8>::run/matrixMultiply<8,8>::run/run/main/ROW/COPY_ROW -UNROLL yes
directive set /matrixMultiplyTop<8,8>::run/matrixMultiply<8,8>::run/run/MAC -UNROLL yes

directive set /matrixMultiplyTop<8,8>::run/transpose<8,8>::run/run/main -PIPELINE_INIT_INTERVAL 1
directive set /matrixMultiplyTop<8,8>::run/transpose<8,8>::run/run/TRANSPOSEB_ROW -PIPELINE_INIT_INTERVAL 1
directive set /matrixMultiplyTop<8,8>::run/transpose<8,8>::run/run/TRANSPOSEB_COL -UNROLL no
go architect

# Generate RTL Netlist
go extract

