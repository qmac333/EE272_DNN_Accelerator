#=========================================================================
# pin-assignments.tcl
#=========================================================================
# The ports of this design become physical pins along the perimeter of the
# design. The commands below will spread the pins along the left and right
# perimeters of the core area. This will work for most designs, but a
# detail-oriented project should customize or replace this section.
#
# Author : Christopher Torng
# Date   : March 26, 2018

#-------------------------------------------------------------------------
# Pin Assignments
#-------------------------------------------------------------------------

# Here pin assignments are done keeping in mind the location of the SRAM pins
# If you update pin assignments below you should rerun the pin-placement step 
# before re-running init step

# We are assigning pins clockwise here, starting from the top side we go left
# to right, then on the right side we go top to bottom, then on the bottom
# side, we go right to left, then on the left side we go bottom to top.

# Pins on the top side. The first pin in this list (here dout1[31]) is on the
# top left and the last pin is on the top right.

set pins_top {\
   rst_n \
   ifmap_weight_rdy \
   ifmap_weight_vld \
   ofmap_rdy \
   clk \
   ofmap_vld \
   config_rdy \
   config_vld \
}

# Pins on the right side. In this example we are not placing pins on the right
# side, since we haven't routed out the pins on the right side of the SRAM. In
# your design, you can use the right side as well.

set pins_right {\
  {ofmap_data[31]} {ofmap_data[30]} {ofmap_data[29]} {ofmap_data[28]} {ofmap_data[27]} {ofmap_data[26]} \
  {ofmap_data[25]} {ofmap_data[24]} {ofmap_data[23]} {ofmap_data[22]} {ofmap_data[21]} {ofmap_data[20]} \
  {ofmap_data[19]} {ofmap_data[18]} {ofmap_data[17]} {ofmap_data[16]} {ofmap_data[15]} {ofmap_data[14]} \
  {ofmap_data[13]} {ofmap_data[12]} {ofmap_data[11]} {ofmap_data[10]} {ofmap_data[9]}  {ofmap_data[8]} \
  {ofmap_data[7]}  {ofmap_data[6]}  {ofmap_data[5]}  {ofmap_data[4]}  {ofmap_data[3]}  {ofmap_data[2]} \
  {ofmap_data[1]}  {ofmap_data[0]}\
  }

# Pins on the bottom side from right (dout0[0]) to left (din0[31]). I list pins
# out explicitly here because the dout0 and din0 pins on the SRAM macro are
# interleaved somewhat randomly, but if in your case the pins of the same bus
# are to be kept together then you can generate this pin list using a tcl for
# loop.

set pins_bottom []

# Pins on the left side from bottom (rst_n) to top (addr0[0]).

set pins_left {\
  {ifmap_weight_data[15]} {ifmap_weight_data[14]} {ifmap_weight_data[13]} {ifmap_weight_data[12]} \
  {ifmap_weight_data[11]} {ifmap_weight_data[10]} {ifmap_weight_data[9]}  {ifmap_weight_data[8]}  \
  {ifmap_weight_data[7]}  {ifmap_weight_data[6]}  {ifmap_weight_data[5]}  {ifmap_weight_data[4]}  \
  {ifmap_weight_data[3]}  {ifmap_weight_data[2]}  {ifmap_weight_data[1]}  {ifmap_weight_data[0]}  \
  {config_data[15]}       {config_data[14]}       {config_data[13]}       {config_data[12]}       \
  {config_data[11]}       {config_data[10]}       {config_data[9]}        {config_data[8]}        \
  {config_data[7]}        {config_data[6]}        {config_data[5]}        {config_data[4]}        \
  {config_data[3]}        {config_data[2]}        {config_data[1]}        {config_data[0]}\
}


# Spread the pins evenly along the sides of the block

editPin -layer met3 -pin $pins_right  -side RIGHT  -spreadType SIDE
editPin -layer met3 -pin $pins_left   -side LEFT   -spreadType SIDE
# editPin -layer met2 -pin $pins_bottom -side BOTTOM -spreadType SIDE
editPin -layer met2 -pin $pins_top    -side TOP    -spreadType SIDE

