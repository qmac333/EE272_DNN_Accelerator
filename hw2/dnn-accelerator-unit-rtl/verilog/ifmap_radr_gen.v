module ifmap_radr_gen
#( 
  parameter BANK_ADDR_WIDTH = 8
)(
  input clk,
  input rst_n,
  input adr_en,
  output [BANK_ADDR_WIDTH - 1 : 0] adr,
  input config_en,
  input [BANK_ADDR_WIDTH*8 - 1 : 0] config_data
);

  reg [BANK_ADDR_WIDTH - 1 : 0] config_OX0, config_OY0, config_FX, config_FY, 
    config_STRIDE, config_IX0, config_IY0, config_IC1;
  
  always @ (posedge clk) begin
    if (rst_n) begin
      if (config_en) begin
        {config_OX0, config_OY0, config_FX, config_FY, config_STRIDE, 
         config_IX0, config_IY0, config_IC1} <= config_data; 
      end
    end else begin
      {config_OX0, config_OY0, config_FX, config_FY, config_STRIDE, 
       config_IX0, config_IY0, config_IC1} <= 0;
    end
  end
  
  // This is the read address generator for the input double buffer. It is
  // more complex than the sequential address generator because there are
  // overlaps between the input tiles that are read out.  We have already
  // instantiated for you all the configuration registers that will hold the
  // various tiling parameters (OX0, OY0, FX, FY, STRIDE, IX0, IY0, IC1).
  // You need to generate address (adr) for the input buffer in the same
  // sequence as the C++ tiled convolution that you implemented. Make sure you
  // increment/step the address generator only when adr_en is high. Also reset
  // all registers when rst_n is low.  

// output_cell = oy*OX0 + ox
// position of filter in input = output_cell + 1
// filter_size = fx*fy
// number of filters per input row = (IX - FX)/STRIDE + 1
// conv_input_filter starting x position = 
// addr = oy*OX0 + ox + fx*STRIDE + (fy*IX0 + ic1)*IY0
//addr = (STRIDE*oy+fy)(STRIDE*ox+fx)*ic +
  
  // Your code starts here
  reg [BANK_ADDR_WIDTH - 1 : 0] fy, fx, ox, oy, ic1;

  assign adr = (ic1 * config_IY0 * config_IX0) + (oy * config_STRIDE + fy) * config_IY0 + (ox * config_STRIDE + fx);

  always @(posedge clk) begin
    if (!rst_n) begin
      fy <= 0;
      fx <= 0;
      oy <= 0;
      ox <= 0;
      ic1 <= 0;
    end else if (adr_en) begin
      // increment all the loop counters
      if (ox < config_OX0 - 1) begin
        ox <= ox + 1;
      end else begin
        ox <= 0;
        if (oy < config_OY0 - 1) begin
          oy <= oy + 1;
        end else begin
          oy <= 0;
          if (fx < config_FX - 1) begin
            fx <= fx + 1;
          end else begin
            fx <= 0;
            if (fy < config_FY - 1) begin
              fy <= fy + 1;
            end else begin
              fy <= 0; 
              if (ic1 < config_IC1 - 1) begin
                ic1 <= ic1 + 1;
              end else begin
                ic1 <= 0; // reset all loop counters to restart the loop
              end
            end
          end
        end
      end
    end
  end
  // Your code ends here
endmodule
