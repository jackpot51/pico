export XILINX_VIVADO:=$(HOME)/Xilinx/Vivado/2018.2
export PATH:=$(XILINX_VIVADO)/bin:$(PATH)

BITSTREAM=vivado/picoevb.runs/impl_1/project_bd_wrapper.bit
ROM=vivado/mcs/proj0.mcs

all: $(BITSTREAM) $(ROM)

bitstream: $(BITSTREAM)

$(BITSTREAM):
	vivado \
		-mode batch \
		-source scripts/bitstream.tcl \
		-nojournal \
		-nolog \
		vivado/picoevb.xpr

rom: $(ROM)

$(ROM): $(BITSTREAM)
	vivado \
		-mode batch \
		-source scripts/rom.tcl \
		-nojournal \
		-nolog \
		vivado/picoevb.xpr

connect:
	vivado \
		-mode batch \
		-source scripts/connect.tcl \
		-nojournal \
		-nolog \
		vivado/picoevb.xpr

gui:
	vivado \
		-mode gui \
		-nojournal \
		-nolog \
		vivado/picoevb.xpr

shell:
	vivado \
		-mode tcl \
		-nojournal \
		-nolog \
		vivado/picoevb.xpr

xvcd/linux/bin/xvcd:
	make -C xvcd/linux

xvcd: xvcd/linux/bin/xvcd
	sudo ./$< -p 2542 -s i:0x0403:0x6015:0
