flow package require MemGen
flow run /MemGen/MemoryGenerator_BuildLib {
VENDOR           *
RTLTOOL          DesignCompiler
TECHNOLOGY       *
LIBRARY          sram_8192_128_db
MODULE           sram_8192_128_db
OUTPUT_DIR       /home/users/jiajunc4/ee272/git_ee272/EE272_DNN_Accelerator/hw6/dnn-accelerator-syn/ConvHLS/design/sram_wrappers
FILES {
  { FILENAME /home/users/jiajunc4/ee272/git_ee272/EE272_DNN_Accelerator/hw6/dnn-accelerator-syn/ConvHLS/design/sram_wrappers/sram_8192_128_db.v FILETYPE Verilog MODELTYPE generic PARSE 1 PATHTYPE copy STATICFILE 1 VHDL_LIB_MAPS work }
}
VHDLARRAYPATH    {}
WRITEDELAY       0.1
INITDELAY        1
READDELAY        0.1
VERILOGARRAYPATH {}
INPUTDELAY       0.01
TIMEUNIT         1ns
WIDTH            128
AREA             0
RDWRRESOLUTION   UNKNOWN
WRITELATENCY     1
READLATENCY      1
DEPTH            8192
PARAMETERS {
}
PORTS {
  { NAME port_0 MODE Write }
  { NAME port_1 MODE Read  }
}
PINMAPS {
  { PHYPIN clk0  LOGPIN CLOCK        DIRECTION in  WIDTH 1.0   PHASE 1  DEFAULT {} PORTS port_0 }
  { PHYPIN csb0  LOGPIN CHIP_SELECT  DIRECTION in  WIDTH 1.0   PHASE 0  DEFAULT {} PORTS {}     }
  { PHYPIN web0  LOGPIN WRITE_ENABLE DIRECTION in  WIDTH 1.0   PHASE 0  DEFAULT {} PORTS port_0 }
  { PHYPIN addr0 LOGPIN ADDRESS      DIRECTION in  WIDTH 13.0  PHASE {} DEFAULT {} PORTS port_0 }
  { PHYPIN din0  LOGPIN DATA_IN      DIRECTION in  WIDTH 128.0 PHASE {} DEFAULT {} PORTS port_0 }
  { PHYPIN clk1  LOGPIN CLOCK        DIRECTION in  WIDTH 1.0   PHASE 1  DEFAULT {} PORTS port_1 }
  { PHYPIN csb1  LOGPIN CHIP_SELECT  DIRECTION in  WIDTH 1.0   PHASE 0  DEFAULT {} PORTS {}     }
  { PHYPIN addr1 LOGPIN ADDRESS      DIRECTION in  WIDTH 13.0  PHASE {} DEFAULT {} PORTS port_1 }
  { PHYPIN dout1 LOGPIN DATA_OUT     DIRECTION out WIDTH 128.0 PHASE {} DEFAULT {} PORTS port_1 }
}

}
