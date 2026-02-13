~/llvm-project/build/bin/clang -target riscv64 -march=rv64imafdv -S t.c -o test_enter_untrusted.s
~/llvm-project/build/bin/clang -target riscv64 -march=rv64imafdv -emit-llvm -S t.c -o test_enter_untrusted.ll
~/llvm-project/build/bin/clang -target riscv64 -march=rv64imafdv -c test_enter_untrusted.s -o test_enter_untrusted.o
llvm-objdump -d test_enter_untrusted.o
llvm-objcopy -O binary --only-section=.text test_enter_untrusted.o test_enter_untrusted.bin
