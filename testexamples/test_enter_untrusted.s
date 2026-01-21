	.attribute	4, 16
	.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zcf1p0"
	.file	"t.c"
	.text
	.globl	main                            # -- Begin function main
	.p2align	1
	.type	main,@function
main:                                   # @main
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)                      # 4-byte Folded Spill
	sw	s0, 24(sp)                      # 4-byte Folded Spill
	addi	s0, sp, 32
	li	a0, 0
	sw	a0, -12(s0)
	li	a1, -1
	sw	a1, -16(s0)
	enter_untrusted
	exit_untrusted
	lw	a1, -16(s0)
	put_sentry a1
	get_sentry a1
	sw	a1, -20(s0)
	alert_sentry
	lw	ra, 28(sp)                      # 4-byte Folded Reload
	lw	s0, 24(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 32
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        # -- End function
	.ident	"clang version 22.0.0git (https://github.com/EthanDudeGuy/TrustGaurdLLVM.git 5d8ab02f72577be26244f50c43a9e7dce4a261fb)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
