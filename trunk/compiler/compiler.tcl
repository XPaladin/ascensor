# Library setup
set search_path "$search_path ."
set target_library [list lsi_10k.db]
set link_library [concat $target_library "*"]

# Analyze - Elaborate
analyze -f verilog {top.v registrador.v algoritmo.v interfaz_salida.v control_puertas.v timeout.v}
elaborate TOP

# Check design
check_design

# Constraints
#create_clock clk -p 5
set_max_area 5

# Compile
#compile_ultra
compile

# Save and exit
write -f verilog -hier -out mapped.v
exit
