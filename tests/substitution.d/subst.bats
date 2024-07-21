#!/usr/bin/env bats

load "$TESTDIR/utils.sh"

check_output_parser() {
    diff --strip-trailing-cr -uN "${1/parser/expected}" --label "${1/parser/expected}" <(sed -e '1d' < "$1") --label "output"
}

@test "Testing substitution.d - generation" {
    test_generate
    check_output_parser "substitution.d/parser.h"
    check_output_parser "substitution.d/parser.c"
}
