#=========================================================================
# Makefile
#=========================================================================
# Generator : /home/users/jiajunc4/ee272/git_ee272/EE272_DNN_Accelerator/hw6/dnn-accelerator-syn/mflowgen/mflowgen/backends/make_backend.py

SHELL=/usr/bin/env bash -euo pipefail

# $1 -- $dst
# $2 -- $src
# $3 -- $stamp

define cpdir
	rm -rf ./$1
	cp -aL $2 $1 || true
	chmod -R +w $1
	touch $3
endef

# $1 -- $dst
# $2 -- $src
# $3 -- $stamp

define cpdir-and-parameterize
	rm -rf ./$1
	cp -aL $2 $1 || true
	chmod -R +w $1
	cp .mflowgen/$1/configure.yml $1
	touch $3
endef

# $1 -- $dst
# $2 -- $src
# $3 -- $stamp

define mkdir-and-symlink
	rm -rf ./$1
	mkdir -p $1
	cd $1 && ln -sf ../$2/* . && cd ..
	rm $1/configure.yml && cp .mflowgen/$1/configure.yml $1
	touch $3
endef

# $1 -- $dst_dir
# $2 -- $dst
# $3 -- $src
# $4 -- $stamp

define symlink
	mkdir -p $1
	cd $1 && ln -sf $3 $2 && touch $4
endef

# $1 -- $stamp

define stamp
	touch $1
endef

define make-subgraph-dir
       mkdir -p $1
       chmod -R +w $1
       cd $1 && mflowgen run --subgraph --design $2
       touch $3
endef

# Default

default: constraints info rtl skywater-130nm sram testbench synopsys-vcs-sim gen-saif-rtl synopsys-dc-synthesis

# ------------------------------------------------------------------------
# constraints
# ------------------------------------------------------------------------

# build dir

ifeq ("$(wildcard 0-constraints/.prebuilt)","")
0-constraints/.stamp:
	$(call cpdir-and-parameterize,0-constraints,../design/constraints,0-constraints/.stamp)
endif

# collect inputs

# execute

ifeq ("$(wildcard 0-constraints/.prebuilt)","")

define 0_constraints_commands_rule
	mkdir -p 0-constraints/outputs && set -o pipefail && /home/users/jiajunc4/ee272/git_ee272/EE272_DNN_Accelerator/hw6/dnn-accelerator-syn/mflowgen/mflowgen/scripts/mflowgen-letters -c -t constraints && chmod +x .mflowgen/0-constraints/mflowgen-run && cp -f .mflowgen/0-constraints/mflowgen-run 0-constraints && if [[ -e .mflowgen/0-constraints/mflowgen-debug ]]; then chmod +x .mflowgen/0-constraints/mflowgen-debug && cp -f .mflowgen/0-constraints/mflowgen-debug 0-constraints; fi && if [[ -e .mflowgen/0-constraints/mflowgen-check-preconditions.py ]]; then chmod +x .mflowgen/0-constraints/mflowgen-check-preconditions.py && cp -f .mflowgen/0-constraints/mflowgen-check-preconditions.py 0-constraints; fi && if [[ -e .mflowgen/0-constraints/mflowgen-check-postconditions.py ]]; then chmod +x .mflowgen/0-constraints/mflowgen-check-postconditions.py && cp -f .mflowgen/0-constraints/mflowgen-check-postconditions.py 0-constraints; fi && cd 0-constraints && if [[ -e mflowgen-check-preconditions.py ]]; then ./mflowgen-check-preconditions.py || exit 1; fi && ./mflowgen-run 2>&1 | tee mflowgen-run.log || exit 1 && cd .. && touch -c 0-constraints/outputs/*
endef

0-constraints/.execstamp: 0-constraints/.stamp
	$(call 0_constraints_commands_rule)
	touch $@

0-constraints/outputs/.execstamp.constraints.tcl: 0-constraints/.execstamp
	touch $@

endif

# collect outputs

0-constraints/outputs/.stamp.constraints.tcl: 0-constraints/.execstamp 0-constraints/outputs/.execstamp.constraints.tcl
	$(call stamp,0-constraints/outputs/.stamp.constraints.tcl)

# post-conditions

define 0_constraints_post_conditions_commands_rule
	cd 0-constraints && if [[ -e mflowgen-check-postconditions.py ]]; then ./mflowgen-check-postconditions.py || exit 1; fi && cd ..
endef

0-constraints/.postconditions.stamp: 0-constraints/.execstamp 0-constraints/outputs/.execstamp.constraints.tcl 0-constraints/outputs/.stamp.constraints.tcl
	$(call 0_constraints_post_conditions_commands_rule)
	touch $@

# alias

.PHONY: constraints

constraints: 0-constraints/.execstamp 0-constraints/.postconditions.stamp 0-constraints/outputs/.execstamp.constraints.tcl 0-constraints/outputs/.stamp.constraints.tcl

.PHONY: 0

0: 0-constraints/.execstamp 0-constraints/.postconditions.stamp 0-constraints/outputs/.execstamp.constraints.tcl 0-constraints/outputs/.stamp.constraints.tcl

# debug

# ------------------------------------------------------------------------
# info
# ------------------------------------------------------------------------

# build dir

ifeq ("$(wildcard 1-info/.prebuilt)","")
1-info/.stamp:
	$(call cpdir-and-parameterize,1-info,../../mflowgen/steps/info,1-info/.stamp)
endif

# collect inputs

# execute

ifeq ("$(wildcard 1-info/.prebuilt)","")

define 1_info_commands_rule
	mkdir -p 1-info/outputs && set -o pipefail && /home/users/jiajunc4/ee272/git_ee272/EE272_DNN_Accelerator/hw6/dnn-accelerator-syn/mflowgen/mflowgen/scripts/mflowgen-letters -c -t info && chmod +x .mflowgen/1-info/mflowgen-run && cp -f .mflowgen/1-info/mflowgen-run 1-info && if [[ -e .mflowgen/1-info/mflowgen-debug ]]; then chmod +x .mflowgen/1-info/mflowgen-debug && cp -f .mflowgen/1-info/mflowgen-debug 1-info; fi && if [[ -e .mflowgen/1-info/mflowgen-check-preconditions.py ]]; then chmod +x .mflowgen/1-info/mflowgen-check-preconditions.py && cp -f .mflowgen/1-info/mflowgen-check-preconditions.py 1-info; fi && if [[ -e .mflowgen/1-info/mflowgen-check-postconditions.py ]]; then chmod +x .mflowgen/1-info/mflowgen-check-postconditions.py && cp -f .mflowgen/1-info/mflowgen-check-postconditions.py 1-info; fi && cd 1-info && if [[ -e mflowgen-check-preconditions.py ]]; then ./mflowgen-check-preconditions.py || exit 1; fi && ./mflowgen-run 2>&1 | tee mflowgen-run.log || exit 1 && cd .. && touch -c 1-info/outputs/*
endef

1-info/.execstamp: 1-info/.stamp
	$(call 1_info_commands_rule)

1-info/.execstamp.execute-phony: 1-info/.execstamp
	touch $@

endif

# collect outputs

# post-conditions

define 1_info_post_conditions_commands_rule
	cd 1-info && if [[ -e mflowgen-check-postconditions.py ]]; then ./mflowgen-check-postconditions.py || exit 1; fi && cd ..
endef

1-info/.postconditions.stamp: 1-info/.execstamp 1-info/.execstamp.execute-phony
	$(call 1_info_post_conditions_commands_rule)
	touch $@

# alias

.PHONY: info

info: 1-info/.execstamp 1-info/.execstamp.execute-phony 1-info/.postconditions.stamp

.PHONY: 1

1: 1-info/.execstamp 1-info/.execstamp.execute-phony 1-info/.postconditions.stamp

# debug

# ------------------------------------------------------------------------
# rtl
# ------------------------------------------------------------------------

# build dir

ifeq ("$(wildcard 2-rtl/.prebuilt)","")
2-rtl/.stamp:
	$(call cpdir-and-parameterize,2-rtl,../design/rtl,2-rtl/.stamp)
endif

# collect inputs

# execute

ifeq ("$(wildcard 2-rtl/.prebuilt)","")

define 2_rtl_commands_rule
	mkdir -p 2-rtl/outputs && set -o pipefail && /home/users/jiajunc4/ee272/git_ee272/EE272_DNN_Accelerator/hw6/dnn-accelerator-syn/mflowgen/mflowgen/scripts/mflowgen-letters -c -t rtl && chmod +x .mflowgen/2-rtl/mflowgen-run && cp -f .mflowgen/2-rtl/mflowgen-run 2-rtl && if [[ -e .mflowgen/2-rtl/mflowgen-debug ]]; then chmod +x .mflowgen/2-rtl/mflowgen-debug && cp -f .mflowgen/2-rtl/mflowgen-debug 2-rtl; fi && if [[ -e .mflowgen/2-rtl/mflowgen-check-preconditions.py ]]; then chmod +x .mflowgen/2-rtl/mflowgen-check-preconditions.py && cp -f .mflowgen/2-rtl/mflowgen-check-preconditions.py 2-rtl; fi && if [[ -e .mflowgen/2-rtl/mflowgen-check-postconditions.py ]]; then chmod +x .mflowgen/2-rtl/mflowgen-check-postconditions.py && cp -f .mflowgen/2-rtl/mflowgen-check-postconditions.py 2-rtl; fi && cd 2-rtl && if [[ -e mflowgen-check-preconditions.py ]]; then ./mflowgen-check-preconditions.py || exit 1; fi && ./mflowgen-run 2>&1 | tee mflowgen-run.log || exit 1 && cd .. && touch -c 2-rtl/outputs/*
endef

2-rtl/.execstamp: 2-rtl/.stamp
	$(call 2_rtl_commands_rule)
	touch $@

2-rtl/outputs/.execstamp.design.v: 2-rtl/.execstamp
	touch $@
2-rtl/outputs/.execstamp.design.vcs.v: 2-rtl/.execstamp
	touch $@

endif

# collect outputs

2-rtl/outputs/.stamp.design.v: 2-rtl/.execstamp 2-rtl/outputs/.execstamp.design.v 2-rtl/outputs/.execstamp.design.vcs.v
	$(call stamp,2-rtl/outputs/.stamp.design.v)

2-rtl/outputs/.stamp.design.vcs.v: 2-rtl/.execstamp 2-rtl/outputs/.execstamp.design.v 2-rtl/outputs/.execstamp.design.vcs.v
	$(call stamp,2-rtl/outputs/.stamp.design.vcs.v)

# post-conditions

define 2_rtl_post_conditions_commands_rule
	cd 2-rtl && if [[ -e mflowgen-check-postconditions.py ]]; then ./mflowgen-check-postconditions.py || exit 1; fi && cd ..
endef

2-rtl/.postconditions.stamp: 2-rtl/.execstamp 2-rtl/outputs/.execstamp.design.v 2-rtl/outputs/.execstamp.design.vcs.v 2-rtl/outputs/.stamp.design.v 2-rtl/outputs/.stamp.design.vcs.v
	$(call 2_rtl_post_conditions_commands_rule)
	touch $@

# alias

.PHONY: rtl

rtl: 2-rtl/.execstamp 2-rtl/.postconditions.stamp 2-rtl/outputs/.execstamp.design.v 2-rtl/outputs/.execstamp.design.vcs.v 2-rtl/outputs/.stamp.design.v 2-rtl/outputs/.stamp.design.vcs.v

.PHONY: 2

2: 2-rtl/.execstamp 2-rtl/.postconditions.stamp 2-rtl/outputs/.execstamp.design.v 2-rtl/outputs/.execstamp.design.vcs.v 2-rtl/outputs/.stamp.design.v 2-rtl/outputs/.stamp.design.vcs.v

# debug

# ------------------------------------------------------------------------
# skywater-130nm
# ------------------------------------------------------------------------

# build dir

ifeq ("$(wildcard 3-skywater-130nm/.prebuilt)","")
3-skywater-130nm/.stamp:
	$(call cpdir-and-parameterize,3-skywater-130nm,../../../../../../../../../../farmshare/home/classes/ee/272/skywater-130nm-adk.v2021,3-skywater-130nm/.stamp)
endif

# collect inputs

# execute

ifeq ("$(wildcard 3-skywater-130nm/.prebuilt)","")

define 3_skywater_130nm_commands_rule
	mkdir -p 3-skywater-130nm/outputs && set -o pipefail && /home/users/jiajunc4/ee272/git_ee272/EE272_DNN_Accelerator/hw6/dnn-accelerator-syn/mflowgen/mflowgen/scripts/mflowgen-letters -c -t skywater-130nm && chmod +x .mflowgen/3-skywater-130nm/mflowgen-run && cp -f .mflowgen/3-skywater-130nm/mflowgen-run 3-skywater-130nm && if [[ -e .mflowgen/3-skywater-130nm/mflowgen-debug ]]; then chmod +x .mflowgen/3-skywater-130nm/mflowgen-debug && cp -f .mflowgen/3-skywater-130nm/mflowgen-debug 3-skywater-130nm; fi && if [[ -e .mflowgen/3-skywater-130nm/mflowgen-check-preconditions.py ]]; then chmod +x .mflowgen/3-skywater-130nm/mflowgen-check-preconditions.py && cp -f .mflowgen/3-skywater-130nm/mflowgen-check-preconditions.py 3-skywater-130nm; fi && if [[ -e .mflowgen/3-skywater-130nm/mflowgen-check-postconditions.py ]]; then chmod +x .mflowgen/3-skywater-130nm/mflowgen-check-postconditions.py && cp -f .mflowgen/3-skywater-130nm/mflowgen-check-postconditions.py 3-skywater-130nm; fi && cd 3-skywater-130nm && if [[ -e mflowgen-check-preconditions.py ]]; then ./mflowgen-check-preconditions.py || exit 1; fi && ./mflowgen-run 2>&1 | tee mflowgen-run.log || exit 1 && cd .. && touch -c 3-skywater-130nm/outputs/*
endef

3-skywater-130nm/.execstamp: 3-skywater-130nm/.stamp
	$(call 3_skywater_130nm_commands_rule)
	touch $@

3-skywater-130nm/outputs/.execstamp.adk: 3-skywater-130nm/.execstamp
	touch $@

endif

# collect outputs

3-skywater-130nm/outputs/.stamp.adk: 3-skywater-130nm/.execstamp 3-skywater-130nm/outputs/.execstamp.adk
	$(call stamp,3-skywater-130nm/outputs/.stamp.adk)

# post-conditions

define 3_skywater_130nm_post_conditions_commands_rule
	cd 3-skywater-130nm && if [[ -e mflowgen-check-postconditions.py ]]; then ./mflowgen-check-postconditions.py || exit 1; fi && cd ..
endef

3-skywater-130nm/.postconditions.stamp: 3-skywater-130nm/.execstamp 3-skywater-130nm/outputs/.execstamp.adk 3-skywater-130nm/outputs/.stamp.adk
	$(call 3_skywater_130nm_post_conditions_commands_rule)
	touch $@

# alias

.PHONY: skywater-130nm

skywater-130nm: 3-skywater-130nm/.execstamp 3-skywater-130nm/.postconditions.stamp 3-skywater-130nm/outputs/.execstamp.adk 3-skywater-130nm/outputs/.stamp.adk

.PHONY: 3

3: 3-skywater-130nm/.execstamp 3-skywater-130nm/.postconditions.stamp 3-skywater-130nm/outputs/.execstamp.adk 3-skywater-130nm/outputs/.stamp.adk

# debug

# ------------------------------------------------------------------------
# sram
# ------------------------------------------------------------------------

# build dir

ifeq ("$(wildcard 4-sram/.prebuilt)","")
4-sram/.stamp:
	$(call cpdir-and-parameterize,4-sram,../design/sram,4-sram/.stamp)
endif

# collect inputs

# execute

ifeq ("$(wildcard 4-sram/.prebuilt)","")

define 4_sram_commands_rule
	mkdir -p 4-sram/outputs && set -o pipefail && /home/users/jiajunc4/ee272/git_ee272/EE272_DNN_Accelerator/hw6/dnn-accelerator-syn/mflowgen/mflowgen/scripts/mflowgen-letters -c -t sram && chmod +x .mflowgen/4-sram/mflowgen-run && cp -f .mflowgen/4-sram/mflowgen-run 4-sram && if [[ -e .mflowgen/4-sram/mflowgen-debug ]]; then chmod +x .mflowgen/4-sram/mflowgen-debug && cp -f .mflowgen/4-sram/mflowgen-debug 4-sram; fi && if [[ -e .mflowgen/4-sram/mflowgen-check-preconditions.py ]]; then chmod +x .mflowgen/4-sram/mflowgen-check-preconditions.py && cp -f .mflowgen/4-sram/mflowgen-check-preconditions.py 4-sram; fi && if [[ -e .mflowgen/4-sram/mflowgen-check-postconditions.py ]]; then chmod +x .mflowgen/4-sram/mflowgen-check-postconditions.py && cp -f .mflowgen/4-sram/mflowgen-check-postconditions.py 4-sram; fi && cd 4-sram && if [[ -e mflowgen-check-preconditions.py ]]; then ./mflowgen-check-preconditions.py || exit 1; fi && ./mflowgen-run 2>&1 | tee mflowgen-run.log || exit 1 && cd .. && touch -c 4-sram/outputs/*
endef

4-sram/.execstamp: 4-sram/.stamp
	$(call 4_sram_commands_rule)
	touch $@

4-sram/outputs/.execstamp.sram.sp: 4-sram/.execstamp
	touch $@
4-sram/outputs/.execstamp.sram.v: 4-sram/.execstamp
	touch $@
4-sram/outputs/.execstamp.sram.lef: 4-sram/.execstamp
	touch $@
4-sram/outputs/.execstamp.sram_tt_1p8V_25C.lib: 4-sram/.execstamp
	touch $@
4-sram/outputs/.execstamp.sram_tt_1p8V_25C.db: 4-sram/.execstamp
	touch $@
4-sram/outputs/.execstamp.sram.gds: 4-sram/.execstamp
	touch $@

endif

# collect outputs

4-sram/outputs/.stamp.sram.sp: 4-sram/.execstamp 4-sram/outputs/.execstamp.sram.gds 4-sram/outputs/.execstamp.sram.lef 4-sram/outputs/.execstamp.sram.sp 4-sram/outputs/.execstamp.sram.v 4-sram/outputs/.execstamp.sram_tt_1p8V_25C.db 4-sram/outputs/.execstamp.sram_tt_1p8V_25C.lib
	$(call stamp,4-sram/outputs/.stamp.sram.sp)

4-sram/outputs/.stamp.sram.v: 4-sram/.execstamp 4-sram/outputs/.execstamp.sram.gds 4-sram/outputs/.execstamp.sram.lef 4-sram/outputs/.execstamp.sram.sp 4-sram/outputs/.execstamp.sram.v 4-sram/outputs/.execstamp.sram_tt_1p8V_25C.db 4-sram/outputs/.execstamp.sram_tt_1p8V_25C.lib
	$(call stamp,4-sram/outputs/.stamp.sram.v)

4-sram/outputs/.stamp.sram.lef: 4-sram/.execstamp 4-sram/outputs/.execstamp.sram.gds 4-sram/outputs/.execstamp.sram.lef 4-sram/outputs/.execstamp.sram.sp 4-sram/outputs/.execstamp.sram.v 4-sram/outputs/.execstamp.sram_tt_1p8V_25C.db 4-sram/outputs/.execstamp.sram_tt_1p8V_25C.lib
	$(call stamp,4-sram/outputs/.stamp.sram.lef)

4-sram/outputs/.stamp.sram_tt_1p8V_25C.lib: 4-sram/.execstamp 4-sram/outputs/.execstamp.sram.gds 4-sram/outputs/.execstamp.sram.lef 4-sram/outputs/.execstamp.sram.sp 4-sram/outputs/.execstamp.sram.v 4-sram/outputs/.execstamp.sram_tt_1p8V_25C.db 4-sram/outputs/.execstamp.sram_tt_1p8V_25C.lib
	$(call stamp,4-sram/outputs/.stamp.sram_tt_1p8V_25C.lib)

4-sram/outputs/.stamp.sram_tt_1p8V_25C.db: 4-sram/.execstamp 4-sram/outputs/.execstamp.sram.gds 4-sram/outputs/.execstamp.sram.lef 4-sram/outputs/.execstamp.sram.sp 4-sram/outputs/.execstamp.sram.v 4-sram/outputs/.execstamp.sram_tt_1p8V_25C.db 4-sram/outputs/.execstamp.sram_tt_1p8V_25C.lib
	$(call stamp,4-sram/outputs/.stamp.sram_tt_1p8V_25C.db)

4-sram/outputs/.stamp.sram.gds: 4-sram/.execstamp 4-sram/outputs/.execstamp.sram.gds 4-sram/outputs/.execstamp.sram.lef 4-sram/outputs/.execstamp.sram.sp 4-sram/outputs/.execstamp.sram.v 4-sram/outputs/.execstamp.sram_tt_1p8V_25C.db 4-sram/outputs/.execstamp.sram_tt_1p8V_25C.lib
	$(call stamp,4-sram/outputs/.stamp.sram.gds)

# post-conditions

define 4_sram_post_conditions_commands_rule
	cd 4-sram && if [[ -e mflowgen-check-postconditions.py ]]; then ./mflowgen-check-postconditions.py || exit 1; fi && cd ..
endef

4-sram/.postconditions.stamp: 4-sram/.execstamp 4-sram/outputs/.execstamp.sram.gds 4-sram/outputs/.execstamp.sram.lef 4-sram/outputs/.execstamp.sram.sp 4-sram/outputs/.execstamp.sram.v 4-sram/outputs/.execstamp.sram_tt_1p8V_25C.db 4-sram/outputs/.execstamp.sram_tt_1p8V_25C.lib 4-sram/outputs/.stamp.sram.gds 4-sram/outputs/.stamp.sram.lef 4-sram/outputs/.stamp.sram.sp 4-sram/outputs/.stamp.sram.v 4-sram/outputs/.stamp.sram_tt_1p8V_25C.db 4-sram/outputs/.stamp.sram_tt_1p8V_25C.lib
	$(call 4_sram_post_conditions_commands_rule)
	touch $@

# alias

.PHONY: sram

sram: 4-sram/.execstamp 4-sram/.postconditions.stamp 4-sram/outputs/.execstamp.sram.gds 4-sram/outputs/.execstamp.sram.lef 4-sram/outputs/.execstamp.sram.sp 4-sram/outputs/.execstamp.sram.v 4-sram/outputs/.execstamp.sram_tt_1p8V_25C.db 4-sram/outputs/.execstamp.sram_tt_1p8V_25C.lib 4-sram/outputs/.stamp.sram.gds 4-sram/outputs/.stamp.sram.lef 4-sram/outputs/.stamp.sram.sp 4-sram/outputs/.stamp.sram.v 4-sram/outputs/.stamp.sram_tt_1p8V_25C.db 4-sram/outputs/.stamp.sram_tt_1p8V_25C.lib

.PHONY: 4

4: 4-sram/.execstamp 4-sram/.postconditions.stamp 4-sram/outputs/.execstamp.sram.gds 4-sram/outputs/.execstamp.sram.lef 4-sram/outputs/.execstamp.sram.sp 4-sram/outputs/.execstamp.sram.v 4-sram/outputs/.execstamp.sram_tt_1p8V_25C.db 4-sram/outputs/.execstamp.sram_tt_1p8V_25C.lib 4-sram/outputs/.stamp.sram.gds 4-sram/outputs/.stamp.sram.lef 4-sram/outputs/.stamp.sram.sp 4-sram/outputs/.stamp.sram.v 4-sram/outputs/.stamp.sram_tt_1p8V_25C.db 4-sram/outputs/.stamp.sram_tt_1p8V_25C.lib

# debug

# ------------------------------------------------------------------------
# testbench
# ------------------------------------------------------------------------

# build dir

ifeq ("$(wildcard 5-testbench/.prebuilt)","")
5-testbench/.stamp:
	$(call cpdir-and-parameterize,5-testbench,../design/testbench,5-testbench/.stamp)
endif

# collect inputs

# execute

ifeq ("$(wildcard 5-testbench/.prebuilt)","")

define 5_testbench_commands_rule
	mkdir -p 5-testbench/outputs && set -o pipefail && /home/users/jiajunc4/ee272/git_ee272/EE272_DNN_Accelerator/hw6/dnn-accelerator-syn/mflowgen/mflowgen/scripts/mflowgen-letters -c -t testbench && chmod +x .mflowgen/5-testbench/mflowgen-run && cp -f .mflowgen/5-testbench/mflowgen-run 5-testbench && if [[ -e .mflowgen/5-testbench/mflowgen-debug ]]; then chmod +x .mflowgen/5-testbench/mflowgen-debug && cp -f .mflowgen/5-testbench/mflowgen-debug 5-testbench; fi && if [[ -e .mflowgen/5-testbench/mflowgen-check-preconditions.py ]]; then chmod +x .mflowgen/5-testbench/mflowgen-check-preconditions.py && cp -f .mflowgen/5-testbench/mflowgen-check-preconditions.py 5-testbench; fi && if [[ -e .mflowgen/5-testbench/mflowgen-check-postconditions.py ]]; then chmod +x .mflowgen/5-testbench/mflowgen-check-postconditions.py && cp -f .mflowgen/5-testbench/mflowgen-check-postconditions.py 5-testbench; fi && cd 5-testbench && if [[ -e mflowgen-check-preconditions.py ]]; then ./mflowgen-check-preconditions.py || exit 1; fi && ./mflowgen-run 2>&1 | tee mflowgen-run.log || exit 1 && cd .. && touch -c 5-testbench/outputs/*
endef

5-testbench/.execstamp: 5-testbench/.stamp
	$(call 5_testbench_commands_rule)
	touch $@

5-testbench/outputs/.execstamp.testbench.sv: 5-testbench/.execstamp
	touch $@
5-testbench/outputs/.execstamp.design.args: 5-testbench/.execstamp
	touch $@

endif

# collect outputs

5-testbench/outputs/.stamp.testbench.sv: 5-testbench/.execstamp 5-testbench/outputs/.execstamp.design.args 5-testbench/outputs/.execstamp.testbench.sv
	$(call stamp,5-testbench/outputs/.stamp.testbench.sv)

5-testbench/outputs/.stamp.design.args: 5-testbench/.execstamp 5-testbench/outputs/.execstamp.design.args 5-testbench/outputs/.execstamp.testbench.sv
	$(call stamp,5-testbench/outputs/.stamp.design.args)

# post-conditions

define 5_testbench_post_conditions_commands_rule
	cd 5-testbench && if [[ -e mflowgen-check-postconditions.py ]]; then ./mflowgen-check-postconditions.py || exit 1; fi && cd ..
endef

5-testbench/.postconditions.stamp: 5-testbench/.execstamp 5-testbench/outputs/.execstamp.design.args 5-testbench/outputs/.execstamp.testbench.sv 5-testbench/outputs/.stamp.design.args 5-testbench/outputs/.stamp.testbench.sv
	$(call 5_testbench_post_conditions_commands_rule)
	touch $@

# alias

.PHONY: testbench

testbench: 5-testbench/.execstamp 5-testbench/.postconditions.stamp 5-testbench/outputs/.execstamp.design.args 5-testbench/outputs/.execstamp.testbench.sv 5-testbench/outputs/.stamp.design.args 5-testbench/outputs/.stamp.testbench.sv

.PHONY: 5

5: 5-testbench/.execstamp 5-testbench/.postconditions.stamp 5-testbench/outputs/.execstamp.design.args 5-testbench/outputs/.execstamp.testbench.sv 5-testbench/outputs/.stamp.design.args 5-testbench/outputs/.stamp.testbench.sv

# debug

# ------------------------------------------------------------------------
# synopsys-vcs-sim
# ------------------------------------------------------------------------

# build dir

ifeq ("$(wildcard 6-synopsys-vcs-sim/.prebuilt)","")
6-synopsys-vcs-sim/.stamp: 2-rtl/.execstamp 2-rtl/.postconditions.stamp 2-rtl/outputs/.execstamp.design.v 2-rtl/outputs/.execstamp.design.vcs.v 2-rtl/outputs/.stamp.design.v 2-rtl/outputs/.stamp.design.vcs.v
6-synopsys-vcs-sim/.stamp: 4-sram/.execstamp 4-sram/.postconditions.stamp 4-sram/outputs/.execstamp.sram.gds 4-sram/outputs/.execstamp.sram.lef 4-sram/outputs/.execstamp.sram.sp 4-sram/outputs/.execstamp.sram.v 4-sram/outputs/.execstamp.sram_tt_1p8V_25C.db 4-sram/outputs/.execstamp.sram_tt_1p8V_25C.lib 4-sram/outputs/.stamp.sram.gds 4-sram/outputs/.stamp.sram.lef 4-sram/outputs/.stamp.sram.sp 4-sram/outputs/.stamp.sram.v 4-sram/outputs/.stamp.sram_tt_1p8V_25C.db 4-sram/outputs/.stamp.sram_tt_1p8V_25C.lib
6-synopsys-vcs-sim/.stamp: 5-testbench/.execstamp 5-testbench/.postconditions.stamp 5-testbench/outputs/.execstamp.design.args 5-testbench/outputs/.execstamp.testbench.sv 5-testbench/outputs/.stamp.design.args 5-testbench/outputs/.stamp.testbench.sv
6-synopsys-vcs-sim/.stamp:
	$(call cpdir-and-parameterize,6-synopsys-vcs-sim,../../mflowgen/steps/synopsys-vcs-sim,6-synopsys-vcs-sim/.stamp)
endif

# collect inputs

ifeq ("$(wildcard 6-synopsys-vcs-sim/.prebuilt)","")
6-synopsys-vcs-sim/inputs/.stamp.design.args: 6-synopsys-vcs-sim/.stamp 5-testbench/outputs/.stamp.design.args
	$(call symlink,6-synopsys-vcs-sim/inputs,design.args,../../5-testbench/outputs/design.args,.stamp.design.args)
endif

ifeq ("$(wildcard 6-synopsys-vcs-sim/.prebuilt)","")
6-synopsys-vcs-sim/inputs/.stamp.design.vcs.v: 6-synopsys-vcs-sim/.stamp 2-rtl/outputs/.stamp.design.vcs.v
	$(call symlink,6-synopsys-vcs-sim/inputs,design.vcs.v,../../2-rtl/outputs/design.vcs.v,.stamp.design.vcs.v)
endif

ifeq ("$(wildcard 6-synopsys-vcs-sim/.prebuilt)","")
6-synopsys-vcs-sim/inputs/.stamp.sram.v: 6-synopsys-vcs-sim/.stamp 4-sram/outputs/.stamp.sram.v
	$(call symlink,6-synopsys-vcs-sim/inputs,sram.v,../../4-sram/outputs/sram.v,.stamp.sram.v)
endif

ifeq ("$(wildcard 6-synopsys-vcs-sim/.prebuilt)","")
6-synopsys-vcs-sim/inputs/.stamp.testbench.sv: 6-synopsys-vcs-sim/.stamp 5-testbench/outputs/.stamp.testbench.sv
	$(call symlink,6-synopsys-vcs-sim/inputs,testbench.sv,../../5-testbench/outputs/testbench.sv,.stamp.testbench.sv)
endif

# execute

ifeq ("$(wildcard 6-synopsys-vcs-sim/.prebuilt)","")

define 6_synopsys_vcs_sim_commands_rule
	mkdir -p 6-synopsys-vcs-sim/outputs && set -o pipefail && /home/users/jiajunc4/ee272/git_ee272/EE272_DNN_Accelerator/hw6/dnn-accelerator-syn/mflowgen/mflowgen/scripts/mflowgen-letters -c -t synopsys-vcs-sim && chmod +x .mflowgen/6-synopsys-vcs-sim/mflowgen-run && cp -f .mflowgen/6-synopsys-vcs-sim/mflowgen-run 6-synopsys-vcs-sim && if [[ -e .mflowgen/6-synopsys-vcs-sim/mflowgen-debug ]]; then chmod +x .mflowgen/6-synopsys-vcs-sim/mflowgen-debug && cp -f .mflowgen/6-synopsys-vcs-sim/mflowgen-debug 6-synopsys-vcs-sim; fi && if [[ -e .mflowgen/6-synopsys-vcs-sim/mflowgen-check-preconditions.py ]]; then chmod +x .mflowgen/6-synopsys-vcs-sim/mflowgen-check-preconditions.py && cp -f .mflowgen/6-synopsys-vcs-sim/mflowgen-check-preconditions.py 6-synopsys-vcs-sim; fi && if [[ -e .mflowgen/6-synopsys-vcs-sim/mflowgen-check-postconditions.py ]]; then chmod +x .mflowgen/6-synopsys-vcs-sim/mflowgen-check-postconditions.py && cp -f .mflowgen/6-synopsys-vcs-sim/mflowgen-check-postconditions.py 6-synopsys-vcs-sim; fi && cd 6-synopsys-vcs-sim && if [[ -e mflowgen-check-preconditions.py ]]; then ./mflowgen-check-preconditions.py || exit 1; fi && ./mflowgen-run 2>&1 | tee mflowgen-run.log || exit 1 && cd .. && touch -c 6-synopsys-vcs-sim/outputs/*
endef

6-synopsys-vcs-sim/.execstamp: 6-synopsys-vcs-sim/.stamp 6-synopsys-vcs-sim/inputs/.stamp.design.args 6-synopsys-vcs-sim/inputs/.stamp.design.vcs.v 6-synopsys-vcs-sim/inputs/.stamp.sram.v 6-synopsys-vcs-sim/inputs/.stamp.testbench.sv
	$(call 6_synopsys_vcs_sim_commands_rule)
	touch $@

6-synopsys-vcs-sim/outputs/.execstamp.run.vcd: 6-synopsys-vcs-sim/.execstamp
	touch $@

endif

# collect outputs

6-synopsys-vcs-sim/outputs/.stamp.run.vcd: 6-synopsys-vcs-sim/.execstamp 6-synopsys-vcs-sim/outputs/.execstamp.run.vcd
	$(call stamp,6-synopsys-vcs-sim/outputs/.stamp.run.vcd)

# post-conditions

define 6_synopsys_vcs_sim_post_conditions_commands_rule
	cd 6-synopsys-vcs-sim && if [[ -e mflowgen-check-postconditions.py ]]; then ./mflowgen-check-postconditions.py || exit 1; fi && cd ..
endef

6-synopsys-vcs-sim/.postconditions.stamp: 6-synopsys-vcs-sim/.execstamp 6-synopsys-vcs-sim/outputs/.execstamp.run.vcd 6-synopsys-vcs-sim/outputs/.stamp.run.vcd
	$(call 6_synopsys_vcs_sim_post_conditions_commands_rule)
	touch $@

# alias

.PHONY: synopsys-vcs-sim

synopsys-vcs-sim: 6-synopsys-vcs-sim/.execstamp 6-synopsys-vcs-sim/.postconditions.stamp 6-synopsys-vcs-sim/outputs/.execstamp.run.vcd 6-synopsys-vcs-sim/outputs/.stamp.run.vcd

.PHONY: 6

6: 6-synopsys-vcs-sim/.execstamp 6-synopsys-vcs-sim/.postconditions.stamp 6-synopsys-vcs-sim/outputs/.execstamp.run.vcd 6-synopsys-vcs-sim/outputs/.stamp.run.vcd

# debug

# ------------------------------------------------------------------------
# gen-saif-rtl
# ------------------------------------------------------------------------

# build dir

ifeq ("$(wildcard 7-gen-saif-rtl/.prebuilt)","")
7-gen-saif-rtl/.stamp: 6-synopsys-vcs-sim/.execstamp 6-synopsys-vcs-sim/.postconditions.stamp 6-synopsys-vcs-sim/outputs/.execstamp.run.vcd 6-synopsys-vcs-sim/outputs/.stamp.run.vcd
7-gen-saif-rtl/.stamp:
	$(call cpdir-and-parameterize,7-gen-saif-rtl,../../mflowgen/steps/synopsys-vcd2saif-convert,7-gen-saif-rtl/.stamp)
endif

# collect inputs

ifeq ("$(wildcard 7-gen-saif-rtl/.prebuilt)","")
7-gen-saif-rtl/inputs/.stamp.run.vcd: 7-gen-saif-rtl/.stamp 6-synopsys-vcs-sim/outputs/.stamp.run.vcd
	$(call symlink,7-gen-saif-rtl/inputs,run.vcd,../../6-synopsys-vcs-sim/outputs/run.vcd,.stamp.run.vcd)
endif

# execute

ifeq ("$(wildcard 7-gen-saif-rtl/.prebuilt)","")

define 7_gen_saif_rtl_commands_rule
	mkdir -p 7-gen-saif-rtl/outputs && set -o pipefail && /home/users/jiajunc4/ee272/git_ee272/EE272_DNN_Accelerator/hw6/dnn-accelerator-syn/mflowgen/mflowgen/scripts/mflowgen-letters -c -t gen-saif-rtl && chmod +x .mflowgen/7-gen-saif-rtl/mflowgen-run && cp -f .mflowgen/7-gen-saif-rtl/mflowgen-run 7-gen-saif-rtl && if [[ -e .mflowgen/7-gen-saif-rtl/mflowgen-debug ]]; then chmod +x .mflowgen/7-gen-saif-rtl/mflowgen-debug && cp -f .mflowgen/7-gen-saif-rtl/mflowgen-debug 7-gen-saif-rtl; fi && if [[ -e .mflowgen/7-gen-saif-rtl/mflowgen-check-preconditions.py ]]; then chmod +x .mflowgen/7-gen-saif-rtl/mflowgen-check-preconditions.py && cp -f .mflowgen/7-gen-saif-rtl/mflowgen-check-preconditions.py 7-gen-saif-rtl; fi && if [[ -e .mflowgen/7-gen-saif-rtl/mflowgen-check-postconditions.py ]]; then chmod +x .mflowgen/7-gen-saif-rtl/mflowgen-check-postconditions.py && cp -f .mflowgen/7-gen-saif-rtl/mflowgen-check-postconditions.py 7-gen-saif-rtl; fi && cd 7-gen-saif-rtl && if [[ -e mflowgen-check-preconditions.py ]]; then ./mflowgen-check-preconditions.py || exit 1; fi && ./mflowgen-run 2>&1 | tee mflowgen-run.log || exit 1 && cd .. && touch -c 7-gen-saif-rtl/outputs/*
endef

7-gen-saif-rtl/.execstamp: 7-gen-saif-rtl/.stamp 7-gen-saif-rtl/inputs/.stamp.run.vcd
	$(call 7_gen_saif_rtl_commands_rule)
	touch $@

7-gen-saif-rtl/outputs/.execstamp.run.saif: 7-gen-saif-rtl/.execstamp
	touch $@

endif

# collect outputs

7-gen-saif-rtl/outputs/.stamp.run.saif: 7-gen-saif-rtl/.execstamp 7-gen-saif-rtl/outputs/.execstamp.run.saif
	$(call stamp,7-gen-saif-rtl/outputs/.stamp.run.saif)

# post-conditions

define 7_gen_saif_rtl_post_conditions_commands_rule
	cd 7-gen-saif-rtl && if [[ -e mflowgen-check-postconditions.py ]]; then ./mflowgen-check-postconditions.py || exit 1; fi && cd ..
endef

7-gen-saif-rtl/.postconditions.stamp: 7-gen-saif-rtl/.execstamp 7-gen-saif-rtl/outputs/.execstamp.run.saif 7-gen-saif-rtl/outputs/.stamp.run.saif
	$(call 7_gen_saif_rtl_post_conditions_commands_rule)
	touch $@

# alias

.PHONY: gen-saif-rtl

gen-saif-rtl: 7-gen-saif-rtl/.execstamp 7-gen-saif-rtl/.postconditions.stamp 7-gen-saif-rtl/outputs/.execstamp.run.saif 7-gen-saif-rtl/outputs/.stamp.run.saif

.PHONY: 7

7: 7-gen-saif-rtl/.execstamp 7-gen-saif-rtl/.postconditions.stamp 7-gen-saif-rtl/outputs/.execstamp.run.saif 7-gen-saif-rtl/outputs/.stamp.run.saif

# debug

# ------------------------------------------------------------------------
# synopsys-dc-synthesis
# ------------------------------------------------------------------------

# build dir

ifeq ("$(wildcard 8-synopsys-dc-synthesis/.prebuilt)","")
8-synopsys-dc-synthesis/.stamp: 0-constraints/.execstamp 0-constraints/.postconditions.stamp 0-constraints/outputs/.execstamp.constraints.tcl 0-constraints/outputs/.stamp.constraints.tcl
8-synopsys-dc-synthesis/.stamp: 2-rtl/.execstamp 2-rtl/.postconditions.stamp 2-rtl/outputs/.execstamp.design.v 2-rtl/outputs/.execstamp.design.vcs.v 2-rtl/outputs/.stamp.design.v 2-rtl/outputs/.stamp.design.vcs.v
8-synopsys-dc-synthesis/.stamp: 3-skywater-130nm/.execstamp 3-skywater-130nm/.postconditions.stamp 3-skywater-130nm/outputs/.execstamp.adk 3-skywater-130nm/outputs/.stamp.adk
8-synopsys-dc-synthesis/.stamp: 4-sram/.execstamp 4-sram/.postconditions.stamp 4-sram/outputs/.execstamp.sram.gds 4-sram/outputs/.execstamp.sram.lef 4-sram/outputs/.execstamp.sram.sp 4-sram/outputs/.execstamp.sram.v 4-sram/outputs/.execstamp.sram_tt_1p8V_25C.db 4-sram/outputs/.execstamp.sram_tt_1p8V_25C.lib 4-sram/outputs/.stamp.sram.gds 4-sram/outputs/.stamp.sram.lef 4-sram/outputs/.stamp.sram.sp 4-sram/outputs/.stamp.sram.v 4-sram/outputs/.stamp.sram_tt_1p8V_25C.db 4-sram/outputs/.stamp.sram_tt_1p8V_25C.lib
8-synopsys-dc-synthesis/.stamp: 7-gen-saif-rtl/.execstamp 7-gen-saif-rtl/.postconditions.stamp 7-gen-saif-rtl/outputs/.execstamp.run.saif 7-gen-saif-rtl/outputs/.stamp.run.saif
8-synopsys-dc-synthesis/.stamp:
	$(call cpdir-and-parameterize,8-synopsys-dc-synthesis,../../mflowgen/steps/synopsys-dc-synthesis,8-synopsys-dc-synthesis/.stamp)
endif

# collect inputs

ifeq ("$(wildcard 8-synopsys-dc-synthesis/.prebuilt)","")
8-synopsys-dc-synthesis/inputs/.stamp.adk: 8-synopsys-dc-synthesis/.stamp 3-skywater-130nm/outputs/.stamp.adk
	$(call symlink,8-synopsys-dc-synthesis/inputs,adk,../../3-skywater-130nm/outputs/adk,.stamp.adk)
endif

ifeq ("$(wildcard 8-synopsys-dc-synthesis/.prebuilt)","")
8-synopsys-dc-synthesis/inputs/.stamp.constraints.tcl: 8-synopsys-dc-synthesis/.stamp 0-constraints/outputs/.stamp.constraints.tcl
	$(call symlink,8-synopsys-dc-synthesis/inputs,constraints.tcl,../../0-constraints/outputs/constraints.tcl,.stamp.constraints.tcl)
endif

ifeq ("$(wildcard 8-synopsys-dc-synthesis/.prebuilt)","")
8-synopsys-dc-synthesis/inputs/.stamp.design.v: 8-synopsys-dc-synthesis/.stamp 2-rtl/outputs/.stamp.design.v
	$(call symlink,8-synopsys-dc-synthesis/inputs,design.v,../../2-rtl/outputs/design.v,.stamp.design.v)
endif

ifeq ("$(wildcard 8-synopsys-dc-synthesis/.prebuilt)","")
8-synopsys-dc-synthesis/inputs/.stamp.run.saif: 8-synopsys-dc-synthesis/.stamp 7-gen-saif-rtl/outputs/.stamp.run.saif
	$(call symlink,8-synopsys-dc-synthesis/inputs,run.saif,../../7-gen-saif-rtl/outputs/run.saif,.stamp.run.saif)
endif

ifeq ("$(wildcard 8-synopsys-dc-synthesis/.prebuilt)","")
8-synopsys-dc-synthesis/inputs/.stamp.sram_tt_1p8V_25C.db: 8-synopsys-dc-synthesis/.stamp 4-sram/outputs/.stamp.sram_tt_1p8V_25C.db
	$(call symlink,8-synopsys-dc-synthesis/inputs,sram_tt_1p8V_25C.db,../../4-sram/outputs/sram_tt_1p8V_25C.db,.stamp.sram_tt_1p8V_25C.db)
endif

# execute

ifeq ("$(wildcard 8-synopsys-dc-synthesis/.prebuilt)","")

define 8_synopsys_dc_synthesis_commands_rule
	mkdir -p 8-synopsys-dc-synthesis/outputs && set -o pipefail && /home/users/jiajunc4/ee272/git_ee272/EE272_DNN_Accelerator/hw6/dnn-accelerator-syn/mflowgen/mflowgen/scripts/mflowgen-letters -c -t synopsys-dc-synthesis && chmod +x .mflowgen/8-synopsys-dc-synthesis/mflowgen-run && cp -f .mflowgen/8-synopsys-dc-synthesis/mflowgen-run 8-synopsys-dc-synthesis && if [[ -e .mflowgen/8-synopsys-dc-synthesis/mflowgen-debug ]]; then chmod +x .mflowgen/8-synopsys-dc-synthesis/mflowgen-debug && cp -f .mflowgen/8-synopsys-dc-synthesis/mflowgen-debug 8-synopsys-dc-synthesis; fi && if [[ -e .mflowgen/8-synopsys-dc-synthesis/mflowgen-check-preconditions.py ]]; then chmod +x .mflowgen/8-synopsys-dc-synthesis/mflowgen-check-preconditions.py && cp -f .mflowgen/8-synopsys-dc-synthesis/mflowgen-check-preconditions.py 8-synopsys-dc-synthesis; fi && if [[ -e .mflowgen/8-synopsys-dc-synthesis/mflowgen-check-postconditions.py ]]; then chmod +x .mflowgen/8-synopsys-dc-synthesis/mflowgen-check-postconditions.py && cp -f .mflowgen/8-synopsys-dc-synthesis/mflowgen-check-postconditions.py 8-synopsys-dc-synthesis; fi && cd 8-synopsys-dc-synthesis && if [[ -e mflowgen-check-preconditions.py ]]; then ./mflowgen-check-preconditions.py || exit 1; fi && ./mflowgen-run 2>&1 | tee mflowgen-run.log || exit 1 && cd .. && touch -c 8-synopsys-dc-synthesis/outputs/*
endef

8-synopsys-dc-synthesis/.execstamp: 8-synopsys-dc-synthesis/.stamp 8-synopsys-dc-synthesis/inputs/.stamp.adk 8-synopsys-dc-synthesis/inputs/.stamp.constraints.tcl 8-synopsys-dc-synthesis/inputs/.stamp.design.v 8-synopsys-dc-synthesis/inputs/.stamp.run.saif 8-synopsys-dc-synthesis/inputs/.stamp.sram_tt_1p8V_25C.db
	$(call 8_synopsys_dc_synthesis_commands_rule)
	touch $@

8-synopsys-dc-synthesis/outputs/.execstamp.design.v: 8-synopsys-dc-synthesis/.execstamp
	touch $@
8-synopsys-dc-synthesis/outputs/.execstamp.design.sdc: 8-synopsys-dc-synthesis/.execstamp
	touch $@
8-synopsys-dc-synthesis/outputs/.execstamp.design.namemap: 8-synopsys-dc-synthesis/.execstamp
	touch $@
8-synopsys-dc-synthesis/outputs/.execstamp.design.svf: 8-synopsys-dc-synthesis/.execstamp
	touch $@
8-synopsys-dc-synthesis/outputs/.execstamp.design.upf: 8-synopsys-dc-synthesis/.execstamp
	touch $@

endif

# collect outputs

8-synopsys-dc-synthesis/outputs/.stamp.design.v: 8-synopsys-dc-synthesis/.execstamp 8-synopsys-dc-synthesis/outputs/.execstamp.design.namemap 8-synopsys-dc-synthesis/outputs/.execstamp.design.sdc 8-synopsys-dc-synthesis/outputs/.execstamp.design.svf 8-synopsys-dc-synthesis/outputs/.execstamp.design.upf 8-synopsys-dc-synthesis/outputs/.execstamp.design.v
	$(call stamp,8-synopsys-dc-synthesis/outputs/.stamp.design.v)

8-synopsys-dc-synthesis/outputs/.stamp.design.sdc: 8-synopsys-dc-synthesis/.execstamp 8-synopsys-dc-synthesis/outputs/.execstamp.design.namemap 8-synopsys-dc-synthesis/outputs/.execstamp.design.sdc 8-synopsys-dc-synthesis/outputs/.execstamp.design.svf 8-synopsys-dc-synthesis/outputs/.execstamp.design.upf 8-synopsys-dc-synthesis/outputs/.execstamp.design.v
	$(call stamp,8-synopsys-dc-synthesis/outputs/.stamp.design.sdc)

8-synopsys-dc-synthesis/outputs/.stamp.design.namemap: 8-synopsys-dc-synthesis/.execstamp 8-synopsys-dc-synthesis/outputs/.execstamp.design.namemap 8-synopsys-dc-synthesis/outputs/.execstamp.design.sdc 8-synopsys-dc-synthesis/outputs/.execstamp.design.svf 8-synopsys-dc-synthesis/outputs/.execstamp.design.upf 8-synopsys-dc-synthesis/outputs/.execstamp.design.v
	$(call stamp,8-synopsys-dc-synthesis/outputs/.stamp.design.namemap)

8-synopsys-dc-synthesis/outputs/.stamp.design.svf: 8-synopsys-dc-synthesis/.execstamp 8-synopsys-dc-synthesis/outputs/.execstamp.design.namemap 8-synopsys-dc-synthesis/outputs/.execstamp.design.sdc 8-synopsys-dc-synthesis/outputs/.execstamp.design.svf 8-synopsys-dc-synthesis/outputs/.execstamp.design.upf 8-synopsys-dc-synthesis/outputs/.execstamp.design.v
	$(call stamp,8-synopsys-dc-synthesis/outputs/.stamp.design.svf)

8-synopsys-dc-synthesis/outputs/.stamp.design.upf: 8-synopsys-dc-synthesis/.execstamp 8-synopsys-dc-synthesis/outputs/.execstamp.design.namemap 8-synopsys-dc-synthesis/outputs/.execstamp.design.sdc 8-synopsys-dc-synthesis/outputs/.execstamp.design.svf 8-synopsys-dc-synthesis/outputs/.execstamp.design.upf 8-synopsys-dc-synthesis/outputs/.execstamp.design.v
	$(call stamp,8-synopsys-dc-synthesis/outputs/.stamp.design.upf)

# post-conditions

define 8_synopsys_dc_synthesis_post_conditions_commands_rule
	cd 8-synopsys-dc-synthesis && if [[ -e mflowgen-check-postconditions.py ]]; then ./mflowgen-check-postconditions.py || exit 1; fi && cd ..
endef

8-synopsys-dc-synthesis/.postconditions.stamp: 8-synopsys-dc-synthesis/.execstamp 8-synopsys-dc-synthesis/outputs/.execstamp.design.namemap 8-synopsys-dc-synthesis/outputs/.execstamp.design.sdc 8-synopsys-dc-synthesis/outputs/.execstamp.design.svf 8-synopsys-dc-synthesis/outputs/.execstamp.design.upf 8-synopsys-dc-synthesis/outputs/.execstamp.design.v 8-synopsys-dc-synthesis/outputs/.stamp.design.namemap 8-synopsys-dc-synthesis/outputs/.stamp.design.sdc 8-synopsys-dc-synthesis/outputs/.stamp.design.svf 8-synopsys-dc-synthesis/outputs/.stamp.design.upf 8-synopsys-dc-synthesis/outputs/.stamp.design.v
	$(call 8_synopsys_dc_synthesis_post_conditions_commands_rule)
	touch $@

# alias

.PHONY: synopsys-dc-synthesis

synopsys-dc-synthesis: 8-synopsys-dc-synthesis/.execstamp 8-synopsys-dc-synthesis/.postconditions.stamp 8-synopsys-dc-synthesis/outputs/.execstamp.design.namemap 8-synopsys-dc-synthesis/outputs/.execstamp.design.sdc 8-synopsys-dc-synthesis/outputs/.execstamp.design.svf 8-synopsys-dc-synthesis/outputs/.execstamp.design.upf 8-synopsys-dc-synthesis/outputs/.execstamp.design.v 8-synopsys-dc-synthesis/outputs/.stamp.design.namemap 8-synopsys-dc-synthesis/outputs/.stamp.design.sdc 8-synopsys-dc-synthesis/outputs/.stamp.design.svf 8-synopsys-dc-synthesis/outputs/.stamp.design.upf 8-synopsys-dc-synthesis/outputs/.stamp.design.v

.PHONY: 8

8: 8-synopsys-dc-synthesis/.execstamp 8-synopsys-dc-synthesis/.postconditions.stamp 8-synopsys-dc-synthesis/outputs/.execstamp.design.namemap 8-synopsys-dc-synthesis/outputs/.execstamp.design.sdc 8-synopsys-dc-synthesis/outputs/.execstamp.design.svf 8-synopsys-dc-synthesis/outputs/.execstamp.design.upf 8-synopsys-dc-synthesis/outputs/.execstamp.design.v 8-synopsys-dc-synthesis/outputs/.stamp.design.namemap 8-synopsys-dc-synthesis/outputs/.stamp.design.sdc 8-synopsys-dc-synthesis/outputs/.stamp.design.svf 8-synopsys-dc-synthesis/outputs/.stamp.design.upf 8-synopsys-dc-synthesis/outputs/.stamp.design.v

# debug

define 8_debug_rule
	cd 8-synopsys-dc-synthesis && ./mflowgen-debug 2>&1 | tee mflowgen-debug.log
endef

debug-synopsys-dc-synthesis: 
	$(call 8_debug_rule)

.PHONY: debug-8

debug-8: debug-synopsys-dc-synthesis

# ------------------------------------------------------------------------
# Misc
# ------------------------------------------------------------------------

# Clean

.PHONY: clean-all

clean-all:
	@find . -maxdepth 1 ! -name Makefile ! -name .mflowgen\* ! -name \. ! -name \.\. -exec rm -rf {} +

.PHONY: clean-0

clean-0:
	rm -rf ./0-constraints

.PHONY: clean-constraints

clean-constraints: clean-0

.PHONY: clean-1

clean-1:
	rm -rf ./1-info

.PHONY: clean-info

clean-info: clean-1

.PHONY: clean-2

clean-2:
	rm -rf ./2-rtl

.PHONY: clean-rtl

clean-rtl: clean-2

.PHONY: clean-3

clean-3:
	rm -rf ./3-skywater-130nm

.PHONY: clean-skywater-130nm

clean-skywater-130nm: clean-3

.PHONY: clean-4

clean-4:
	rm -rf ./4-sram

.PHONY: clean-sram

clean-sram: clean-4

.PHONY: clean-5

clean-5:
	rm -rf ./5-testbench

.PHONY: clean-testbench

clean-testbench: clean-5

.PHONY: clean-6

clean-6:
	rm -rf ./6-synopsys-vcs-sim

.PHONY: clean-synopsys-vcs-sim

clean-synopsys-vcs-sim: clean-6

.PHONY: clean-7

clean-7:
	rm -rf ./7-gen-saif-rtl

.PHONY: clean-gen-saif-rtl

clean-gen-saif-rtl: clean-7

.PHONY: clean-8

clean-8:
	rm -rf ./8-synopsys-dc-synthesis

.PHONY: clean-synopsys-dc-synthesis

clean-synopsys-dc-synthesis: clean-8

# Diff

.PHONY: diff-0

diff-0:
	@echo && diff -r -u --minimal --exclude={configure.yml,.time_end,.time_start,mflowgen-run*,mflowgen-debug,.stamp,inputs,outputs} ../design/constraints 0-constraints | grep --color=always -e '^-.*' -e '$$' -e 'Only in ../design/constraints.*' | GREP_COLOR='01;32' grep --color=always -e '^+.*' -e '$$' -e 'Only in 0-constraints.*' && echo || true

.PHONY: diff-1

diff-1:
	@echo && diff -r -u --minimal --exclude={configure.yml,.time_end,.time_start,mflowgen-run*,mflowgen-debug,.stamp,inputs,outputs} ../../mflowgen/steps/info 1-info | grep --color=always -e '^-.*' -e '$$' -e 'Only in ../../mflowgen/steps/info.*' | GREP_COLOR='01;32' grep --color=always -e '^+.*' -e '$$' -e 'Only in 1-info.*' && echo || true

.PHONY: diff-2

diff-2:
	@echo && diff -r -u --minimal --exclude={configure.yml,.time_end,.time_start,mflowgen-run*,mflowgen-debug,.stamp,inputs,outputs} ../design/rtl 2-rtl | grep --color=always -e '^-.*' -e '$$' -e 'Only in ../design/rtl.*' | GREP_COLOR='01;32' grep --color=always -e '^+.*' -e '$$' -e 'Only in 2-rtl.*' && echo || true

.PHONY: diff-3

diff-3:
	@echo && diff -r -u --minimal --exclude={configure.yml,.time_end,.time_start,mflowgen-run*,mflowgen-debug,.stamp,inputs,outputs} ../../../../../../../../../../farmshare/home/classes/ee/272/skywater-130nm-adk.v2021 3-skywater-130nm | grep --color=always -e '^-.*' -e '$$' -e 'Only in ../../../../../../../../../../farmshare/home/classes/ee/272/skywater-130nm-adk.v2021.*' | GREP_COLOR='01;32' grep --color=always -e '^+.*' -e '$$' -e 'Only in 3-skywater-130nm.*' && echo || true

.PHONY: diff-4

diff-4:
	@echo && diff -r -u --minimal --exclude={configure.yml,.time_end,.time_start,mflowgen-run*,mflowgen-debug,.stamp,inputs,outputs} ../design/sram 4-sram | grep --color=always -e '^-.*' -e '$$' -e 'Only in ../design/sram.*' | GREP_COLOR='01;32' grep --color=always -e '^+.*' -e '$$' -e 'Only in 4-sram.*' && echo || true

.PHONY: diff-5

diff-5:
	@echo && diff -r -u --minimal --exclude={configure.yml,.time_end,.time_start,mflowgen-run*,mflowgen-debug,.stamp,inputs,outputs} ../design/testbench 5-testbench | grep --color=always -e '^-.*' -e '$$' -e 'Only in ../design/testbench.*' | GREP_COLOR='01;32' grep --color=always -e '^+.*' -e '$$' -e 'Only in 5-testbench.*' && echo || true

.PHONY: diff-6

diff-6:
	@echo && diff -r -u --minimal --exclude={configure.yml,.time_end,.time_start,mflowgen-run*,mflowgen-debug,.stamp,inputs,outputs} ../../mflowgen/steps/synopsys-vcs-sim 6-synopsys-vcs-sim | grep --color=always -e '^-.*' -e '$$' -e 'Only in ../../mflowgen/steps/synopsys-vcs-sim.*' | GREP_COLOR='01;32' grep --color=always -e '^+.*' -e '$$' -e 'Only in 6-synopsys-vcs-sim.*' && echo || true

.PHONY: diff-7

diff-7:
	@echo && diff -r -u --minimal --exclude={configure.yml,.time_end,.time_start,mflowgen-run*,mflowgen-debug,.stamp,inputs,outputs} ../../mflowgen/steps/synopsys-vcd2saif-convert 7-gen-saif-rtl | grep --color=always -e '^-.*' -e '$$' -e 'Only in ../../mflowgen/steps/synopsys-vcd2saif-convert.*' | GREP_COLOR='01;32' grep --color=always -e '^+.*' -e '$$' -e 'Only in 7-gen-saif-rtl.*' && echo || true

.PHONY: diff-8

diff-8:
	@echo && diff -r -u --minimal --exclude={configure.yml,.time_end,.time_start,mflowgen-run*,mflowgen-debug,.stamp,inputs,outputs} ../../mflowgen/steps/synopsys-dc-synthesis 8-synopsys-dc-synthesis | grep --color=always -e '^-.*' -e '$$' -e 'Only in ../../mflowgen/steps/synopsys-dc-synthesis.*' | GREP_COLOR='01;32' grep --color=always -e '^+.*' -e '$$' -e 'Only in 8-synopsys-dc-synthesis.*' && echo || true

# Info

.PHONY: info-0

info-0:
	@/home/users/jiajunc4/ee272/git_ee272/EE272_DNN_Accelerator/hw6/dnn-accelerator-syn/mflowgen/mflowgen/scripts/mflowgen-letters -c -t constraints && /home/users/jiajunc4/ee272/git_ee272/EE272_DNN_Accelerator/hw6/dnn-accelerator-syn/mflowgen/mflowgen/scripts/mflowgen-info -y .mflowgen/0-constraints/configure.yml

.PHONY: info-1

info-1:
	@/home/users/jiajunc4/ee272/git_ee272/EE272_DNN_Accelerator/hw6/dnn-accelerator-syn/mflowgen/mflowgen/scripts/mflowgen-letters -c -t info && /home/users/jiajunc4/ee272/git_ee272/EE272_DNN_Accelerator/hw6/dnn-accelerator-syn/mflowgen/mflowgen/scripts/mflowgen-info -y .mflowgen/1-info/configure.yml

.PHONY: info-2

info-2:
	@/home/users/jiajunc4/ee272/git_ee272/EE272_DNN_Accelerator/hw6/dnn-accelerator-syn/mflowgen/mflowgen/scripts/mflowgen-letters -c -t rtl && /home/users/jiajunc4/ee272/git_ee272/EE272_DNN_Accelerator/hw6/dnn-accelerator-syn/mflowgen/mflowgen/scripts/mflowgen-info -y .mflowgen/2-rtl/configure.yml

.PHONY: info-3

info-3:
	@/home/users/jiajunc4/ee272/git_ee272/EE272_DNN_Accelerator/hw6/dnn-accelerator-syn/mflowgen/mflowgen/scripts/mflowgen-letters -c -t skywater-130nm && /home/users/jiajunc4/ee272/git_ee272/EE272_DNN_Accelerator/hw6/dnn-accelerator-syn/mflowgen/mflowgen/scripts/mflowgen-info -y .mflowgen/3-skywater-130nm/configure.yml

.PHONY: info-4

info-4:
	@/home/users/jiajunc4/ee272/git_ee272/EE272_DNN_Accelerator/hw6/dnn-accelerator-syn/mflowgen/mflowgen/scripts/mflowgen-letters -c -t sram && /home/users/jiajunc4/ee272/git_ee272/EE272_DNN_Accelerator/hw6/dnn-accelerator-syn/mflowgen/mflowgen/scripts/mflowgen-info -y .mflowgen/4-sram/configure.yml

.PHONY: info-5

info-5:
	@/home/users/jiajunc4/ee272/git_ee272/EE272_DNN_Accelerator/hw6/dnn-accelerator-syn/mflowgen/mflowgen/scripts/mflowgen-letters -c -t testbench && /home/users/jiajunc4/ee272/git_ee272/EE272_DNN_Accelerator/hw6/dnn-accelerator-syn/mflowgen/mflowgen/scripts/mflowgen-info -y .mflowgen/5-testbench/configure.yml

.PHONY: info-6

info-6:
	@/home/users/jiajunc4/ee272/git_ee272/EE272_DNN_Accelerator/hw6/dnn-accelerator-syn/mflowgen/mflowgen/scripts/mflowgen-letters -c -t synopsys-vcs-sim && /home/users/jiajunc4/ee272/git_ee272/EE272_DNN_Accelerator/hw6/dnn-accelerator-syn/mflowgen/mflowgen/scripts/mflowgen-info -y .mflowgen/6-synopsys-vcs-sim/configure.yml

.PHONY: info-7

info-7:
	@/home/users/jiajunc4/ee272/git_ee272/EE272_DNN_Accelerator/hw6/dnn-accelerator-syn/mflowgen/mflowgen/scripts/mflowgen-letters -c -t gen-saif-rtl && /home/users/jiajunc4/ee272/git_ee272/EE272_DNN_Accelerator/hw6/dnn-accelerator-syn/mflowgen/mflowgen/scripts/mflowgen-info -y .mflowgen/7-gen-saif-rtl/configure.yml

.PHONY: info-8

info-8:
	@/home/users/jiajunc4/ee272/git_ee272/EE272_DNN_Accelerator/hw6/dnn-accelerator-syn/mflowgen/mflowgen/scripts/mflowgen-letters -c -t synopsys-dc-synthesis && /home/users/jiajunc4/ee272/git_ee272/EE272_DNN_Accelerator/hw6/dnn-accelerator-syn/mflowgen/mflowgen/scripts/mflowgen-info -y .mflowgen/8-synopsys-dc-synthesis/configure.yml

# Runtimes

.PHONY: runtimes

runtimes:
	@/home/users/jiajunc4/ee272/git_ee272/EE272_DNN_Accelerator/hw6/dnn-accelerator-syn/mflowgen/mflowgen/scripts/mflowgen-runtimes

# List

.PHONY: list

list:
	@echo && echo Generic Targets: && echo && printf " - %s\\n" "list      -- List all steps" "status    -- Print build status for each step" "runtimes  -- Print runtimes for each step" "graph     -- Generate a PDF of the step dependency graph" "clean-all -- Remove all build directories" "clean-N   -- Clean target N" "info-N    -- Print configured info for step N" "diff-N    -- Diff target N" && echo && echo Targets: && echo && printf " - %s\\n" "  0 : constraints" "  1 : info" "  2 : rtl" "  3 : skywater-130nm" "  4 : sram" "  5 : testbench" "  6 : synopsys-vcs-sim" "  7 : gen-saif-rtl" "  8 : synopsys-dc-synthesis" && echo && echo Debug Targets: && echo && printf " - %s\\n" "debug-8  : debug-synopsys-dc-synthesis" && echo

# Graph

.PHONY: graph

graph:
	dot -Tpdf .mflowgen/graph.dot > graph.pdf

# Status

.PHONY: status

status:
	@/home/users/jiajunc4/ee272/git_ee272/EE272_DNN_Accelerator/hw6/dnn-accelerator-syn/mflowgen/mflowgen/scripts/mflowgen-status --backend make -s 0-constraints,1-info,2-rtl,3-skywater-130nm,4-sram,5-testbench,6-synopsys-vcs-sim,7-gen-saif-rtl,8-synopsys-dc-synthesis

