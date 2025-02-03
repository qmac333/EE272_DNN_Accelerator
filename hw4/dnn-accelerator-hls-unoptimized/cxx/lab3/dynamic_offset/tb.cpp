#include "test.h"
#include <stdio.h>
#include <mc_scverify.h>

CCS_MAIN(int argc, char *argv[])
{
  int din[40];
  uint4 offset;
  int dout[40];
  int dout_orig[40];
  int errCnt = 0;

  for (int i=0; i<20; i++) {
    for (int j=0; j<40; j++) {
      din[j] = i+j;
    }
    offset = i;
    CCS_DESIGN(test_wrapper)(din,offset,dout);
    test_orig_wrapper(din,offset,dout_orig);
    for (int j=0; j<40; j++) {
      //printf("%d ",dout_orig[j]);printf("\n");
      if (dout_orig[j] != dout[j]) {
        errCnt++;
        printf("ERROR");
        break;
      }
    }	
    
  }
  printf("errCnt = %d ",errCnt); 
  printf("\n");

  CCS_RETURN(errCnt);
}

