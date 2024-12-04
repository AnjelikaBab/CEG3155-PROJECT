transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/arnav/Desktop/CEG3155-PROJECT/baudRateGenerator.vhd}
vcom -93 -work work {C:/Users/arnav/Desktop/CEG3155-PROJECT/mux81.vhd}
vcom -93 -work work {C:/Users/arnav/Desktop/CEG3155-PROJECT/oneBitComparator.vhd}
vcom -93 -work work {C:/Users/arnav/Desktop/CEG3155-PROJECT/oneBitAdderSubtractor.vhd}
vcom -93 -work work {C:/Users/arnav/Desktop/CEG3155-PROJECT/nbitregister.vhd}
vcom -93 -work work {C:/Users/arnav/Desktop/CEG3155-PROJECT/nBitIncrementer.vhd}
vcom -93 -work work {C:/Users/arnav/Desktop/CEG3155-PROJECT/nbitcomparator.vhd}
vcom -93 -work work {C:/Users/arnav/Desktop/CEG3155-PROJECT/nBitAdderSubtractor.vhd}
vcom -93 -work work {C:/Users/arnav/Desktop/CEG3155-PROJECT/mux41.vhd}
vcom -93 -work work {C:/Users/arnav/Desktop/CEG3155-PROJECT/mux21.vhd}
vcom -93 -work work {C:/Users/arnav/Desktop/CEG3155-PROJECT/enardFF_2.vhd}

