spawn sh -c out/or_128_sim

expect {
    -ex {FAIL:} { exit 1 }
    -ex {PASS: or_128} {}
    eof { exit 1 }
    timeout { exit 1 }
}
expect eof
