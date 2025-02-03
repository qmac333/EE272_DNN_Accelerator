##
## Copyright 2003-2019 Siemens
##
#------------------------------------------------------------
# Basic Training: C++: Lab5  Custom RAM 
#------------------------------------------------------------

flow package require MemGen
flow run /MemGen/MemoryGenerator_BuildLib {
VENDOR           Nangate
RTLTOOL          OasysRTL
TECHNOLOGY       045nm
LIBRARY          SPRAM_MASK
MODULE           SPRAM_MASK
OUTPUT_DIR       ./
FILES {
  { FILENAME ./SPRAM_MASK.v FILETYPE Verilog MODELTYPE generic PARSE 1 PATHTYPE relative STATICFILE 1 VHDL_LIB_MAPS work }
}
VHDLARRAYPATH    {}
WRITEDELAY       0.1
INITDELAY        1
READDELAY        1.1
VERILOGARRAYPATH {}
INPUTDELAY       0.01
WIDTH            width
AREA             0
RDWRRESOLUTION   UNKNOWN
WRITELATENCY     1
READLATENCY      1
DEPTH            words
PARAMETERS {
  { PARAMETER words      TYPE hdl IGNORE 0 MIN {} MAX {} DEFAULT 0 }
  { PARAMETER width      TYPE hdl IGNORE 0 MIN {} MAX {} DEFAULT 0 }
  { PARAMETER addr_width TYPE hdl IGNORE 0 MIN {} MAX {} DEFAULT 0 }
}
PORTS {
  { NAME port_0 MODE ReadWrite }
}
PINMAPS {
  { PHYPIN Q     LOGPIN DATA_OUT     DIRECTION out WIDTH width            PHASE {} DEFAULT {} PORTS port_0 }
  { PHYPIN CLK   LOGPIN CLOCK        DIRECTION in  WIDTH 1.0              PHASE 1  DEFAULT {} PORTS port_0 }
  { PHYPIN CSN   LOGPIN CHIP_SELECT  DIRECTION in  WIDTH 1.0              PHASE 0  DEFAULT {} PORTS {}     }
  { PHYPIN WEN   LOGPIN WRITE_ENABLE DIRECTION in  WIDTH 1.0              PHASE 0  DEFAULT {} PORTS port_0 }
  { PHYPIN A     LOGPIN ADDRESS      DIRECTION in  WIDTH addr_width       PHASE {} DEFAULT {} PORTS port_0 }
  { PHYPIN D     LOGPIN DATA_IN      DIRECTION in  WIDTH width            PHASE {} DEFAULT {} PORTS port_0 }
  { PHYPIN MASKN LOGPIN WRITE_MASK   DIRECTION in  WIDTH num_byte_enables PHASE 0  DEFAULT {} PORTS port_0 }
}

}
