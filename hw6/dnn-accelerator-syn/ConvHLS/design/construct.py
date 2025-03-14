#! /usr/bin/env python
#=========================================================================
# construct.py
#=========================================================================
# Demo with a simple SRAM macro
#
# Author : Priyanka Raina
# Date   : February 15, 2021
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
    'design_name'    : 'Conv',
    'clock_period'   : 20.0,
    'adk'            : adk_name,
    'adk_view'       : adk_view,
    'topographical'  : True,
    # 'testbench_name' : 'ConvTb',
    'strip_path'     : 'scverify_top/Conv',
    'saif_instance'  : 'scverify_top/Conv'
  }

  #-----------------------------------------------------------------------
  # Create nodes
  #-----------------------------------------------------------------------

  this_dir = os.path.dirname( os.path.abspath( __file__ ) )

  # ADK step

  g.set_adk( adk_name )
  adk = g.get_adk_step()

  # Custom steps

  sram          = Step( this_dir + '/sram'          )
  rtl           = Step( this_dir + '/rtl'           )
  # testbench     = Step( this_dir + '/testbench'     )
  constraints   = Step( this_dir + '/constraints'   )

  # Default steps

  info         = Step( 'info',                          default=True )
  dc           = Step( 'synopsys-dc-synthesis',         default=True )
  # rtl_sim      = Step( 'synopsys-vcs-sim',              default=True )
  gen_saif     = Step( 'synopsys-vcd2saif-convert',     default=True )
  gen_saif_rtl = gen_saif.clone()
  gen_saif_rtl.set_name( 'gen-saif-rtl' )

  #-----------------------------------------------------------------------
  # Graph -- Add nodes
  #-----------------------------------------------------------------------

  g.add_step( info         )
  g.add_step( sram         )
  g.add_step( rtl          )
  # g.add_step( testbench    )
  g.add_step( constraints  )
  g.add_step( dc           )
  # g.add_step( rtl_sim      )
  g.add_step( gen_saif_rtl )

  #-----------------------------------------------------------------------
  # Graph -- Add edges
  #-----------------------------------------------------------------------
  
  # Dynamically add edges

  dc.extend_inputs(['sram_1kbyte_1rw1r_32x256_tt_1p8V_25C.db', 'sram_2kbyte_1rw1r_32x512_tt_1p8V_25C.db', ''])
  # rtl_sim.extend_inputs(['sram_1kbyte_1rw1r_32x256.v', 'sram_2kbyte_1rw1r_32x512.v'])

  # Connect by name

  g.connect_by_name( adk,          dc           )
  g.connect_by_name( sram,         dc           )
  g.connect_by_name( rtl,          dc           )
  g.connect_by_name( constraints,  dc           )
  # g.connect_by_name( rtl,          rtl_sim      ) 
  # g.connect_by_name( testbench,    rtl_sim      ) 
  # g.connect_by_name( sram,         rtl_sim      ) 
  g.connect( rtl.o( 'run.vcd' ), gen_saif_rtl.i( 'run.vcd' ) ) # FIXME: VCS sim node generates a VCD file but gives it a VPD extension
  g.connect_by_name( gen_saif_rtl, dc           ) # run.saif

  #-----------------------------------------------------------------------
  # Parameterize
  #-----------------------------------------------------------------------

  g.update_params( parameters )
  g.param_space(dc, "clock_period", [100.0, 20.0, 10.0, 5.0, 4.0, 2.0])



  return g

if __name__ == '__main__':
  g = construct()
  g.plot()
