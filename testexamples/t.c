int main() {
	unsigned long x = 0xffffffff;
	unsigned long y;
	__builtin_riscv_enter_untrusted();
	__builtin_riscv_exit_untrusted();
	__builtin_riscv_put_sentry(x);
	y = __builtin_riscv_get_sentry();
	__builtin_riscv_alert_sentry();
	return 0;
}
