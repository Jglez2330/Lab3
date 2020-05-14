transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Proyectos_Quartus/Lab3 {C:/Proyectos_Quartus/Lab3/flagZero_logic.sv}
vlog -sv -work work +incdir+C:/Proyectos_Quartus/Lab3 {C:/Proyectos_Quartus/Lab3/flagZero_logic_TestBench.sv}
vlog -sv -work work +incdir+C:/Proyectos_Quartus/Lab3 {C:/Proyectos_Quartus/Lab3/flag_unit.sv}
vlog -sv -work work +incdir+C:/Proyectos_Quartus/Lab3 {C:/Proyectos_Quartus/Lab3/flagV_logic_TestBench.sv}
vlog -sv -work work +incdir+C:/Proyectos_Quartus/Lab3 {C:/Proyectos_Quartus/Lab3/flagVB_logic.sv}

