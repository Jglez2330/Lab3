transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Proyectos_Quartus/Lab3 {C:/Proyectos_Quartus/Lab3/and_N.sv}
vlog -sv -work work +incdir+C:/Proyectos_Quartus/Lab3 {C:/Proyectos_Quartus/Lab3/logic_unit.sv}
vlog -sv -work work +incdir+C:/Proyectos_Quartus/Lab3 {C:/Proyectos_Quartus/Lab3/and_N_TestBench.sv}

