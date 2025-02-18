#!/bin/csh -f

cd /home/users/jiajunc4/ee272/git_ee272/EE272_DNN_Accelerator/hw6/dnn-accelerator-syn/SramUnit/build/6-synopsys-vcs-sim

#This ENV is used to avoid overriding current script in next vcselab run 
setenv SNPS_VCSELAB_SCRIPT_NO_OVERRIDE  1

/cad/synopsys/vcs/S-2021.09-SP1/linux64/bin/vcselab $* \
    -o \
    simv \
    -nobanner \

cd -

