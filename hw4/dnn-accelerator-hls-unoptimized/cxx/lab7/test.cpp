//
// Copyright 2003-2019 Siemens
//
#include <ac_channel.h>

struct addrData {
  int addr;
  int data;
};

void test(ac_channel<addrData> &write_addr_data, ac_channel<int> &rd_addr, ac_channel<int> &rd_data)
{
  static bool write_flag = false;
  static addrData write_data;
  static bool read_flag0 = false;
  static bool read_flag1 = false;
  static bool read_flag2 = false;
  int read_data;
  int read_addr;
  static bool read_data_written = false;
  static int mem[1024];

  write_flag = write_addr_data.nb_read(write_data);

  if (write_flag) {
    mem[write_data.addr] = write_data.data;
  }

  if (!read_flag2) {
    read_flag0 = rd_addr.nb_read(read_addr);
  }

  read_data = mem[read_addr];
  read_flag2 = read_flag1;
  read_flag1 = read_flag0;
  if (rd_data.nb_write(read_data)) {
    read_flag0 = false;
  }
}

