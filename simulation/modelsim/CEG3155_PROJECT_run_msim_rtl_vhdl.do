transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/arnav/Desktop/CEG3155-PROJECT/nBitShiftRegister.vhd}
vcom -93 -work work {C:/Users/arnav/Desktop/CEG3155-PROJECT/mux41.vhd}
vcom -93 -work work {C:/Users/arnav/Desktop/CEG3155-PROJECT/mux21.vhd}
vcom -93 -work work {C:/Users/arnav/Desktop/CEG3155-PROJECT/enardFF_2.vhd}
