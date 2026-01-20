int main() {
	unsigned long x = 0xffffffff;
	__builtin_riscv_enter_untrusted();
	__builtin_riscv_exit_untrusted();
	__builtin_riscv_put_sentry(x);
	return 0;
}
