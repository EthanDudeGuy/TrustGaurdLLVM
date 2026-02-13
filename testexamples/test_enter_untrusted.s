	.attribute	4, 16
	.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_d2p2_v1p0_zicsr2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"t.c"
	.text
	.globl	function                        # -- Begin function function
	.p2align	2
	.type	function,@function
function:                               # @function
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)                      # 4-byte Folded Spill
	sw	s0, 8(sp)                       # 4-byte Folded Spill
	addi	s0, sp, 16
	sw	a0, -12(s0)
	lw	a0, -12(s0)
	lui	a1, 310689
	addi	a1, a1, 759
	mulh	a1, a0, a1
	srli	a2, a1, 31
	srai	a1, a1, 3
	add	a1, a1, a2
	li	a2, 27
	mul	a1, a1, a2
	sub	a0, a0, a1
	addi	sp, s0, -16
	lw	ra, 12(sp)                      # 4-byte Folded Reload
	lw	s0, 8(sp)                       # 4-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end0:
	.size	function, .Lfunc_end0-function
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	2
	.type	main,@function
main:                                   # @main
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)                      # 4-byte Folded Spill
	sw	s0, 24(sp)                      # 4-byte Folded Spill
	addi	s0, sp, 32
	li	a0, 0
	sw	a0, -24(s0)                     # 4-byte Folded Spill
	sw	a0, -12(s0)
	li	a0, -1
	sw	a0, -16(s0)
	enter_untrusted
	exit_untrusted
	lw	a0, -16(s0)
	put_sentry a0
	get_sentry a0
	sw	a0, -20(s0)
	alert_sentry
	lw	a0, -20(s0)
	call	function
                                        # kill: def $x11 killed $x10
	lw	a0, -24(s0)                     # 4-byte Folded Reload
	addi	sp, s0, -32
	lw	ra, 28(sp)                      # 4-byte Folded Reload
	lw	s0, 24(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 32
	ret
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
                                        # -- End function
	.ident	"clang version 22.0.0git (https://github.com/EthanDudeGuy/TrustGaurdLLVM.git 5d8ab02f72577be26244f50c43a9e7dce4a261fb)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym function
