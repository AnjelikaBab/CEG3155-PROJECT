onerror {quit -f}
vlib work
vlog -work work CEG3155_PROJECT.vo
vlog -work work CEG3155_PROJECT.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.baudRateGenerator_vlg_vec_tst
vcd file -direction CEG3155_PROJECT.msim.vcd
vcd add -internal baudRateGenerator_vlg_vec_tst/*
vcd add -internal baudRateGenerator_vlg_vec_tst/i1/*
add wave /*
run -all
