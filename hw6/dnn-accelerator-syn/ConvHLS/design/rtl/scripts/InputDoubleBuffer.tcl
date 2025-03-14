set blockname [file rootname [file tail [info script] ]]

source scripts/common.tcl

directive set -DESIGN_HIERARCHY " 
    {InputDoubleBuffer<4096, ${ARRAY_DIMENSION}, ${ARRAY_DIMENSION}>} 
"

go compile

source scripts/set_libraries.tcl

go libraries
directive set -CLOCKS $clocks

go assembly

# -------------------------------
# Set the correct word widths and the stage replication
# Your code starts here
# -------------------------------
#return -code error "Remove this once implemented."
directive set /InputDoubleBuffer<4096,${ARRAY_DIMENSION},${ARRAY_DIMENSION}>/InputDoubleBufferReader<4096,${ARRAY_DIMENSION},${ARRAY_DIMENSION}>/din -WORD_WIDTH [expr ${ARRAY_DIMENSION} * 8]
directive set /InputDoubleBuffer<4096,${ARRAY_DIMENSION},${ARRAY_DIMENSION}>/InputDoubleBufferWriter<4096,${ARRAY_DIMENSION},${ARRAY_DIMENSION}>/dout -WORD_WIDTH [expr ${ARRAY_DIMENSION} * 8]
directive set /InputDoubleBuffer<4096,${ARRAY_DIMENSION},${ARRAY_DIMENSION}>/mem:cns -STAGE_REPLICATION 2
directive set /InputDoubleBuffer<4096,${ARRAY_DIMENSION},${ARRAY_DIMENSION}>/mem -WORD_WIDTH [expr ${ARRAY_DIMENSION} * 8]
directive set /InputDoubleBuffer<4096,${ARRAY_DIMENSION},${ARRAY_DIMENSION}>/InputDoubleBufferReader<4096,${ARRAY_DIMENSION},${ARRAY_DIMENSION}>/run/tmp.data.value -WORD_WIDTH [expr ${ARRAY_DIMENSION} * 8]
directive set /InputDoubleBuffer<4096,${ARRAY_DIMENSION},${ARRAY_DIMENSION}>/InputDoubleBufferWriter<4096,${ARRAY_DIMENSION},${ARRAY_DIMENSION}>/run/tmp.data.value -WORD_WIDTH [expr ${ARRAY_DIMENSION} * 8]
# directive set /InputDoubleBuffer<4096,${ARRAY_DIMENSION},${ARRAY_DIMENSION}>/mem:cns -MAP_TO_MODULE sram_4096_128_db.sram_4096_128_db
# directive set /InputDoubleBuffer<4096,${ARRAY_DIMENSION},${ARRAY_DIMENSION}>/.../tmp.data.value:rsc -match glob -MAP_TO_MODULE sram_4096_128_db.sram_4096_128_db
# -------------------------------
# Your code ends here
# -------------------------------

go architect

go allocate
go extract
