#!/bin/bash
set -e

##
# Pre-requirements:
# - env FUZZER: path to fuzzer work dir
##


git clone --no-checkout https://github.com/andreafioraldi/weizz-fuzzer "$FUZZER/repo"
git -C "$FUZZER/repo" checkout c9cbeef0b057b9f7dc62af9b20629090b1b9fe4f
#wget -O "$FUZZER/repo/afl_driver.cpp" \
#    "https://cs.chromium.org/codesearch/f/chromium/src/third_party/libFuzzer/src/afl/afl_driver.cpp"
cp "$FUZZER/src/qemu_driver.c" "$FUZZER/repo/qemu_driver.c"

# git clone https://github.com/vanhauser-thc/qemu_driver "$FUZZER/repo/qemu_driver" 
# git -C "$FUZZER/repo/qemu_driver" checkout 8ad9ad589b4881552fa7ef8b7d29cd9aeb5071bd
