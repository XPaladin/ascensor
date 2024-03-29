# Begin_DVE_Session_Save_Info
# DVE full session
# Saved on Wed Dec 3 13:23:52 2008
# Designs open: 1
#   V1: /home/gjorquer/ascensor/test_top/vcdplus.vpd
# Toplevel windows open: 1
# 	TopLevel.1
#   Source.1: TOP_test_top
#   Group count = 2
#   Group TOP_test_top signal count = 2
#   Group io signal count = 12
# End_DVE_Session_Save_Info

# DVE version: Y-2006.06-SP2
# DVE build date: Mar 13 2008 23:06:26


#<Session mode="Full" path="/home/gjorquer/ascensor/DVEfiles/session.tcl" type="Debug">

gui_set_loading_session_type Post
gui_continuetime_set
gui_set_env SIMSETUP::SIMARGS { }
gui_set_env SIMSETUP::SIMEXE { }
gui_set_env SIMSETUP::ALLOW_POLL {0}

# Close design
if { [gui_sim_state -check active] } {
    gui_sim_terminate
    gui_sim_wait terminated
}
gui_close_db -all
gui_expr_clear_all

# Close all windows
gui_close_window -type Console
gui_close_window -type Wave
gui_close_window -type Source
gui_close_window -type Schematic
gui_close_window -type Data
gui_close_window -type DriverLoad
gui_close_window -type List
gui_close_window -type Memory
gui_close_window -type HSPane
gui_close_window -type DLPane
gui_close_window -type Assertion
gui_close_window -type CovHier
gui_close_window -type CoverageTable
gui_close_window -type CoverageMap
gui_close_window -type CovDensity
gui_close_window -type CovDetail
gui_close_window -type Local
gui_close_window -type Watch
gui_close_window -type Grading
gui_close_window -type Group



# Application preferences
gui_set_pref_value -key app_default_font -value {Helvetica,10,-1,5,50,0,0,0,0,0}
gui_src_preferences -tabstop 8 -maxbits 24 -windownumber 1
#<WindowLayout>

# DVE Topleve session: 


# Create and position top-level windows :TopLevel.1

if {![gui_exist_window -window TopLevel.1]} {
    set TopLevel.1 [ gui_create_window -type TopLevel \
       -icon $::env(DVE)/auxx/gui/images/toolbars/dvewin.xpm] 
} else { 
    set TopLevel.1 TopLevel.1
}
gui_show_window -window ${TopLevel.1} -show_state maximized -rect {{319 25} {1018 716}}

# ToolBar settings
gui_set_toolbar_attributes -toolbar {TimeOperations} -dock_state top
gui_set_toolbar_attributes -toolbar {TimeOperations} -offset 0
gui_show_toolbar -toolbar {TimeOperations}
gui_set_toolbar_attributes -toolbar {&File} -dock_state top
gui_set_toolbar_attributes -toolbar {&File} -offset 0
gui_show_toolbar -toolbar {&File}
gui_set_toolbar_attributes -toolbar {&Edit} -dock_state top
gui_set_toolbar_attributes -toolbar {&Edit} -offset 0
gui_show_toolbar -toolbar {&Edit}
gui_set_toolbar_attributes -toolbar {Simulator} -dock_state top
gui_set_toolbar_attributes -toolbar {Simulator} -offset 0
gui_show_toolbar -toolbar {Simulator}
gui_set_toolbar_attributes -toolbar {Signal} -dock_state top
gui_set_toolbar_attributes -toolbar {Signal} -offset 0
gui_show_toolbar -toolbar {Signal}
gui_set_toolbar_attributes -toolbar {&Scope} -dock_state top
gui_set_toolbar_attributes -toolbar {&Scope} -offset 0
gui_show_toolbar -toolbar {&Scope}
gui_set_toolbar_attributes -toolbar {&Trace} -dock_state top
gui_set_toolbar_attributes -toolbar {&Trace} -offset 0
gui_show_toolbar -toolbar {&Trace}
gui_set_toolbar_attributes -toolbar {&Window} -dock_state top
gui_set_toolbar_attributes -toolbar {&Window} -offset 0
gui_show_toolbar -toolbar {&Window}
gui_set_toolbar_attributes -toolbar {Zoom} -dock_state top
gui_set_toolbar_attributes -toolbar {Zoom} -offset 0
gui_show_toolbar -toolbar {Zoom}
gui_set_toolbar_attributes -toolbar {Zoom And Pan History} -dock_state top
gui_set_toolbar_attributes -toolbar {Zoom And Pan History} -offset 0
gui_show_toolbar -toolbar {Zoom And Pan History}

# End ToolBar settings

# Docked window settings
set HSPane.1 [gui_create_window -type HSPane -parent ${TopLevel.1} -dock_state left -dock_on_new_line true -dock_extent 251]
set Hier.1 [gui_share_window -id ${HSPane.1} -type Hier]
gui_set_window_pref_key -window ${HSPane.1} -key dock_width -value_type integer -value 251
gui_set_window_pref_key -window ${HSPane.1} -key dock_height -value_type integer -value -1
gui_set_window_pref_key -window ${HSPane.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${HSPane.1} {{left 0} {top 0} {width 250} {height 369} {show_state normal} {dock_state left} {dock_on_new_line true} {child_hier_colhier 153} {child_hier_coltype 100} {child_hier_col1 0} {child_hier_col2 1}}
set DLPane.1 [gui_create_window -type DLPane -parent ${TopLevel.1} -dock_state left -dock_on_new_line true -dock_extent 158]
set Data.1 [gui_share_window -id ${DLPane.1} -type Data]
gui_set_window_pref_key -window ${DLPane.1} -key dock_width -value_type integer -value 158
gui_set_window_pref_key -window ${DLPane.1} -key dock_height -value_type integer -value 359
gui_set_window_pref_key -window ${DLPane.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${DLPane.1} {{left 0} {top 0} {width 157} {height 369} {show_state normal} {dock_state left} {dock_on_new_line true} {child_data_colvariable 140} {child_data_colvalue 100} {child_data_coltype 40} {child_data_col1 0} {child_data_col2 1} {child_data_col3 2} {dataShowMode detail} {max_item_length 50}}
set Console.1 [gui_create_window -type Console -parent ${TopLevel.1} -dock_state bottom -dock_on_new_line true -dock_extent 177]
gui_set_window_pref_key -window ${Console.1} -key dock_width -value_type integer -value 700
gui_set_window_pref_key -window ${Console.1} -key dock_height -value_type integer -value 177
gui_set_window_pref_key -window ${Console.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${Console.1} {{left 0} {top 0} {width 699} {height 176} {show_state normal} {dock_state bottom} {dock_on_new_line true}}
#### Start - Readjusting docked view's offset / size
set dockAreaList { top left right bottom }
foreach dockArea $dockAreaList {
  set viewList [gui_ekki_get_window_ids -active_parent -dock_area $dockArea]
  foreach view $viewList {
      if {[lsearch -exact [gui_get_window_pref_keys -window $view] dock_width] != -1} {
        set dockWidth [gui_get_window_pref_value -window $view -key dock_width]
        set dockHeight [gui_get_window_pref_value -window $view -key dock_height]
        set offset [gui_get_window_pref_value -window $view -key dock_offset]
        if { [string equal "top" $dockArea] || [string equal "bottom" $dockArea]} {
          gui_set_window_attributes -window $view -dock_offset $offset -width $dockWidth
        } else {
          gui_set_window_attributes -window $view -dock_offset $offset -height $dockHeight
        }
      }
  }
}
#### End - Readjusting docked view's offset / size

# MDI window settings
set Source.1 [gui_create_window -type {Source}  -parent ${TopLevel.1}]
gui_show_window -window ${Source.1} -show_state maximized
gui_update_layout -id ${Source.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false}}
gui_set_active_window -window ${Source.1}

# End MDI window settings
gui_sync_global -id ${TopLevel.1} -option true
gui_set_active_window -window ${HSPane.1}

gui_set_env TOPLEVELS::TARGET_FRAME(Source) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(Schematic) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(PathSchematic) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(Wave) none
gui_set_env TOPLEVELS::TARGET_FRAME(List) none
gui_set_env TOPLEVELS::TARGET_FRAME(Memory) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(DriverLoad) none
gui_update_statusbar_target_frame ${TopLevel.1}
# Restore toplevel window zorder
gui_set_active_window -window ${TopLevel.1}

#</WindowLayout>

#<Database>

# DVE Open design session: 

gui_open_db -design V1 -file /home/gjorquer/ascensor/test_top/vcdplus.vpd -nosource
gui_set_precision 100ps
gui_set_time_units 100ps
#</Database>

# DVE Global setting session: 


# Global: Bus

# Global: Expressions

# Global: Signal Time Shift

# Global: Signal Compare

# Global: Signal Groups
gui_load_child_values {TOP_test_top}
gui_load_child_values {TOP_test_top.io}
set {TOP_test_top} {TOP_test_top}
gui_sg_create ${TOP_test_top}
gui_sg_addsignal -group ${TOP_test_top} { {TOP_test_top.simulation_cycle} {TOP_test_top.SystemClock} }
gui_set_radix -radix {decimal} -signals {TOP_test_top.simulation_cycle}
gui_set_radix -radix {twosComplement} -signals {TOP_test_top.simulation_cycle}
set {io} {io}
gui_sg_create ${io}
gui_sg_addsignal -group ${io} { {TOP_test_top.io.estado_puertas} {TOP_test_top.io.motor} {TOP_test_top.io.sensor_puertas} {TOP_test_top.io.botones} {TOP_test_top.io.boton_puertas} {TOP_test_top.io.cambio_piso} {TOP_test_top.io.puertas} {TOP_test_top.io.clk} {TOP_test_top.io.aviso} {TOP_test_top.io.luces} {TOP_test_top.io.display} {TOP_test_top.io.reset} }

# Global: Watch 'Watch'
gui_watch_page_delete -id Watch -all
gui_watch_page_add -id Watch
gui_watch_page_rename -id Watch -name {Watch 1}
gui_watch_page_add -id Watch
gui_watch_page_rename -id Watch -name {Watch 2}
gui_watch_page_add -id Watch
gui_watch_page_rename -id Watch -name {Watch 3}

# Post database loading setting...

# Restore C1 time
gui_set_time -C1_only 0



# Save global setting...

# Wave/List view global setting
gui_cov_show_value -switch false

# Close all empty TopLevel windows
foreach __top [gui_ekki_get_window_ids -type TopLevel] {
    if { [llength [gui_ekki_get_window_ids -parent $__top]] == 0} {
        gui_close_window -window $__top
    }
}
gui_set_loading_session_type noSession
# DVE View/pane content session: 


# Hier 'Hier.1'
gui_list_set_filter -id ${Hier.1} -list { {Package 1} {All 1} {Process 1} {UnnamedProcess 1} {Assertion 1} {Function 1} {LeafScCell 1} {LeafVlgCell 1} {LeafVhdCell 1} {NamedBlock 1} {Task 1} {VlgPackage 1} }
gui_hier_list_init -id ${Hier.1}
gui_change_design -id ${Hier.1} -design V1
catch {gui_list_expand -id ${Hier.1} TOP_test_top}
catch {gui_list_select -id ${Hier.1} {TOP_test_top.io}}
gui_view_scroll -id ${Hier.1} -vertical -set 0
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# Data 'Data.1'
gui_list_set_filter -id ${Data.1} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {Parameter 1} {All 1} {Aggregate 1} {Event 1} {Assertion 1} {Constant 1} {Signal 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Data.1} -text {*}
gui_list_show_data -id ${Data.1} {TOP_test_top.io}
gui_view_scroll -id ${Data.1} -vertical -set 0
gui_view_scroll -id ${Data.1} -horizontal -set 0
gui_view_scroll -id ${Hier.1} -vertical -set 0
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# Source 'Source.1'
gui_src_value_annotate -id ${Source.1} -switch false
gui_set_env TOGGLE::VALUEANNOTATE 0
gui_open_source -id ${Source.1}  -replace -active TOP_test_top -type {Scope}  /home/gjorquer/ascensor/test_top/top_test_top.sv
gui_view_scroll -id ${Source.1} -vertical -set 15
gui_src_set_reusable -id ${Source.1}
#</Session>

