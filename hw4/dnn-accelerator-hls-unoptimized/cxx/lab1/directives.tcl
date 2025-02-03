##
## Copyright 2003-2019 Siemens
##
#------------------------------------------------------------
# Basic Training: C++: Lab1
#------------------------------------------------------------

# This script merely runs the compilations described in the lab workbook.
logfile message "This Lab exercise is intended to be run from the shell and has no Catapult script associated with it\n" warning

# Establish the location of this script and use it to reference all
# other files in this example
set sfd [file dirname [info script]]
# Get path to Catapult install
set MGCHOME [application get /SYSTEM/ENV_MGC_HOME]
# Get path to GNU Make
set MAKE [file join $MGCHOME bin make]
# Create temporary directory to run in
set TDIR [utility tmpfile ccs_lab1_tmp]
file mkdir $TDIR

# Demonstrate first error
# catch {utility launch -directory $sfd -setenv MGC_HOME $MGCHOME -setenv TDIR $TDIR $MAKE tb0}
# Demonstrate second error
# catch {utility launch -directory $sfd -setenv MGC_HOME $MGCHOME -setenv TDIR $TDIR $MAKE tb1}
# Demonstrate clean run
utility launch -directory $sfd -setenv MGC_HOME $MGCHOME -setenv TDIR $TDIR $MAKE tb2
# Clean up temporary files
catch {file delete -force $TDIR}

# Flag to indicate SCVerify readiness
set can_simulate 0
