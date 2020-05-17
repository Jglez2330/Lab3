transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/lab3_git {C:/lab3_git/and_N.sv}
vlog -sv -work work +incdir+C:/lab3_git {C:/lab3_git/and_N_TestBench.sv}

