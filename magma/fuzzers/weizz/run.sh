#!/bin/bash

##
# Pre-requirements:
# - env FUZZER: path to fuzzer work dir
# - env TARGET: path to target work dir
# - env OUT: path to directory where artifacts are stored
# - env SHARED: path to directory shared with host (to store results)
# - env PROGRAM: name of program to run (should be found in $OUT)
# - env ARGS: extra arguments to pass to the program
# - env FUZZARGS: extra arguments to pass to the fuzzer
##

mkdir -p "$SHARED/findings"

export WEIZZ_SKIP_CPUFREQ=1
export WEIZZ_NO_AFFINITY=1
export WEIZZ_CTX_SENSITIVE=1
export WEIZZ_SKIP_CRASHES=1
export WEIZZ_I_DONT_CARE_ABOUT_MISSING_CRASHES=1

"$FUZZER/repo/weizz" -w -h -Q -L 8k -m none -t 1000+ \
    -i "$TARGET/corpus/$PROGRAM" -o "$SHARED/findings" \
    $FUZZARGS -- "$OUT/$PROGRAM" $ARGS 2>&1