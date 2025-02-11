#ifndef INPUT_DOUBLE_BUFFER_H
#define INPUT_DOUBLE_BUFFER_H


template <int size, int IC0, int OC0>
class InputDoubleBufferWriter{
public:
    InputDoubleBufferWriter(){}

    #pragma hls_design interface
    void CCS_BLOCK(run)(ac_channel<Params> &paramsIn,
                        ac_channel<PackedInt<INPUT_PRECISION, 4> > &din,
                        ac_channel<chanStruct<PackedInt<INPUT_PRECISION,IC0>,size> > &dout)
    {
        #ifndef __SYNTHESIS__
        /* Note on ac_channel guards:
         * We expect to read numTiles * tileSize from din. Our C sim will run fine without
         * this guard since we explicitly write all the data before executing a kernel in the
         * testbench. However, it is good style and practice for writing modules in the future
         * since sometimes you cannot control when data will be written to a interface. For example,
         * if we decided connect our module to a memory simulation that writes din sporadically the
         * module will fail on a non-blocking din read in a C sim without the guard.
         */
        while (paramsIn.available(1) && din.available(
                    (paramsIn[0].OX1.to_int() * paramsIn[0].OY1.to_int() * 
                    ((paramsIn[0].OX0.to_int() - 1) * paramsIn[0].STRIDE.to_int() + paramsIn[0].FX.to_int()) *
                    ((paramsIn[0].OY0.to_int() - 1) * paramsIn[0].STRIDE.to_int() + paramsIn[0].FY).to_int() * paramsIn[0].IC1.to_int()) / 4))
        #endif
        {
            // -------------------------------
            // Your code starts here
            // -------------------------------

            Params params = paramsIn.read();
            ac_int<ac::log2_ceil<size+1>::val, false> tileSize = ((params.OX0 - 1) * params.STRIDE + params.FX) * 
                                ((params.OY0 - 1) * params.STRIDE + params.FY) * 
                                params.IC1;
            ac_int<ac::log2_ceil<size+1>::val, false> tileSize_MAX = ((OX0_MAX - 1) * STRIDE_MAX + FX_MAX) * ((OY0_MAX - 1) * STRIDE_MAX + FY_MAX) * IC1_MAX;

            #pragma hls_pipeline_init_interval 1            
            TILES: for (int t = 0; t < OX1_MAX*OY1_MAX; t++) {
                chanStruct<PackedInt<INPUT_PRECISION,IC0>,size> tmp;

                // record one tile in buffer
                // #pragma hls_pipeline_init_interval 1
                TILE: for (int i = 0; i < tileSize_MAX; i++) {
                    PackedInt<INPUT_PRECISION, IC0> memCol;  // one column in the memory
                    // each packet contains 4 values, pack IC0 tgt into one row
                    for (int j = 0; j < IC0_MAX; j=j+4) {
                        PackedInt<INPUT_PRECISION, 4> packet = din.read();
                        #pragma hls_unroll yes
                        for (int k = 0; k < 4; k++) {
                            memCol.value[j+k] = packet.value[k];
                        }
                        if (j == IC0 - 4) {
                            break;
                        }
                    }
                    tmp.data[i] = memCol;
                    if (i == tileSize-1) break;
                } // TILE
                // write a tile
                dout.write(tmp);
                if (t == params.OX1 * params.OY1 - 1) break;
            } // TILES

            // -------------------------------
            // Your code ends here
            // -------------------------------
        }
    }
};

template <int size, int IC0, int OC0>
class InputDoubleBufferReader{
public:
    InputDoubleBufferReader(){}

    #pragma hls_design interface
    void CCS_BLOCK(run)(ac_channel<Params> &paramsIn,
                        ac_channel<chanStruct<PackedInt<INPUT_PRECISION, IC0>,size> > &din, 
                        ac_channel<PackedInt<INPUT_PRECISION, IC0> > &dout)
    {
        #ifndef __SYNTHESIS__
        while (paramsIn.available(1) && din.available(paramsIn[0].OX1.to_int() * paramsIn[0].OY1.to_int()))
        #endif
        {
            // -------------------------------
            // Your code starts here
            // -------------------------------

            Params params = paramsIn.read();
            uint_16 IX0 = (params.OX0 - 1) * params.STRIDE + params.FX;
            uint_16 IY0 = (params.OY0 - 1) * params.STRIDE + params.FY;

            #pragma hls_pipeline_init_interval 1
            TILES: for (int t = 0; t < OX1_MAX*OY1_MAX; t++) {
                chanStruct<PackedInt<INPUT_PRECISION, IC0>,size> tmp;
                
                // read one tile from memory, and pass out one address at a time in the correct order
                tmp = din.read();
                // OC1 reuses
                // #pragma hls_pipeline_init_interval 1
                OC1: for (int oc1 = 0; oc1 < OC1_MAX; oc1++) {
                    IC1: for (int ic1 = 0; ic1 < IC1_MAX; ic1++) {
                        FY: for (int fy = 0; fy < FY_MAX; fy++) {
                            FX: for (int fx = 0; fx < FX_MAX; fx++) {
                                OY0: for (int oy0 = 0; oy0 < OY0_MAX; oy0++) { 
                                    OX0: for (int ox0 = 0; ox0 < OX0_MAX; ox0++) { 
                                        uint_16 address = 
                                                params.STRIDE * ox0 + fx +
                                                (params.STRIDE * oy0 + fy) * IX0 +
                                                IY0 * IX0 * ic1;
                                        dout.write(tmp.data[address]);

                                        if (ox0 == params.OX0 - 1) break;
                                    } // OX0
                                    if (oy0 == params.OY0 - 1) break;
                                } // OY0
                                if (fx == params.FX - 1) break;
                            } // FX
                            if (fy == params.FY - 1) break;
                        } // FY
                        if (ic1 == params.IC1 - 1) break;
                    } // IC1
                    if (oc1 == params.OC1 - 1) break;
                } // OC1
                if (t == params.OX1 * params.OY1 - 1) break; 
            } // TILES

            // -------------------------------
            // Your code ends here
            // -------------------------------
        }
    }
};

template <int size, int IC0, int OC0>
class InputDoubleBuffer{
public:
  InputDoubleBuffer(){}

  #pragma hls_design interface
  void CCS_BLOCK(run)(ac_channel<PackedInt<INPUT_PRECISION, 4> > &inputs_in, 
                      ac_channel<PackedInt<INPUT_PRECISION, IC0> > &inputs_out,
                      ac_channel<Params> &paramsIn)
    {

        #ifndef __SYNTHESIS__
        while (paramsIn.available(1))
        #endif
        {
            Params params = paramsIn.read();

            inputDoubleBufferReaderParams.write(params);
            inputDoubleBufferWriterParams.write(params);

            inputDoubleBufferWriter.run(inputDoubleBufferWriterParams, inputs_in, mem);

            inputDoubleBufferReader.run(inputDoubleBufferReaderParams, mem, inputs_out);
        }
    }

private:
    ac_channel<chanStruct<PackedInt<INPUT_PRECISION, IC0>,size> > mem;
    
    InputDoubleBufferWriter<size, IC0, OC0> inputDoubleBufferWriter;
    ac_channel<Params> inputDoubleBufferWriterParams;
    
    InputDoubleBufferReader<size, IC0, OC0> inputDoubleBufferReader;
    ac_channel<Params> inputDoubleBufferReaderParams;
};

#endif
