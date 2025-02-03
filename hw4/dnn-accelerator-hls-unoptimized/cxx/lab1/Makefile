#Set environment variable 'MGC_HOME' to point to your Catapult install path
#setenv MGC_HOME /tools/catapult/Catapult_Synthesis_10.3-793810/Mgc_home
#or export MGC_HOME=/tools/catapult/Catapult_Synthesis_10.3-793810/Mgc_home

IDIR =$(MGC_HOME)/shared/include
TDIR ?= $(MGC_HOME)/tmp
CC=$(MGC_HOME)/bin/g++
CFLAGS=-g

tb0: tb_pod_err.cpp test_chan_assert.cpp
	$(CC) -o $(TDIR)/tb tb_pod_err.cpp test.cpp -I$(IDIR) $(CFLAGS)
tb1: tb.cpp test_chan_assert.cpp
	$(CC) -o $(TDIR)/tb tb.cpp test_chan_assert.cpp -I$(IDIR) $(CFLAGS)
	$(TDIR)/tb
tb1_debug: tb.cpp test_chan_assert.cpp
	$(CC) -o $(TDIR)/tb tb.cpp test_chan_assert.cpp -I$(IDIR) $(CFLAGS)
	$(MGC_HOME)/bin/gdb $(TDIR)/tb
tb2: tb.cpp test_shift_loss.cpp
	$(CC) -o $(TDIR)/tb tb.cpp test_shift_loss.cpp -I$(IDIR) $(CFLAGS)
	$(TDIR)/tb
tb3: tb.cpp test.cpp
	$(CC) -o $(TDIR)/tb tb.cpp test.cpp -I$(IDIR) $(CFLAGS)
	$(TDIR)/tb

.PHONY: clean
clean:
	rm -f $(TDIR)/tb 

