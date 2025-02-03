//
// Copyright 2003-2019 Siemens
//
#include "mem_block_orig.h"
#include "mem_block_ref.h"
#include <mc_scverify.h>

CCS_MAIN(int argv, char **argc)
{
  ac_channel<addrData> write_addr_data;
  ac_channel<int> rd_addr;
  ac_channel<int> rd_data;

  ac_channel<addrData> write_addr_data_ref;
  ac_channel<int> rd_addr_ref;
  ac_channel<int> rd_data_ref;
  mem_block inst;
  mem_block_ref ref;
  bool read_enable = false;
  addrData data;
#ifdef CCS_SCVERIFY
  testbench::rd_addr_wait_ctrl.cycles = 64;
#endif
  for (int i=0; i<64; i++) { // initialize memory
    data.addr = i;
    data.data = i+1;
    write_addr_data.write(data);//write same data into DUT and reference
    write_addr_data_ref.write(data);
    inst.run(write_addr_data,rd_addr,rd_data);
    ref.run(write_addr_data_ref,rd_addr_ref,read_enable,rd_data_ref);
  }
  int addr=0;
  read_enable = true;
  //inst.print();
  for (int i=0; i<20; i++) { // read and write memory
    data.addr = addr;
    data.data = addr+100;
    if (i !=10 || i!=11) {
      write_addr_data.write(data);
      write_addr_data_ref.write(data);
      rd_addr.write(addr+20);
      rd_addr_ref.write(addr+20);
      addr++;
    }
#ifdef CCS_SCVERIFY
    if (i==10 || i==11) {
      testbench::rd_data_wait_ctrl.cycles = 4;
    }
    if (i==7) {
      testbench::rd_addr_wait_ctrl.cycles = 2;
    }
    if (i==5) {
      testbench::write_addr_data_addr_wait_ctrl.cycles = 2;
    }
#endif
    inst.run(write_addr_data, rd_addr,rd_data);
    ref.run(write_addr_data_ref, rd_addr_ref,read_enable,rd_data_ref);
  }
  // inst.print();
  int errCnt = 0;
  int dat,dat_ref;
  while (rd_data.available(1) & rd_data_ref.available(1)) {
    dat = rd_data.read();
    dat_ref = rd_data_ref.read();
    if (dat != dat_ref) { // check for mismatches
      errCnt++;
      printf("data = %d  ref = %d\n",dat,dat_ref);
    } else {
      printf("data = %d  ref = %d\n",dat,dat_ref);
    }
  }
  if (errCnt) printf("Errors = %d\n",errCnt);
  CCS_RETURN(errCnt);
}

