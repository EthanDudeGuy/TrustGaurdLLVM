~/llvm-project/build/bin/clang -target riscv64 -march=rv64gc -S t.c -o test_enter_untrusted.s
~/llvm-project/build/bin/clang -target riscv64 -march=rv64gc -emit-llvm -S t.c -o test_enter_untrusted.ll
~/llvm-project/build/bin/clang -target riscv64 -march=rv64gc -c test_enter_untrusted.s -o test_enter_untrusted.o
llvm-objdump -d test_enter_untrusted.o

