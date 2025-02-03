

// Single port RAM with active chip select and active low word write mask
module SPRAM_MASK (Q, CLK, CSN, WEN, A, D , MASKN   );
   
   parameter words = 'd16;
   parameter width = 'd16;
   parameter addr_width = 4;
   parameter num_byte_enables = width;
   
   localparam byte_width = width / num_byte_enables;
   
   
   input [width-1:0] D;//Data input
   input [addr_width-1:0] A;//Read/write address
   input                  CSN;//Active low chip select
   input [num_byte_enables-1:0]      MASKN;//Active low word mask
   output                 reg [width-1:0] Q;//Data output
   input                  CLK;
   input                  WEN;//Active low write enable
   
   
   // synopsys translate_off
   reg [width-1:0]        mem [words-1:0];  
   
   integer                i;
   
   always @(posedge CLK)
   begin
      if ( CSN == 0 & WEN == 1)
	   Q <= mem[A];
      else
           Q <= {(width){1'bX}};

      if ( CSN == 0 )
        begin
           for (i = 0; i < num_byte_enables; i = i + 1)
             begin
//		if (CSN == 0 & WEN == 0 & MASKN[i*byte_width+:byte_width] == 0)
                if (CSN == 0 & WEN == 0 & MASKN[i] == 0)
                  mem[A][i*byte_width+:byte_width] <= D[i*byte_width+:byte_width];
             end
        end
   end
   
   
  // synopsys translate_on
   
endmodule

