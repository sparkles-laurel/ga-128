spawn sh -c out/nor_128_sim

expect {
    -ex {FAIL:} { exit 1 }
    -ex {PASS: nor_128} {}
    eof { exit 1 }
    timeout { exit 1 }
}
expect eof
