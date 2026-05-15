~/llvm-project/build/bin/clang --target=riscv64 -march=rv64imafdv -mno-relax \
	-fuse-ld=/home/enemery/llvm-project/build/bin/ld.lld -static -nostdlib -Wl,--entry,main \
	test_functions.c -o test_functions.elf

