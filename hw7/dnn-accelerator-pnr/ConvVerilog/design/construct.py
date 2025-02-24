#! /usr/bin/env python
#=========================================================================
# construct.py
#=========================================================================
# DNN accelerator
#
# Author : Kalhan Koul
# Date   : Feb 13, 2021
#

import os
import sys

from mflowgen.components import Graph, Step

def construct():

  g = Graph()
  g.sys_path.append( '/farmshare/home/classes/ee/272' )

  #-----------------------------------------------------------------------
  # Parameters
  #-----------------------------------------------------------------------

  adk_name = 'skywater-130nm-adk.v2021'
  adk_view = 'view-standard'

  parameters = {
    'construct_path' : __file__,
    'design_name'    : 'conv',
    'clock_period'   : 20.0,
    'adk'            : adk_name,
    'adk_view'       : adk_view,
    'topographical'  : True,
    'testbench_name' : 'conv_tb',
    'strip_path'     : 'conv_tb/conv_inst',
    'saif_instance'  : 'conv_tb/conv_inst'
  }

  #-----------------------------------------------------------------------
  # Create nodes
  #-----------------------------------------------------------------------

  this_dir = os.path.dirname( os.path.abspath( __file__ ) )

  # ADK step

  g.set_adk( adk_name )
  adk = g.get_adk_step()

  # Custom steps

  sram         = Step( this_dir + '/sram'        )
  rtl          = Step( this_dir + '/rtl'         )
  testbench    = Step( this_dir + '/testbench'   )
  constraints  = Step( this_dir + '/constraints' )
  rtl_sim      = Step( this_dir + '/cadence-xcelium-sim')
  rtl_sim_vcs      = Step( this_dir + '/synopsys-vcs-sim')

  # Default steps

  info         = Step( 'info',                           default=True )
  dc           = Step( 'synopsys-dc-synthesis',          default=True )

  #-----------------------------------------------------------------------
  # Graph -- Add nodes
  #-----------------------------------------------------------------------

  g.add_step( info         )
  g.add_step( sram         )
  g.add_step( rtl          )
  g.add_step( testbench    )
  g.add_step( constraints  )
  g.add_step( dc           )
  g.add_step( rtl_sim      )
  g.add_step( rtl_sim_vcs  )

  #-----------------------------------------------------------------------
  # Graph -- Add edges
  #-----------------------------------------------------------------------

  # Dynamically add edges
 
  dc.extend_inputs(['sky130_sram_4kbyte_1rw1r_32x1024_8_TT_1p8V_25C.db'])
  dc.extend_inputs(['sky130_sram_4kbyte_1rw1r_32x1024_8.lef'])
  dc.extend_inputs(['sky130_sram_2kbyte_1rw1r_32x512_8_TT_1p8V_25C.db'])
  dc.extend_inputs(['sky130_sram_2kbyte_1rw1r_32x512_8.lef'])
  dc.extend_inputs(['sky130_sram_1kbyte_1rw1r_32x256_8_TT_1p8V_25C.db'])
  dc.extend_inputs(['sky130_sram_1kbyte_1rw1r_32x256_8.lef'])

  rtl_sim.extend_inputs(['ifmap_data.txt'])
  rtl_sim.extend_inputs(['weight_data.txt'])
  rtl_sim.extend_inputs(['ofmap_data.txt'])
  rtl_sim.extend_inputs(['layer_params.v'])
  rtl_sim.extend_inputs(['sky130_sram_4kbyte_1rw1r_32x1024_8.v'])
  rtl_sim.extend_inputs(['sky130_sram_2kbyte_1rw1r_32x512_8.v'])
  rtl_sim.extend_inputs(['sky130_sram_1kbyte_1rw1r_32x256_8.v'])

  rtl_sim_vcs.extend_inputs(['ifmap_data.txt'])
  rtl_sim_vcs.extend_inputs(['weight_data.txt'])
  rtl_sim_vcs.extend_inputs(['ofmap_data.txt'])
  rtl_sim_vcs.extend_inputs(['layer_params.v'])
  rtl_sim_vcs.extend_inputs(['sky130_sram_4kbyte_1rw1r_32x1024_8.v'])
  rtl_sim_vcs.extend_inputs(['sky130_sram_2kbyte_1rw1r_32x512_8.v'])
  rtl_sim_vcs.extend_inputs(['sky130_sram_1kbyte_1rw1r_32x256_8.v'])

  # extend saif out of synopsys simulation
  rtl_sim_vcs.extend_outputs(['run.saif'])

  # Connect by name
  g.connect_by_name( rtl,          rtl_sim      ) # design.v
  g.connect_by_name( sram,         rtl_sim      ) # design.v
  g.connect_by_name( testbench,    rtl_sim      ) # testbench.v
  g.connect_by_name( rtl,          rtl_sim_vcs  ) # design.v
  g.connect_by_name( sram,         rtl_sim_vcs  ) # design.v
  g.connect_by_name( testbench,    rtl_sim_vcs  ) # testbench.sv

  
  g.connect_by_name( rtl_sim_vcs,  dc           ) # run.saif
  g.connect_by_name( rtl,          dc           )
  g.connect_by_name( adk,          dc           )
  g.connect_by_name( constraints,  dc           )
  g.connect_by_name( sram,         dc)

  #-----------------------------------------------------------------------
  # Parameterize
  #-----------------------------------------------------------------------

  g.update_params( parameters )

  return g

if __name__ == '__main__':
  g = construct()
# g.plot()
