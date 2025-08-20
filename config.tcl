#PDK root, Std cell library to be given only when utilizing custom pdk
# Set the PDK root path
#set ::env(PDK_ROOT) "/home/abdulkhadeer/.volare/sky130A/ libs.tech/ openlane"

# Set the PDK (usually 'sky130A' or 'sky130')
#set ::env(PDK) "sky130A"

#set ::env(STD_CELL_LIBRARY) "sky130_fd_sc_hd"

set ::env(DESIGN_NAME) {galoi_lfsr}

# Include ALL Verilog files (top + submodules)
set ::env(VERILOG_FILES) [glob $::env(DESIGN_DIR)/src/*.v]

# Clock settings
set ::env(CLOCK_PORT) "clk"
set ::env(CLOCK_PERIOD) "50.0"

# SDC constraint file
set ::env(SDC_FILE) "$::env(DESIGN_DIR)/src/galoi_lfsr.sdc"

# PNR_SDC_File
set ::env(SDC_FILE) "$::env(DESIGN_DIR)/src/PNR_SDC_FILE.sdc"

#SIGNOFF_SDC
set ::env(SDC_FILE) "$::env(DESIGN_DIR)/src/SIGNOFF_SDC_FILE.sdc"

#running floorplan
set ::env(RUN_FLOORPLAN) 1

#custom io_placement.def file
set ::env(SDC_FILE) "$::env(DESIGN_DIR)/src/io_placement.def"

#Pin configurations
set ::env(FP_PIN_SIZE_CFG) "$::env(DESIGN_DIR)/src/pin_size.cfg"


# Floorplan tuning
# Overriding the core density change accordingly with error shown in terminal window
set ::env(PL_TARGET_DENSITY) 0.742
# How much of the core area to be utilized
set ::env(CORE_UTILIZATION) 50

# How much padding to a std cell needed to be given for easy routing
set ::env(GPL_CELL_PADDING) 2

# Defines the core width to length area
set ::env(FP_ASPECT_RATIO) 0.75

set ::env(FP_PDN_MULTILAYER) {1}

# Enabling Guard ring
set ::env(PL_ENABLE_GUARD_RING) 1

# Tap cell setup
set ::env(TAP_CELL) "sky130_fd_sc_hd__tapvpwrvgnd_1"
set ::env(TAP_INSERTION) 1

# Decap cell setup
set ::env(DECAP_CELL) "sky130_fd_sc_hd__decap_3"
set ::env(DECAP_INSERTION) 1
# fills 20% of filler space with decaps
set ::env(DECAP_RATIO) 0.2

# Filler cell setup
set ::env(FILL_CELL) "sky130_fd_sc_hd__fill_1 sky130_fd_sc_hd__fill_2 sky130_fd_sc_hd__fill_4 sky130_fd_sc_hd__fill_8"
set ::env(FILL_INSERTION) 1

# Change it only when getting error that pitch is too low
set ::env(FP_PDN_VPITCH) 6.6
set ::env(FP_PDN_HPITCH) 6.6

set tech_specific_config "$::env(DESIGN_DIR)/$::env(PDK)_$::env(STD_CELL_LIBRARY)_config.tcl"
if { [file exists $tech_specific_config] == 1 } {
    source $tech_specific_config
}
