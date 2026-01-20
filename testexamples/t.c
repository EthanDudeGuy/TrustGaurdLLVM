int main() {
    __builtin_riscv_enter_untrusted();
    __builtin_riscv_exit_untrusted();
    return 0;
}
