//
// Copyright 2003-2019 Siemens
//
#ifndef _INCLUDED_TEST_MULTI_BLOCK_H_
#define _INCLUDED_TEST_MULTI_BLOCK_H_

#include <ac_channel.h>     // Algorithmic C channel class
#include <ac_int.h>         // Algortihmic C integer data types
#include <mc_scverify.h>

// Struct to pack memory array, required coding style for shared memories
template<int W>
struct memStruct {
  ac_int<W*8> data[8];
};

// Transpose B matrix and forward A stream to matrix multiply
template<int W0, int W1>
class transpose
{
public:
  transpose() {}  // Constructor

#pragma hls_design interface
  void CCS_BLOCK(run)(ac_channel<ac_int<W1> > &B_in,
                      ac_channel<memStruct<W1> > &B_mem) {
    memStruct<W1>  B_transpose; // local struct will be optimized away
    ac_int<W0> A;
    ac_int<W1> B_row[8];
    TRANSPOSEB_ROW:for (int i=0; i<8; i++) {
      TRANSPOSEB_COL:for (int j=0; j<8; j++) {
        ac_int<W1> tmp = B_in.read();
        // B_transpose memory has write masking, allowing the set_slc operation
        // to be scheduled without generating a read-modify-write
        B_transpose.data[j].set_slc(i*8,tmp); // set_slc offset jumps by 8
      }
    }
    B_mem.write(B_transpose); // Write mem interface with local struct
  }
};

//
template<int W0, int W1> // expecting to use ac_int types to get width
class matrixMultiply
{
public:
  matrixMultiply() {} // Constructor

#pragma hls_design interface
  void CCS_BLOCK(run)(ac_channel<ac_int<W0> > &A,
                      ac_channel<memStruct<W1> > &B_mem,
                      ac_channel<ac_int<W0+W1+3> > &C) {
    ac_int<W0+W1+3> acc = 0;
    memStruct<W1> B_transpose; // local struct will be optimized away
    ac_int<W0> A_row[8];
    B_transpose = B_mem.read();; // read mem interface into local struct
    ROW:for (int i = 0; i < 8; i++) {
      COPY_ROW:for (int r=0; r<8; r++) { // copy row of A and reuse
        A_row[r] = A.read();
      }
      COL:for (int j = 0; j < 8; j++) {
        acc = 0;
        MAC:for (int k = 0; k < 8; k++) { // Loop can be unrolled
          ac_int<W1> B_data = B_transpose.data[j].template slc<8>(k*8);
          acc += A_row[k] * B_data;
        }
        C.write(acc);
      }
    }
  }
};


#pragma hls_design top
template<int W0, int W1> // expecting to use ac_int types to get width
class matrixMultiplyTop
{
public:
  matrixMultiplyTop() {} // Constructor

#pragma hls_design interface
  void CCS_BLOCK(run)(ac_channel<ac_int<W0> > &A,
                      ac_channel<ac_int<W1> > &B,
                      ac_channel<ac_int<W0+W1+3> > &C) {
    mat_transpose.run(B,B_mem);
    mat_multiply.run(A,B_mem,C);
  }

private: // class instances
  matrixMultiply<W0,W1> mat_multiply;
  transpose<W0,W1> mat_transpose;
  // interconnect channels
  ac_channel<memStruct<W1> > B_mem;
};

#endif

