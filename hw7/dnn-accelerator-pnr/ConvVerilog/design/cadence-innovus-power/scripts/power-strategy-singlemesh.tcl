#=========================================================================
# power-strategy-singlemesh.tcl
#=========================================================================
# This script implements a single power mesh on the upper metal layers.
# Note that M2 is expected to be vertical, and the lower metal layer of
# the power mesh is expected to be horizontal.
#
# Author : Christopher Torng
# Date   : January 20, 2019

#-------------------------------------------------------------------------
# Stdcell power rail preroute
#-------------------------------------------------------------------------
# Generate horizontal stdcell preroutes

sroute -nets {VDD VSS}

#-------------------------------------------------------------------------
# Shorter names from the ADK
#-------------------------------------------------------------------------

set pmesh_bot $ADK_POWER_MESH_BOT_LAYER
set pmesh_top $ADK_POWER_MESH_TOP_LAYER

#-------------------------------------------------------------------------
# Power ring
#-------------------------------------------------------------------------

addRing -nets {VDD VSS} -type core_rings -follow core   \
        -layer [list top  $pmesh_top bottom $pmesh_top  \
                     left $pmesh_bot right  $pmesh_bot] \
        -width $savedvars(p_ring_width)                 \
        -spacing $savedvars(p_ring_spacing)             \
        -offset $savedvars(p_ring_spacing)              \
        -extend_corner {tl tr bl br lt lb rt rb}

selectInst weight_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_0__sram 
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer met5 -stacked_via_bottom_layer met4 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
addRing -nets {VDD VSS} -type block_rings -around selected -layer {top met5 bottom met5 left met4 right met4} -width {top 1.8 bottom 1.8 left 1.8 right 1.8} -spacing {top 1.8 bottom 1.8 left 1.8 right 1.8} -offset {top 1.8 bottom 1.8 left 1.8 right 1.8} -center 0 -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None
 
selectInst weight_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_1__sram
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer met5 -stacked_via_bottom_layer met4 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
addRing -nets {VDD VSS} -type block_rings -around selected -layer {top met5 bottom met5 left met4 right met4} -width {top 1.8 bottom 1.8 left 1.8 right 1.8} -spacing {top 1.8 bottom 1.8 left 1.8 right 1.8} -offset {top 1.8 bottom 1.8 left 1.8 right 1.8} -center 0 -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None

selectInst ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_0__sram
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer met5 -stacked_via_bottom_layer met4 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
addRing -nets {VDD VSS} -type block_rings -around selected -layer {top met5 bottom met5 left met4 right met4} -width {top 1.8 bottom 1.8 left 1.8 right 1.8} -spacing {top 1.8 bottom 1.8 left 1.8 right 1.8} -offset {top 1.8 bottom 1.8 left 1.8 right 1.8} -center 0 -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None

selectInst ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_1__sram
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer met5 -stacked_via_bottom_layer met4 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
addRing -nets {VDD VSS} -type block_rings -around selected -layer {top met5 bottom met5 left met4 right met4} -width {top 1.8 bottom 1.8 left 1.8 right 1.8} -spacing {top 1.8 bottom 1.8 left 1.8 right 1.8} -offset {top 1.8 bottom 1.8 left 1.8 right 1.8} -center 0 -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None

selectInst ofmap_buffer_inst/ram0/genblk1_width_macro_0__sram
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer met5 -stacked_via_bottom_layer met4 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
addRing -nets {VDD VSS} -type block_rings -around selected -layer {top met5 bottom met5 left met4 right met4} -width {top 1.8 bottom 1.8 left 1.8 right 1.8} -spacing {top 1.8 bottom 1.8 left 1.8 right 1.8} -offset {top 1.8 bottom 1.8 left 1.8 right 1.8} -center 0 -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None

selectInst ofmap_buffer_inst/ram0/genblk1_width_macro_1__sram
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer met5 -stacked_via_bottom_layer met4 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
addRing -nets {VDD VSS} -type block_rings -around selected -layer {top met5 bottom met5 left met4 right met4} -width {top 1.8 bottom 1.8 left 1.8 right 1.8} -spacing {top 1.8 bottom 1.8 left 1.8 right 1.8} -offset {top 1.8 bottom 1.8 left 1.8 right 1.8} -center 0 -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None

selectInst ofmap_buffer_inst/ram0/genblk1_width_macro_2__sram
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer met5 -stacked_via_bottom_layer met4 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
addRing -nets {VDD VSS} -type block_rings -around selected -layer {top met5 bottom met5 left met4 right met4} -width {top 1.8 bottom 1.8 left 1.8 right 1.8} -spacing {top 1.8 bottom 1.8 left 1.8 right 1.8} -offset {top 1.8 bottom 1.8 left 1.8 right 1.8} -center 0 -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None

selectInst ofmap_buffer_inst/ram0/genblk1_width_macro_3__sram
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer met5 -stacked_via_bottom_layer met4 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
addRing -nets {VDD VSS} -type block_rings -around selected -layer {top met5 bottom met5 left met4 right met4} -width {top 1.8 bottom 1.8 left 1.8 right 1.8} -spacing {top 1.8 bottom 1.8 left 1.8 right 1.8} -offset {top 1.8 bottom 1.8 left 1.8 right 1.8} -center 0 -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None

selectInst ofmap_buffer_inst/ram1/genblk1_width_macro_0__sram
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer met5 -stacked_via_bottom_layer met4 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
addRing -nets {VDD VSS} -type block_rings -around selected -layer {top met5 bottom met5 left met4 right met4} -width {top 1.8 bottom 1.8 left 1.8 right 1.8} -spacing {top 1.8 bottom 1.8 left 1.8 right 1.8} -offset {top 1.8 bottom 1.8 left 1.8 right 1.8} -center 0 -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None

selectInst ofmap_buffer_inst/ram1/genblk1_width_macro_1__sram
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer met5 -stacked_via_bottom_layer met4 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
addRing -nets {VDD VSS} -type block_rings -around selected -layer {top met5 bottom met5 left met4 right met4} -width {top 1.8 bottom 1.8 left 1.8 right 1.8} -spacing {top 1.8 bottom 1.8 left 1.8 right 1.8} -offset {top 1.8 bottom 1.8 left 1.8 right 1.8} -center 0 -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None

selectInst ofmap_buffer_inst/ram1/genblk1_width_macro_2__sram
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer met5 -stacked_via_bottom_layer met4 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
addRing -nets {VDD VSS} -type block_rings -around selected -layer {top met5 bottom met5 left met4 right met4} -width {top 1.8 bottom 1.8 left 1.8 right 1.8} -spacing {top 1.8 bottom 1.8 left 1.8 right 1.8} -offset {top 1.8 bottom 1.8 left 1.8 right 1.8} -center 0 -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None

selectInst ofmap_buffer_inst/ram1/genblk1_width_macro_3__sram
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer met5 -stacked_via_bottom_layer met4 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
addRing -nets {VDD VSS} -type block_rings -around selected -layer {top met5 bottom met5 left met4 right met4} -width {top 1.8 bottom 1.8 left 1.8 right 1.8} -spacing {top 1.8 bottom 1.8 left 1.8 right 1.8} -offset {top 1.8 bottom 1.8 left 1.8 right 1.8} -center 0 -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None

#-------------------------------------------------------------------------
# Power mesh bottom settings (vertical)
#-------------------------------------------------------------------------
# - pmesh_bot_str_width            : 8X thickness compared to 3 * M1 width
# - pmesh_bot_str_pitch            : Arbitrarily choosing the stripe pitch
# - pmesh_bot_str_intraset_spacing : Space between VSS/VDD, choosing
#                                    constant pitch across VSS/VDD stripes
# - pmesh_bot_str_interset_pitch   : Pitch between same-signal stripes

# Get M1 min width and signal routing pitch as defined in the LEF

set M1_min_width    [dbGet [dbGetLayerByZ 2].minWidth]
set M1_route_pitchX [dbGet [dbGetLayerByZ 2].pitchX]

# Bottom stripe params

set pmesh_bot_str_width [expr  8 *  3 * $M1_min_width   ]
set pmesh_bot_str_pitch [expr 4 * 10 * $M1_route_pitchX]

set pmesh_bot_str_intraset_spacing [expr $pmesh_bot_str_pitch - $pmesh_bot_str_width]
set pmesh_bot_str_interset_pitch   [expr 4*$pmesh_bot_str_pitch]

setViaGenMode -reset
setViaGenMode -viarule_preference default
setViaGenMode -ignore_DRC false

setAddStripeMode -reset
setAddStripeMode -stacked_via_bottom_layer met1 \
                 -stacked_via_top_layer    $pmesh_top\
                 -break_at {  block_ring  } 
# Add the stripes
#
# Use -start to offset the stripes slightly away from the core edge.
# Allow same-layer jogs to connect stripes to the core ring if some
# blockage is in the way (e.g., connections from core ring to pads).
# Restrict any routing around blockages to use only layers for power.

addStripe -nets {VSS VDD} -layer $pmesh_bot -direction vertical \
    -width $pmesh_bot_str_width                                 \
    -spacing $pmesh_bot_str_intraset_spacing                    \
    -set_to_set_distance $pmesh_bot_str_interset_pitch          \
    -max_same_layer_jog_length $pmesh_bot_str_pitch             \
    -padcore_ring_bottom_layer_limit $pmesh_bot                 \
    -padcore_ring_top_layer_limit $pmesh_top                    \
    -start [expr 2*$pmesh_bot_str_pitch]

#-------------------------------------------------------------------------
# Power mesh top settings (horizontal)
#-------------------------------------------------------------------------
# - pmesh_top_str_width            : 8X thickness compared to 3 * M1 width
# - pmesh_top_str_pitch            : Arbitrarily choosing the stripe pitch
# - pmesh_top_str_intraset_spacing : Space between VSS/VDD, choosing
#                                    constant pitch across VSS/VDD stripes
# - pmesh_top_str_interset_pitch   : Pitch between same-signal stripes

set pmesh_top_str_width [expr  8 *  3 * $M1_min_width   ]
set pmesh_top_str_pitch [expr 4 * 10 * $M1_route_pitchX]

set pmesh_top_str_intraset_spacing [expr $pmesh_top_str_pitch - $pmesh_top_str_width]
set pmesh_top_str_interset_pitch   [expr 4*$pmesh_top_str_pitch]

setViaGenMode -reset
setViaGenMode -viarule_preference default
setViaGenMode -ignore_DRC false

setAddStripeMode -reset
setAddStripeMode -stacked_via_bottom_layer $pmesh_bot \
                 -stacked_via_top_layer    $pmesh_top \
                 -break_at {  block_ring  } 
# Add the stripes
#
# Use -start to offset the stripes slightly away from the core edge.
# Allow same-layer jogs to connect stripes to the core ring if some
# blockage is in the way (e.g., connections from core ring to pads).
# Restrict any routing around blockages to use only layers for power.

addStripe -nets {VSS VDD} -layer $pmesh_top -direction horizontal \
    -width $pmesh_top_str_width                                   \
    -spacing $pmesh_top_str_intraset_spacing                      \
    -set_to_set_distance $pmesh_top_str_interset_pitch            \
    -max_same_layer_jog_length $pmesh_top_str_pitch               \
    -padcore_ring_bottom_layer_limit $pmesh_bot                   \
    -padcore_ring_top_layer_limit $pmesh_top                      \
    -block_ring_bottom_layer_limit met4                           \
    -start [expr $pmesh_top_str_pitch]


# Route power to power pins on the macro

deselectAll

# selectInst weight_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_0__sram
# sroute -connect {blockPin} -layerChangeRange {met1 met5} -blockPinTarget { nearestTarget } -nets {VDD VSS} -allowLayerChange 1 -blockPin useLef -inst weight_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_0__sram

# selectInst weight_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_1__sram
# sroute -connect {blockPin} -layerChangeRange {met1 met5} -blockPinTarget { nearestTarget } -nets {VDD VSS} -allowLayerChange 1 -blockPin useLef -inst weight_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_1__sram

# selectInst ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_0__sram
# sroute -connect {blockPin} -layerChangeRange {met1 met5} -blockPinTarget { nearestTarget } -nets {VDD VSS} -allowLayerChange 1 -blockPin useLef -inst ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_0__sram

# selectInst ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_1__sram
# sroute -connect {blockPin} -layerChangeRange {met1 met5} -blockPinTarget { nearestTarget } -nets {VDD VSS} -allowLayerChange 1 -blockPin useLef -inst ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_1__sram

# selectInst ofmap_buffer_inst/ram0/genblk1_width_macro_0__sram 
# sroute -connect {blockPin} -layerChangeRange {met1 met5} -blockPinTarget { nearestTarget } -nets {VDD VSS} -allowLayerChange 1 -blockPin useLef -inst ofmap_buffer_inst/ram0/genblk1_width_macro_0__sram

# selectInst ofmap_buffer_inst/ram0/genblk1_width_macro_1__sram
# sroute -connect {blockPin} -layerChangeRange {met1 met5} -blockPinTarget { nearestTarget } -nets {VDD VSS} -allowLayerChange 1 -blockPin useLef -inst ofmap_buffer_inst/ram0/genblk1_width_macro_1__sram

# selectInst ofmap_buffer_inst/ram0/genblk1_width_macro_2__sram
# sroute -connect {blockPin} -layerChangeRange {met1 met5} -blockPinTarget { nearestTarget } -nets {VDD VSS} -allowLayerChange 1 -blockPin useLef -inst ofmap_buffer_inst/ram0/genblk1_width_macro_2__sram

# selectInst ofmap_buffer_inst/ram0/genblk1_width_macro_3__sram
# sroute -connect {blockPin} -layerChangeRange {met1 met5} -blockPinTarget { nearestTarget } -nets {VDD VSS} -allowLayerChange 1 -blockPin useLef -inst ofmap_buffer_inst/ram0/genblk1_width_macro_3__sram

# selectInst ofmap_buffer_inst/ram1/genblk1_width_macro_0__sram
# sroute -connect {blockPin} -layerChangeRange {met1 met5} -blockPinTarget { nearestTarget } -nets {VDD VSS} -allowLayerChange 1 -blockPin useLef -inst ofmap_buffer_inst/ram1/genblk1_width_macro_0__sram

# selectInst ofmap_buffer_inst/ram1/genblk1_width_macro_1__sram
# sroute -connect {blockPin} -layerChangeRange {met1 met5} -blockPinTarget { nearestTarget } -nets {VDD VSS} -allowLayerChange 1 -blockPin useLef -inst ofmap_buffer_inst/ram1/genblk1_width_macro_1__sram

# selectInst ofmap_buffer_inst/ram1/genblk1_width_macro_2__sram
# sroute -connect {blockPin} -layerChangeRange {met1 met5} -blockPinTarget { nearestTarget } -nets {VDD VSS} -allowLayerChange 1 -blockPin useLef -inst ofmap_buffer_inst/ram1/genblk1_width_macro_2__sram

# selectInst ofmap_buffer_inst/ram1/genblk1_width_macro_3__sram
# sroute -connect {blockPin} -layerChangeRange {met1 met5} -blockPinTarget { nearestTarget } -nets {VDD VSS} -allowLayerChange 1 -blockPin useLef -inst ofmap_buffer_inst/ram1/genblk1_width_macro_3__sram

sroute -connect {blockPin} -layerChangeRange {met1 met5} \
       -blockPinTarget { nearestTarget } -nets {VDD VSS} \
       -allowLayerChange 1 -blockPin useLef -inst {ofmap_buffer_inst/ram0/genblk1_width_macro_0__sram \
                                                    ofmap_buffer_inst/ram0/genblk1_width_macro_1__sram \
                                                    ofmap_buffer_inst/ram0/genblk1_width_macro_2__sram \
                                                    ofmap_buffer_inst/ram0/genblk1_width_macro_3__sram \
                                                    ofmap_buffer_inst/ram1/genblk1_width_macro_0__sram \
                                                    ofmap_buffer_inst/ram1/genblk1_width_macro_1__sram \
                                                    ofmap_buffer_inst/ram1/genblk1_width_macro_2__sram \
                                                    ofmap_buffer_inst/ram1/genblk1_width_macro_3__sram \
                                                    weight_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_0__sram \
                                                    weight_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_1__sram \
                                                    ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_0__sram \
                                                    ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_1__sram}

editTrim -nets {VDD VSS}

