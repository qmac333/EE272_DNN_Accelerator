//
// Copyright 2003-2019 Siemens
//
#include "test.h"
#include <mc_scverify.h>

CCS_MAIN(int argv, char **argc)
{
  ac_channel<int > rd_data0;
  ac_channel<ATYPE> rd_addr0;
  ac_channel<addrData > wr_addr_data0;
  bool rd_wr0;
  ac_channel<int > rd_data1;
  ac_channel<ATYPE> rd_addr1;
  ac_channel<addrData > wr_addr_data1;
  bool rd_wr1;
  bool priority0;
  addrData ad0,ad1;
  top inst;
  priority0 = false; // block0 has write priority
  bool read_enable = false;
  rd_wr0 = rd_wr1 = false; // write the memory from both blocks
  for (int i=0; i<128; i++) {
    ad0.addr = i;
    ad0.data = i+1;
    wr_addr_data0.write(ad0);
    ad1.addr = i+128;
    ad1.data = i+1+128;
    wr_addr_data1.write(ad1);
    inst.run(rd_data0,rd_addr0,wr_addr_data0,rd_wr0,rd_data1,rd_addr1,wr_addr_data1,rd_wr1,priority0,read_enable);
  }

  rd_wr0 = rd_wr1 = true;
  priority0 = true; // block0 has read priority
  read_enable = true;
  for (int i=0; i<64; i++) {
    rd_addr0.write(i);
    rd_addr1.write(i+128);
    inst.run(rd_data0,rd_addr0,wr_addr_data0,rd_wr0,rd_data1,rd_addr1,wr_addr_data1,rd_wr1,priority0,read_enable);
  }
  printf("data0 size = %d  data1 size = %d\n",rd_data0.size(),rd_data1.size());
  while (rd_data0.size() != 64) {
    inst.run(rd_data0,rd_addr0,wr_addr_data0,rd_wr0,rd_data1,rd_addr1,wr_addr_data1,rd_wr1,priority0,read_enable);
  }
  printf("data0 size = %d  data1 size = %d\n",rd_data0.size(),rd_data1.size());

  while (rd_data1.size() != 64) {
    inst.run(rd_data0,rd_addr0,wr_addr_data0,rd_wr0,rd_data1,rd_addr1,wr_addr_data1,rd_wr1,priority0,read_enable);
  }
  while (rd_data0.available(1)) {
    printf("data0 = %d\n",rd_data0.read());
  }

  while (rd_data1.available(1)) {
    printf("data1 = %d\n",rd_data1.read());
  }

  CCS_RETURN(0);
}

