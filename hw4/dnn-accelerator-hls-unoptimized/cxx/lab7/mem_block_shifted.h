//
// Copyright 2003-2019 Siemens
//
#ifndef _INCLUDED_MEM_BLOCK_SHIFTED_H_
#define _INCLUDED_MEM_BLOCK_SHIFTED_H_

#include <ac_channel.h>     // Algorithmic C channel class
#include <ac_int.h>         // Algortihmic C integer data types
#include "types.h"
#include <mc_scverify.h>

template<typename T, int N>
class fifo
{
public:
  // Constructor
  fifo() : wr_ptr(0), rd_ptr(0), cnt(0) {
#pragma unroll yes
    for (int i=0; i<N; i++) { regs[i] = 0; }
  }

  void push(T &din) {
    regs[wr_ptr] = din;
    wr_ptr++;
    if (wr_ptr == N) {
      wr_ptr = 0;
    }
    cnt++;
  }

  T pop() {
    T tmp;
    tmp = regs[rd_ptr];
    rd_ptr++;
    if (rd_ptr == N) {
      rd_ptr = 0;
    }
    cnt--;
    return tmp;
  }

  T peek() {
    T tmp;
    tmp = regs[rd_ptr];
    return tmp;
  }

  bool full() {
    return cnt == N;
  }

  bool not_empty() {
    return cnt != 0;
  }

private: // data
  T                                    regs[N];
  ac_int<ac::log2_ceil<N>::val,false>  wr_ptr;
  ac_int<ac::log2_ceil<N>::val,false>  rd_ptr;
  ac_int<ac::nbits<N>::val,false>      cnt;
};


#pragma hls_design top
class mem_block
{
public:
  // Constructor
  mem_block() : write_flag(0), read_flag0(0), flags(0), skid(0), debug_cnt(0) {}

#pragma hls_design interface
  void CCS_BLOCK(run)(ac_channel<addrData> &write_addr_data, 
                      ac_channel<int> &rd_addr, 
                      ac_channel<int> &rd_data) {
    if (!flags[2]) { // Access MSB bit of the flags 3bit variable. Please note the bit access method [].
      read_flag0 = rd_addr.nb_read(read_addr);
    } else {
      read_flag0 = false;
    }

    if (read_flag0) {
      read_data = mem[read_addr];
    }

    if (read_flag0 | skid_buf.not_empty()) {
#ifndef __SYNTHESIS__
      debug_cnt++;
#endif
      if (read_flag0 & skid_buf.not_empty()) {
        skid_buf.push(read_data);
        read_data = skid_buf.peek();
#ifndef __SYNTHESIS__
        if (debug_cnt&1) {
          write_stall = true;
        } else
#endif
          write_stall = !rd_data.nb_write(read_data);
        if (!write_stall) {
          skid_buf.pop(); //Merely pop out the data from skid_buffer as nb_write was successful
        }
      } else if (skid_buf.not_empty()) {
        read_data = skid_buf.peek();
#ifndef __SYNTHESIS__
        if (debug_cnt&1) {
          write_stall = true;
        } else
#endif
          write_stall = !rd_data.nb_write(read_data);
        if (!write_stall) {
          skid_buf.pop();
        }
      } else if (read_flag0) {
#ifndef __SYNTHESIS__
        if (debug_cnt&1) {
          write_stall = true;
        } else
#endif
          write_stall = !rd_data.nb_write(read_data);
        if (write_stall) {
          skid_buf.push(read_data);//Push data into skid buffer if nb_write fails
        }
      }
    }

    flags <<=1;
    flags[0] = skid_buf.not_empty();
    write_flag = write_addr_data.nb_read(write_data);

    if (write_flag) {
      mem[write_data.addr] = write_data.data;
    }
  }

private: // data
  bool        write_flag;
  addrData    write_data;
  bool        read_flag0;
  int         mem[64];
  uint3       flags;
  int         read_data;
  int         read_addr;
  uint3       skid;
  fifo<int,4> skid_buf;
  bool        write_stall;
  int         debug_cnt;
};

#endif

