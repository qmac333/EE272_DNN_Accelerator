//
// Copyright 2003-2019 Siemens
//
#ifndef _INCLUDED_TEST_H_
#define _INCLUDED_TEST_H_

#include <ac_channel.h>     // Algorithmic C channel class
#include <ac_int.h>         // Algortihmic C integer data types
#include <ac_wait.h>

const int MEM_WORDS=256;
typedef ac_int<ac::log2_ceil<MEM_WORDS>::val,false> ATYPE;
struct addrData {
  ATYPE addr;
  int data;
};

#include <mc_scverify.h>
class readWriteBlock
{
public:
  readWriteBlock() {} // Constructor

#pragma hls_design interface
  void CCS_BLOCK(run)(ac_channel<int >      &rd_data,
                      ac_channel<ATYPE>     &rd_addr,
                      ac_channel<addrData > &wr_addr_data,
                      bool                  rd_wr,
                      ac_channel<int >      &mem_rd_data,
                      ac_channel<ATYPE>     &mem_rd_addr,
                      ac_channel<addrData > &mem_wr_addr_data) {
    if (rd_wr) { // if reading the shared memory
      if (rd_addr.available(1)) {
        addr = rd_addr.read(); // get IF read address
        mem_rd_addr.write(addr); // Send read address to mem block
      }
      if (mem_rd_data.available(1)) {
        data = mem_rd_data.read(); // Read data back from mem block
        rd_data.write(data); // Write data to IF
      }
    } else { // writing shared memory
      if (wr_addr_data.available(1)) {
        addr_data = wr_addr_data.read(); // get write address and data from IF
        mem_wr_addr_data.write(addr_data); // Send write address and data to mem block
      }
    }
  }

private: // data
  addrData addr_data;
  int      data;
  ATYPE    addr;
};

class sharedMem
{
public:
  sharedMem() : rd_flag0(false),rd_flag1(false),wr_flag0(false),wr_flag1(false) {}
#pragma hls_design interface
  void CCS_BLOCK(run)(ac_channel<int >      &rd_data0,
                      ac_channel<ATYPE>     &rd_addr0,
                      ac_channel<addrData > &wr_addr_data0,
                      ac_channel<int >      &rd_data1,
                      ac_channel<ATYPE>     &rd_addr1,
                      ac_channel<addrData > &wr_addr_data1,
                      bool                  priority0,
                      bool                  read_enable) {
    if (!rd_flag0 & read_enable) {
      rd_flag0 = rd_addr0.nb_read(raddr0);
    }
    if (!wr_flag0) {
      wr_flag0 = wr_addr_data0.nb_read(waddr_data0);
    }

    if (!rd_flag1 & read_enable) {
      rd_flag1 = rd_addr1.nb_read(raddr1);
    }
    if (!wr_flag1) {
      wr_flag1 = wr_addr_data1.nb_read(waddr_data1);
    }

    // mem reads
    if (rd_flag0 & priority0) { // block0 has priority
      rd_data0.write(mem[raddr0]);
      rd_flag0 = false; // clear flag for next read
    } else if (rd_flag1) {
      rd_data1.write(mem[raddr1]);
      rd_flag1 = false; // clear flag for next read
    }
    // mem writes
    if (wr_flag0 & !priority0) { // block0 has priority
      mem[waddr_data0.addr] = waddr_data0.data;
      wr_flag0 = false; // clear flag for next write
    } else if (wr_flag1) {
      mem[waddr_data1.addr] = waddr_data1.data;
      wr_flag1 = false; // clear flag for next read
    }
  }

private: // data
  bool     rd_flag0;
  ATYPE    raddr0;
  int      rdata0;
  bool     rd_flag1;
  ATYPE    raddr1;
  int      rdata1;
  bool     wr_flag0;
  addrData waddr_data0;
  bool     wr_flag1;
  addrData waddr_data1;
  int      mem[256]; // array mapped to memory
};

#pragma hls_design top
class top
{
public:
  top() {} // Constructor

#pragma hls_design interface
  void CCS_BLOCK(run)(ac_channel<int >      &rd_data0,
                      ac_channel<ATYPE>     &rd_addr0,
                      ac_channel<addrData > &wr_addr_data0,
                      bool                  rd_wr0,
                      ac_channel<int >      &rd_data1,
                      ac_channel<ATYPE>     &rd_addr1,
                      ac_channel<addrData > &wr_addr_data1,
                      bool                  rd_wr1,
                      bool                  priority0,
                      bool                  read_enable) {
    block0.run(rd_data0,rd_addr0,wr_addr_data0,rd_wr0,mem_rd_data0_chan,mem_rd_addr0_chan,mem_wr_addr_data0_chan);
    block1.run(rd_data1,rd_addr1,wr_addr_data1,rd_wr1,mem_rd_data1_chan,mem_rd_addr1_chan,mem_wr_addr_data1_chan);
    mem_block.run(mem_rd_data0_chan,mem_rd_addr0_chan,mem_wr_addr_data0_chan,mem_rd_data1_chan,mem_rd_addr1_chan,mem_wr_addr_data1_chan,priority0,read_enable);
  }

private: // data and class instances
  readWriteBlock        block0;
  readWriteBlock        block1;
  sharedMem             mem_block;
  ac_channel<int >      mem_rd_data0_chan;
  ac_channel<ATYPE>     mem_rd_addr0_chan;
  ac_channel<addrData > mem_wr_addr_data0_chan;
  ac_channel<int >      mem_rd_data1_chan;
  ac_channel<ATYPE>     mem_rd_addr1_chan;
  ac_channel<addrData > mem_wr_addr_data1_chan;
};

#endif

