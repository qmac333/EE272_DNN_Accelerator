//
// Copyright 2003-2019 Siemens
//
#include "test_multi_block.h"
#include <mc_scverify.h>

CCS_MAIN(int argv, char **argc)
{
  matrixMultiplyTop<8,8> inst;
  ac_channel<int8> A;
  ac_channel<int8> B;
  ac_channel<int19 > C;

  int8 A_ref[8][8];
  int8 B_ref[8][8];
  int19 C_ref[8][8];

  for (int i=0; i<8; i++) {
    for (int j=0; j<8; j++) {
      A_ref[i][j] = rand();
      A.write(A_ref[i][j]);
      B_ref[i][j] = rand();
      B.write(B_ref[i][j]);
    }
  }
  // Reference matrix multiply
  for (int i = 0; i < 8; i++) {
    for (int j = 0; j < 8; j++) {
      C_ref[i][j] = 0;
      for (int k = 0; k < 8; k++) {
        C_ref[i][j] += A_ref[i][k] * B_ref[k][j];
      }
    }
  }

  inst.run(A,B,C);
  int errCnt = 0;
  for (int i=0; i<8; i++) {
    for (int j=0; j<8; j++) {
      printf("%6d ",C_ref[i][j].to_int());
      if (C.read() != C_ref[i][j]) {
        errCnt++;
      }
    }
    printf("\n");
  }
  printf("\n");
  if (errCnt) {
    printf("There are %d errors!\n",errCnt);
  }
  CCS_RETURN(errCnt);
}

