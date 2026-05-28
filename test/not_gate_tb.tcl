spawn sh -c out/not_gate_sim

# expect VCD to start
expect -re {VCD info: dumpfile .*not_gate_sim.vcd opened for output.}
expect -ex {EMULATE: NOT}
expect -ex {[10000 fs] Input in=0 => Output 1}
expect -ex {[20000 fs] Input in=1 => Output 0}
expect eof
