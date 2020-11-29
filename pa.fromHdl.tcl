
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name VGA -dir "C:/Users/Yasamin/Documents/Classes/COE758/Spartan3E-master/planAhead_run_1" -part xc3s500efg320-5
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "RGBGen.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {VGAController.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {refreshClk.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {RGBGen.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top RGBGen $srcset
add_files [list {RGBGen.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s500efg320-5
