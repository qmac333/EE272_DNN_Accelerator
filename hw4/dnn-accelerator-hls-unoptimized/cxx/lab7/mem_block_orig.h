//
// Copyright 2003-2019 Siemens
//
#ifndef _INCLUDED_MEM_BLOCK_ORIG_H_
#define _INCLUDED_MEM_BLOCK_ORIG_H_

#include <ac_channel.h>     // Algorithmic C channel class
#include <ac_int.h>         // Algortihmic C integer data types
#include "types.h"
#include <mc_scverify.h>

#pragma hls_design top
class mem_block
{
public:
  mem_block() : write_flag(0),read_flag0(0) {}
#pragma hls_design interface
  void run(ac_channel<addrData> &write_addr_data, // Input addr & data passed via 'addrData' struct
           ac_channel<int>      &rd_addr,         // Address Input
           ac_channel<int>      &rd_data) {       // Output rd_data after mem read is done with address input on rd_addr
    int read_data;

    if (!read_flag0) {
      read_flag0 = rd_addr.nb_read(read_addr);
    }
    if (read_flag0) {
      read_data = mem[read_addr];
      read_flag0 = !rd_data.nb_write(read_data); // Successful non-blocking write clears read_flag0 for next read
    }

    write_flag = write_addr_data.nb_read(write_data);

    if (write_flag) {
      mem[write_data.addr] = write_data.data;
    }
  }

private: // data
  bool       write_flag;
  addrData   write_data;
  bool       read_flag0;
  int        mem[64];
  int        read_addr=0;
};

#endif

