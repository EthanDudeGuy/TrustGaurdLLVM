~/llvm-project/build/bin/clang --target=riscv64 -march=rv64imafdv -mno-relax \
	-fuse-ld=/home/enemery/llvm-project/build/bin/ld.lld -static -nostdlib -Wl,--entry,main \
	test_fact.c -o test_factorial.elf

# This extracts the ALREADY PATCHED instructions
llvm-objcopy -O binary --only-section=.text test_factorial.elf test_fact.bin
