~/llvm-project/build/bin/clang -target riscv32 -march=rv32imafdv -S t.c -o test_enter_untrusted.s
~/llvm-project/build/bin/clang -target riscv32 -march=rv32imafdv -emit-llvm -S t.c -o test_enter_untrusted.ll
~/llvm-project/build/bin/clang -target riscv32 -march=rv32imafdv -c test_enter_untrusted.s -o test_enter_untrusted.o
llvm-objdump -d test_enter_untrusted.o

