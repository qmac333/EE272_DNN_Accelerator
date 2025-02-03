##
## Copyright 2003-2019 Siemens
##
#------------------------------------------------------------
# Basic Training: C++: Lab7 Ignore Memory read before write
#------------------------------------------------------------

# Ignore write before read memory ops
if { ![catch {ignore_memory_precedences -from if:read_mem(mem:rsc.@) -to write_mem(mem:rsc.@)}] } { puts "apply constraint to read" }
if { ![catch {ignore_memory_precedences -from if#1:read_mem(mem:rsc.@) -to if#2:write_mem(mem:rsc.@)}] } { puts "apply constraint to nb read" }
if { ![catch {ignore_memory_precedences -from if#1:read_mem(mem:rsc.@) -to if#3:write_mem(mem:rsc.@)}] } { puts "apply constraint to nb read" }

