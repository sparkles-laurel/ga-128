.PHONY: all clean test

# Directories
SRC_DIR := src/logic/gates
TB_DIR := src/testbench
OUT_DIR := out
TEST_DIR := test

# Gate modules (dependencies)
GATES := $(SRC_DIR)/nor_gate.v $(SRC_DIR)/not_gate.v

# Testbenches
NOR_TB := $(TB_DIR)/nor_gate_tb.v
AND_TB := $(TB_DIR)/and_gate_tb.v
OR_TB := $(TB_DIR)/or_gate_tb.v
NOT_TB := $(TB_DIR)/not_gate_tb.v
XOR_TB := $(TB_DIR)/xor_gate_tb.v

# Simulators
NOR_SIM := $(OUT_DIR)/nor_gate_sim
AND_SIM := $(OUT_DIR)/and_gate_sim
OR_SIM := $(OUT_DIR)/or_gate_sim
NOT_SIM := $(OUT_DIR)/not_gate_sim
XOR_SIM := $(OUT_DIR)/xor_gate_sim

# All targets
all: $(NOR_SIM) $(AND_SIM) $(OR_SIM) $(NOT_SIM) $(XOR_SIM)

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

# Run tests
test: all
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
	@echo "All tests passed!"

# Clean build artifacts
clean:
	rm -f $(OUT_DIR)/*_sim
	rm -f *.vcd
