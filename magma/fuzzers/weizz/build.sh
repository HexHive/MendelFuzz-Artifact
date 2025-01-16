#!/bin/bash
set -e

##
# Pre-requirements:
# - env FUZZER: path to fuzzer work dir
##

if [ ! -d "$FUZZER/repo" ]; then
    echo "fetch.sh must be executed first."
    exit 1
fi

pushd "$FUZZER/repo"
export CC=clang-8 && export CXX=clang++-8 && \
    CFLAGS="-O3 -funroll-loops" make

clang-8 $CFLAGS -c "qemu_driver.c" -fPIC -o "$OUT/qemu_driver.o"

popd

