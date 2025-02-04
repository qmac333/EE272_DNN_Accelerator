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
        // -------------------------------
        // Your code starts here
        // reading 4 inputs in at a time in din
        Params params = paramsIn.read();

        uint_16 IY0 = params.FY + params.STRIDE*(params.OY0-1);
        uint_16 IX0 = params.FX + params.STRIDE*(params.OX0-1);

        for (uint_16 oy1 = 0; oy1 < params.OY1; oy1++){
            for (uint_16 ox1 = 0; ox1 < params.OX1; ox1++){
                chanStruct<PackedInt<INPUT_PRECISION, IC0>, size> tile;
                PackedInt<INPUT_PRECISION, 4> fourinputs;
                for (uint_16 ic1 = 0; ic1 < params.IC1; ic1++){
                    for (uint_16 iy0 = 0; iy0 < IY0; iy0++){
                        for (uint_16 ix0 = 0; ix0 < IX0; ix0++){
                            for (uint_16 input_index = 0; input_index < IC0/4; input_index++){
                                fourinputs = din.read();
                                for (uint_16 j = 0; j < 4; j++){
                                    tile.data[ic1*IY0*IX0 + iy0*IX0 + ix0].value[input_index*4+j] = fourinputs.value[j];
                                }
                            }
                        }
                    }
                }
                dout.write(tile);
            }
        }
        // Your code ends here
        // -------------------------------
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
        // -------------------------------
        // Your code starts here
        Params params = paramsIn.read();

        // we want to read IC0 inputs at a time
        uint_16 IY0 = params.FY + params.STRIDE*(params.OY0-1);
        uint_16 IX0 = params.FX + params.STRIDE*(params.OX0-1);

        for (uint_16 oy1 = 0; oy1 < params.OY1; oy1++){
            for (uint16 ox1 = 0; ox1 < params.OX1; ox1++){
                chanStruct<PackedInt<INPUT_PRECISION, IC0>, size> tile = din.read();
                PackedInt<INPUT_PRECISION, IC0> inputs_to_systolic_array;
                for (uint_16 oc1 = 0; oc1 < params.OC1; oc1++){
                    for (uint_16 ic1 = 0; ic1 < params.IC1; ic1++){
                        for (uint_16 fy = 0; fy < params.FY; fy++){
                            for (uint_16 fx = 0; fx < params.FX; fx++){
                                for (uint_16 oy0 = 0; oy0 < params.OY0; oy0++){
                                    for (uint_16 ox0 = 0; ox0 < params.OX0; ox0++){
                                        inputs_to_systolic_array = tile.data[ic1*IY0*IX0 + (oy0*params.STRIDE+fy)*IY0 + (ox0*params.STRIDE + fx)];
                                        dout.write(inputs_to_systolic_array);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }  
        // Your code ends here
        // -------------------------------
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

        Params params = paramsIn.read();

        inputDoubleBufferReaderParams.write(params);
        inputDoubleBufferWriterParams.write(params);

        inputDoubleBufferWriter.run(inputDoubleBufferWriterParams, inputs_in, mem);

        inputDoubleBufferReader.run(inputDoubleBufferReaderParams, mem, inputs_out);
    }

private:
    ac_channel<chanStruct<PackedInt<INPUT_PRECISION, IC0>,size> > mem;
    
    InputDoubleBufferWriter<size, IC0, OC0> inputDoubleBufferWriter;
    ac_channel<Params> inputDoubleBufferWriterParams;
    
    InputDoubleBufferReader<size, IC0, OC0> inputDoubleBufferReader;
    ac_channel<Params> inputDoubleBufferReaderParams;
};

#endif
