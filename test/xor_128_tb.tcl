spawn sh -c out/xor_128_sim

expect {
    -ex {FAIL:} { exit 1 }
    -ex {PASS: xor_128} {}
    eof { exit 1 }
    timeout { exit 1 }
}
expect eof
