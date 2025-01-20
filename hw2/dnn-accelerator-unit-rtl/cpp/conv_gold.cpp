#include <stdio.h>
#include <cassert>
#include <string.h>
#include <cstdint>

template <int OY, int OX, int OC, int IC, int FY, int FX, int STRIDE>
void conv_gold(int16_t ifmap[(OY-1)*STRIDE+FY][(OX-1)*STRIDE+FX][IC],
               int16_t weight[FY][FX][IC][OC],
               int32_t ofmap[OY][OX][OC]){

  // Implement the functionality of a convolutional layer, which convolves
  // ifmap with weight to produce ofmap. Your code should assign values to the
  // ofmap array. Make sure you take STRIDE into account.
 
  // Your code starts here

  //first initialize ofmap to 0
  for (int i = 0; i < OY; i++) {
    for (int j = 0; j < OX; j++) {
      for (int k = 0; k < OC; k++) {
        ofmap[i][j][k] = 0;
      }
    }
  }

  //Based off Lectue 2 slides 33 with 6 for loops since batch size = 1
  for (int oy = 0; oy < OY; oy++) {
    for (int ox = 0; ox < OX; ox++) {
      for (int oc = 0; oc < OC; oc++) {
        for (int ic = 0; ic < IC; ic++) {
          for (int fy = 0; fy < FY; fy++) {
            for (int fx = 0; fx < FX; fx++) {
              ofmap[oy][ox][oc] += ifmap[oy*STRIDE + fy][ox*STRIDE + fx][ic] * weight[fy][fx][ic][oc];
              // ofmap[oc][ox][oy] += ifmap[oy*STRIDE + fy][ox*STRIDE + fx][ic] * weight[fy][fx][ic][oc];
            }
          }
        }
      }
    }
  } 

  // Your code ends here
}
