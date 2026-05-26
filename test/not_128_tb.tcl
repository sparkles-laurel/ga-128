spawn sh -c out/not_128_sim

expect {
    -ex {FAIL:} { exit 1 }
    -ex {PASS: not_128} {}
    eof { exit 1 }
    timeout { exit 1 }
}
expect eof
