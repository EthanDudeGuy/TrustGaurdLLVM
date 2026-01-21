~/llvm-project/build/bin/clang -target riscv32 -march=rv32gc -S t.c -o test_enter_untrusted.s
~/llvm-project/build/bin/clang -target riscv32 -march=rv32gc -emit-llvm -S t.c -o test_enter_untrusted.ll
~/llvm-project/build/bin/clang -target riscv32 -march=rv32gc -c test_enter_untrusted.s -o test_enter_untrusted.o
llvm-objdump -d test_enter_untrusted.o

