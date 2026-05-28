spawn sh -c out/latch_128_sim

expect {
    -ex {FAIL:} { exit 1 }
    -ex {PASS: latch_128} {}
    eof { exit 1 }
    timeout { exit 1 }
}
expect eof
