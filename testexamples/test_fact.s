	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_v1p0_zicsr2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"test_fact.c"
	.text
	.globl	main                            # -- Begin function main
	.p2align	2
	.type	main,@function
main:                                   # @main
# %bb.0:
	addi	sp, sp, -48
	sd	ra, 40(sp)                      # 8-byte Folded Spill
	sd	s0, 32(sp)                      # 8-byte Folded Spill
	addi	s0, sp, 48
                                        # kill: def $x12 killed $x10
	li	a2, 0
	sw	a2, -20(s0)
	sw	a0, -24(s0)
	sd	a1, -32(s0)
	li	a0, 1
	sd	a0, -40(s0)
	li	a0, 5
	sw	a0, -44(s0)
	lw	a0, -44(s0)
	beqz	a0, .LBB0_2
	j	.LBB0_1
.LBB0_1:
	lw	a0, -44(s0)
	li	a1, 1
	bne	a0, a1, .LBB0_3
	j	.LBB0_2
.LBB0_2:
	li	a0, 1
	sw	a0, -20(s0)
	j	.LBB0_8
.LBB0_3:
	li	a0, 2
	sw	a0, -48(s0)
	j	.LBB0_4
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	lw	a1, -48(s0)
	lw	a0, -44(s0)
	bltu	a0, a1, .LBB0_7
	j	.LBB0_5
.LBB0_5:                                #   in Loop: Header=BB0_4 Depth=1
	lwu	a1, -48(s0)
	ld	a0, -40(s0)
	mul	a0, a0, a1
	sd	a0, -40(s0)
	j	.LBB0_6
.LBB0_6:                                #   in Loop: Header=BB0_4 Depth=1
	lw	a0, -48(s0)
	addiw	a0, a0, 1
	sw	a0, -48(s0)
	j	.LBB0_4
.LBB0_7:
	ld	a0, -40(s0)
	sw	a0, -20(s0)
	j	.LBB0_8
.LBB0_8:
	lw	a0, -20(s0)
	addi	sp, s0, -48
	ld	ra, 40(sp)                      # 8-byte Folded Reload
	ld	s0, 32(sp)                      # 8-byte Folded Reload
	addi	sp, sp, 48
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        # -- End function
	.ident	"clang version 22.0.0git (https://github.com/EthanDudeGuy/TrustGaurdLLVM.git 5d8ab02f72577be26244f50c43a9e7dce4a261fb)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
