export XILINX_VIVADO:=$(HOME)/Xilinx/Vivado/2018.2
export PATH:=$(XILINX_VIVADO)/bin:$(PATH)

bitstream:
	vivado \
		-mode batch \
		-source scripts/bitstream.tcl \
		-nojournal \
		-nolog \
		vivado/picoevb.xpr

shell:
	vivado \
		-mode tcl \
		-nojournal \
		-nolog \
		vivado/picoevb.xpr
