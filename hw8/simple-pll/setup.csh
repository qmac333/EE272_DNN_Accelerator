module load base magic netgen xcelium matlab/caddy

# copy the magic config file if it doesn't exist already
cp -n /farmshare/home/classes/ee/372/PDKs/volare_pdk/sky130A/libs.tech/magic/sky130A.magicrc .magicrc

# set the PDKPATH variable
setenv PDKPATH /farmshare/home/classes/ee/372/PDKs/volare_pdk/sky130A

# add search path
setenv PATH /cad/ngspice/33/bin:$PATH
setenv PATH /cad/gaw3/bin:$PATH
