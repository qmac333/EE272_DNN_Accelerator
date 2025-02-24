# In conv_optimized & conv_optimized_tb (note syntax difference)
## Parameters for small 4x4 DNN accelerator
```
`define IFMAP_WEIGHT_WIDTH 8

`define IFMAP_WIDTH 8
`define WEIGHT_WIDTH 8
`define OFMAP_WIDTH 32

`define ARRAY_WIDTH 4
`define ARRAY_HEIGHT 4

`define WEIGHT_BANK_ADDR_WIDTH 10
`define WEIGHT_BANK_DEPTH 1024

`define IFMAP_BANK_ADDR_WIDTH 10
`define IFMAP_BANK_DEPTH 1024

`define WEIGHT_FIFO_WORDS 1
`define IFMAP_FIFO_WORDS 1
`define FIFO_WORDS 2
```

## Parameters for the original 16x16 DNN accelerator
```
`define IFMAP_WEIGHT_WIDTH 16

`define IFMAP_WIDTH 16
`define WEIGHT_WIDTH 16
`define OFMAP_WIDTH 32

`define ARRAY_WIDTH 16
`define ARRAY_HEIGHT 16

`define WEIGHT_BANK_ADDR_WIDTH 13
`define WEIGHT_BANK_DEPTH 8192

`define IFMAP_BANK_ADDR_WIDTH 12
`define IFMAP_BANK_DEPTH 4096

`define WEIGHT_FIFO_WORDS 4
`define IFMAP_FIFO_WORDS 4
`define FIFO_WORDS 8
```

Rest of the parameters are the same for the two designs.
