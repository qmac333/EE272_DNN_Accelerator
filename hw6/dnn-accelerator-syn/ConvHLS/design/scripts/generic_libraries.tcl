solution library add nangate-45nm_beh -- -rtlsyntool DesignCompiler -vendor Nangate -technology 045nm
# solution library add ccs_sample_mem

# solution library add nangate-45nm_beh -- -rtlsyntool DesignCompiler
# solution library add ccs_sample_mem
# solution library add {[Block] Conv.v1} -- -vendor Nangate -technology 045nm
# solution library add {[Block] InputDoubleBuffer<4096,16,16>.v1}
# solution library add {[CCORE] ProcessingElement<IDTYPE,WDTYPE,ODTYPE>.v1}
# solution library add {[Block] SystolicArrayCore<IDTYPE,WDTYPE,ODTYPE,16,16>.v1}
# solution library add {[Block] WeightDoubleBuffer<8192,16,16>.v1}
solution library add sram_256_512_db
solution library add sram_4096_128_db
solution library add sram_8192_128_db

# set accum_buffer_module ccs_sample_mem.ccs_ram_sync_1R1W
# set double_buffer_module ccs_sample_mem.ccs_ram_sync_1R1W 
