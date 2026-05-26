spawn sh -c out/and_128_sim

expect {
    -ex {FAIL:} { exit 1 }
    -ex {PASS: and_128} {}
    eof { exit 1 }
    timeout { exit 1 }
}
expect eof
