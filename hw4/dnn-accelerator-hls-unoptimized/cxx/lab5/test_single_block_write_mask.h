//
// Copyright 2003-2019 Siemens
//
#ifndef _INCLUDED_TEST_SINGLE_BLOCK_WRITE_MASK_H_
#define _INCLUDED_TEST_SINGLE_BLOCK_WRITE_MASK_H_

#include <ac_channel.h>     // Algorithmic C channel class
#include <ac_int.h>         // Algortihmic C integer data types
#include <mc_scverify.h>

template<int W0, int W1> // expecting to use ac_int types to get width
class matrixMultiply
{
public:
  matrixMultiply() {} // Constructor

#pragma hls_design interface
  void CCS_BLOCK(run)(ac_channel<ac_int<W0> > &A, 
                      ac_channel<ac_int<W1> > &B, 
                      ac_channel<ac_int<W0+W1+3> > &C) {
    ac_int<W0+W1+3> acc = 0;
    TRANSPOSEB_ROW:for (int i=0; i<8; i++) { // Transpose operation must complete first
      TRANSPOSEB_COL:for (int j=0; j<8; j++) {
        ac_int<W1> tmp = B.read();
        B_transpose[j].set_slc(i*8,tmp); // set_slc offset jumps by 8
      }
    }
    ROW:for (int i = 0; i < 8; i++) {
      COPY:for (int r=0; r<8; r++) { // get one row of A
        A_row[r] = A.read();
      }
      COL:for (int j = 0; j < 8; j++) {
        acc = 0;
        MAC:for (int k = 0; k < 8; k++) { // loop can be unrolled
          acc += A_row[k] * B_transpose[j].template slc<8>(k*8);
        }
        C.write(acc);
      }
    }
  }

private: // data
  ac_int<W1*8> B_transpose[8]; // pack a row into a single bit vector
  ac_int<W0> A_row[8];
};

#ifndef CCS_SCVERIFY
// Template expansion for synthesis
template class matrixMultiply<8,8>;
#endif

#endif

