onerror {quit -f}
vlib work
vlog -work work Arithmetic_LU.vo
vlog -work work Arithmetic_LU.vt
vsim -novopt -c -t 1ps -L cycloneiv_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Arithmetic_LU_vlg_vec_tst
vcd file -direction Arithmetic_LU.msim.vcd
vcd add -internal Arithmetic_LU_vlg_vec_tst/*
vcd add -internal Arithmetic_LU_vlg_vec_tst/i1/*
add wave /*
run -all
