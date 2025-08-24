# Directories
ASM_DIR  = asm
TEST_DIR = test
SRC_DIR  = src
SIM_DIR  = sim
DAT_DIR  = dat
BIN_DIR  = bin
WAVE_DIR = wave

# Files
SIM  = $(BIN_DIR)/mips.vvp
TOP  = testbench
SRC  = $(wildcard $(SRC_DIR)/*.v) $(wildcard $(SIM_DIR)/*.v)
ASM  = ../$(ASM_DIR)/bin/MIPS_Assembler
TEST = $(TEST_DIR)/program.asm
HEX  = $(DAT_DIR)/program.hex
DUMP = $(WAVE_DIR)/dump.vcd

# Default target
all: run

# Ensure dirs exist
$(BIN_DIR) $(WAVE_DIR) $(DAT_DIR):
	mkdir -p $@

# Assemble program into hex
assemble: $(DAT_DIR)
	@echo "\033[33mStep 2: Assembly translated to machine code.\033[0m"
	$(ASM) $(TEST) $(HEX)

# Compile HDL into bin
compile: $(BIN_DIR) $(WAVE_DIR)
	@echo "\033[33mStep 3: Compiling HDL files and loading Machine code.\033[0m"
	iverilog -o $(SIM) -s $(TOP) $(SRC)

# Run simulation
simulate: $(SIM_DIR)
	@echo "\033[33mStep 4: Simulating instructions execution.\033[0m"
	vvp $(SIM)

# Open waveform
waveform: $(WAVE_DIR)
	@echo "\033[33mStep 5: Observe Execution in Waveform Viewer.\033[0m"
	gtkwave $(DUMP)

# Full run: assemble, compile, simulate, waveform
run: assemble compile simulate waveform
	@echo "\033[33mDemo complete successfuly.\033[0m"

clean:
	rm -rf $(BIN_DIR) $(WAVE_DIR) $(DAT_DIR)
