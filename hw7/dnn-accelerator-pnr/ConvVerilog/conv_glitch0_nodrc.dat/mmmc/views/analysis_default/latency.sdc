set_clock_latency -source -early -min -rise  -1.63857 [get_ports {clk}] -clock ideal_clock 
set_clock_latency -source -early -min -fall  -1.60068 [get_ports {clk}] -clock ideal_clock 
set_clock_latency -source -early -max -rise  -1.63857 [get_ports {clk}] -clock ideal_clock 
set_clock_latency -source -early -max -fall  -1.60068 [get_ports {clk}] -clock ideal_clock 
set_clock_latency -source -late -min -rise  -1.63857 [get_ports {clk}] -clock ideal_clock 
set_clock_latency -source -late -min -fall  -1.60068 [get_ports {clk}] -clock ideal_clock 
set_clock_latency -source -late -max -rise  -1.63857 [get_ports {clk}] -clock ideal_clock 
set_clock_latency -source -late -max -fall  -1.60068 [get_ports {clk}] -clock ideal_clock 
