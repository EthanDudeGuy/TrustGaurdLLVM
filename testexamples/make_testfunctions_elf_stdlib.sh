#!/bin/bash
GCC_PATH=/usr/lib/gcc-cross/riscv64-linux-gnu/11
SYSROOT_LIB=/usr/riscv64-linux-gnu/lib

~/llvm-project/build/bin/clang \
 --target=riscv64-unknown-linux-gnu \
 --sysroot=/usr/riscv64-linux-gnu \
 --gcc-toolchain=/usr \
 -march=rv64imafd \
 -mno-relax \
 -fuse-ld=lld \
 -Wl,--no-relax \
 -nodefaultlibs \
 -L"$GCC_PATH" \
 -L"$SYSROOT_LIB" \
 -Wl,--entry,main \
 test_functions.c -O2 -o test_functions.elf \
 -l:libc.so.6 -lgcc -l:libgcc_s.so.1
