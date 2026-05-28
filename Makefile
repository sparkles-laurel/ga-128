.PHONY: all clean test

# Directories
SRC_DIR := src/logic/gates
SRC_128_DIR := src/logic/128b
TB_DIR := src/testbench
OUT_DIR := out
VCD_DIR := $(OUT_DIR)/vcd
TEST_DIR := test

# Gate modules (dependencies)
GATES := $(SRC_DIR)/nor_gate.v $(SRC_DIR)/not_gate.v

# Testbenches
NOR_TB := $(TB_DIR)/nor_gate_tb.v
AND_TB := $(TB_DIR)/and_gate_tb.v
OR_TB := $(TB_DIR)/or_gate_tb.v
NOT_TB := $(TB_DIR)/not_gate_tb.v
XOR_TB := $(TB_DIR)/xor_gate_tb.v
NOR_128_TB := $(TB_DIR)/nor_128_tb.v
AND_128_TB := $(TB_DIR)/and_128_tb.v
OR_128_TB := $(TB_DIR)/or_128_tb.v
NOT_128_TB := $(TB_DIR)/not_128_tb.v
XOR_128_TB := $(TB_DIR)/xor_128_tb.v
LATCH_128_TB := $(TB_DIR)/latch_128_tb.v

# Simulators
NOR_SIM := $(OUT_DIR)/nor_gate_sim
AND_SIM := $(OUT_DIR)/and_gate_sim
OR_SIM := $(OUT_DIR)/or_gate_sim
NOT_SIM := $(OUT_DIR)/not_gate_sim
XOR_SIM := $(OUT_DIR)/xor_gate_sim
NOR_128_SIM := $(OUT_DIR)/nor_128_sim
AND_128_SIM := $(OUT_DIR)/and_128_sim
OR_128_SIM := $(OUT_DIR)/or_128_sim
NOT_128_SIM := $(OUT_DIR)/not_128_sim
XOR_128_SIM := $(OUT_DIR)/xor_128_sim
LATCH_128_SIM := $(OUT_DIR)/latch_128_sim

SIMS := $(NOR_SIM) $(AND_SIM) $(OR_SIM) $(NOT_SIM) $(XOR_SIM)
SIMS += $(NOR_128_SIM) $(AND_128_SIM) $(OR_128_SIM) $(NOT_128_SIM) $(XOR_128_SIM)
SIMS += $(LATCH_128_SIM)

# All targets
all: $(SIMS)
	mkdir -p $(VCD_DIR)

# NOR gate compilation
$(NOR_SIM): $(GATES) $(NOR_TB)
	iverilog -o $@ $(GATES) $(NOR_TB)

# AND gate compilation (requires AND gate module)
$(AND_SIM): $(GATES) $(SRC_DIR)/and_gate.v $(AND_TB)
	iverilog -o $@ $(GATES) $(SRC_DIR)/and_gate.v $(AND_TB)

# OR gate compilation (requires OR gate module)
$(OR_SIM): $(GATES) $(SRC_DIR)/or_gate.v $(OR_TB)
	iverilog -o $@ $(GATES) $(SRC_DIR)/or_gate.v $(OR_TB)

# NOT gate compilation
$(NOT_SIM): $(GATES) $(NOT_TB)
	iverilog -o $@ $(GATES) $(NOT_TB)

# XOR gate compilation (requires AND, OR, and XOR modules)
$(XOR_SIM): $(GATES) $(SRC_DIR)/and_gate.v $(SRC_DIR)/or_gate.v $(SRC_DIR)/xor_gate.v $(XOR_TB)
	iverilog -o $@ $(GATES) $(SRC_DIR)/and_gate.v $(SRC_DIR)/or_gate.v $(SRC_DIR)/xor_gate.v $(XOR_TB)

# 128-bit NOR compilation
$(NOR_128_SIM): $(GATES) $(SRC_128_DIR)/nor.v $(NOR_128_TB)
	iverilog -o $@ $(GATES) $(SRC_128_DIR)/nor.v $(NOR_128_TB)

# 128-bit LATCH compilation
$(LATCH_128_SIM): $(GATES) $(SRC_128_DIR)/latch.v $(LATCH_128_TB)
	iverilog -o $@ $(GATES) $(SRC_128_DIR)/latch.v $(LATCH_128_TB)

# 128-bit AND compilation
$(AND_128_SIM): $(GATES) $(SRC_DIR)/and_gate.v $(SRC_128_DIR)/and.v $(AND_128_TB)
	iverilog -o $@ $(GATES) $(SRC_DIR)/and_gate.v $(SRC_128_DIR)/and.v $(AND_128_TB)

# 128-bit OR compilation
$(OR_128_SIM): $(GATES) $(SRC_DIR)/or_gate.v $(SRC_128_DIR)/or.v $(OR_128_TB)
	iverilog -o $@ $(GATES) $(SRC_DIR)/or_gate.v $(SRC_128_DIR)/or.v $(OR_128_TB)

# 128-bit NOT compilation
$(NOT_128_SIM): $(GATES) $(SRC_128_DIR)/not.v $(NOT_128_TB)
	iverilog -o $@ $(GATES) $(SRC_128_DIR)/not.v $(NOT_128_TB)

# 128-bit XOR compilation
$(XOR_128_SIM): $(GATES) $(SRC_DIR)/and_gate.v $(SRC_DIR)/or_gate.v $(SRC_DIR)/xor_gate.v $(SRC_128_DIR)/xor.v $(XOR_128_TB)
	iverilog -o $@ $(GATES) $(SRC_DIR)/and_gate.v $(SRC_DIR)/or_gate.v $(SRC_DIR)/xor_gate.v $(SRC_128_DIR)/xor.v $(XOR_128_TB)

# Run tests
test: all
	mkdir -p $(VCD_DIR)
	@echo "Running NOR gate test..."
	expect $(TEST_DIR)/nor_gate_tb.tcl
	@echo "Running AND gate test..."
	expect $(TEST_DIR)/and_gate_tb.tcl
	@echo "Running OR gate test..."
	expect $(TEST_DIR)/or_gate_tb.tcl
	@echo "Running NOT gate test..."
	expect $(TEST_DIR)/not_gate_tb.tcl
	@echo "Running XOR gate test..."
	expect $(TEST_DIR)/xor_gate_tb.tcl
	@echo "Running 128-bit NOR gate test..."
	expect $(TEST_DIR)/nor_128_tb.tcl
	@echo "Running 128-bit AND gate test..."
	expect $(TEST_DIR)/and_128_tb.tcl
	@echo "Running 128-bit OR gate test..."
	expect $(TEST_DIR)/or_128_tb.tcl
	@echo "Running 128-bit NOT gate test..."
	expect $(TEST_DIR)/not_128_tb.tcl
	@echo "Running 128-bit XOR gate test..."
	expect $(TEST_DIR)/xor_128_tb.tcl
	@echo "Running 128-bit LATCH test..."
	expect $(TEST_DIR)/latch_128_tb.tcl
	@echo "All tests passed!"

# Clean build artifacts
clean:
	rm -f $(OUT_DIR)/*_sim
	rm -rf $(VCD_DIR)
	rm -f *.vcd
