spawn sh -c out/nor_gate_sim

# expect VCD to start
expect -re {VCD info: dumpfile .*nor_gate_sim.vcd opened for output.}
expect -ex {EMULATE: NOR}
expect -ex {[10000 fs] Input a=0 b=0 => Output 1}
expect -ex {[20000 fs] Input a=0 b=1 => Output 0}
expect -ex {[30000 fs] Input a=1 b=0 => Output 0}
expect -ex {[40000 fs] Input a=1 b=1 => Output 0}
expect eof