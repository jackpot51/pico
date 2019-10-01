cd vivado
write_cfgmem -force -format mcs -size 4 -interface SPIx4 \
	-loadbit {up 0x00000000 "./picoevb.runs/impl_1/project_bd_wrapper.bit" } \
	-file "../mcs/proj0.mcs"
