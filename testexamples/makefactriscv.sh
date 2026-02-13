~/llvm-project/build/bin/clang -target riscv64 -march=rv64imafdv -S test_fact.c -o test_fact.s

~/llvm-project/build/bin/clang -target riscv64 -march=rv64imafdv -emit-llvm -S test_fact.c -o test_fact.ll

~/llvm-project/build/bin/clang -target riscv64 -march=rv64imafdv -c test_fact.s -o test_fact.o

llvm-objdump -d test_fact.o

llvm-objcopy -O binary --only-section=.text test_fact.o test_fact.bin

~/llvm-project/build/bin/clang --target=riscv64 -march=rv64imafdv -mno-relax -fuse-ld=/home/enemery/llvm-project/build/bin/ld.lld -static -nostdlib -Wl,--entry,main test_fact.c -o test_factorial.elf
