.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PickUpPoly__9CEditAreaFP6CCPolyfff
/* 6F760 0016F660 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 6F764 0016F664 3000BF7F */  sq         $31, 0x30($sp)
/* 6F768 0016F668 2000B17F */  sq         $17, 0x20($sp)
/* 6F76C 0016F66C 1000B07F */  sq         $16, 0x10($sp)
/* 6F770 0016F670 0800B6E7 */  swc1       $f22, 0x8($sp)
/* 6F774 0016F674 0400B5E7 */  swc1       $f21, 0x4($sp)
/* 6F778 0016F678 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 6F77C 0016F67C 288E8070 */  paddub     $17, $4, $0
/* 6F780 0016F680 2886A070 */  paddub     $16, $5, $0
/* 6F784 0016F684 86650046 */  mov.s      $f22, $f12
/* 6F788 0016F688 466D0046 */  mov.s      $f21, $f13
/* 6F78C 0016F68C 06750046 */  mov.s      $f20, $f14
/* 6F790 0016F690 24BC050C */  jal        CheckArea__9CEditAreaFfff
/* 6F794 0016F694 00000000 */   nop
/* 6F798 0016F698 04004014 */  bnez       $2, .L0016F6AC
/* 6F79C 0016F69C 00000000 */   nop
/* 6F7A0 0016F6A0 28160070 */  paddub     $2, $0, $0
/* 6F7A4 0016F6A4 16000010 */  b          .L0016F700
/* 6F7A8 0016F6A8 00000000 */   nop
.L0016F6AC:
/* 6F7AC 0016F6AC 28262072 */  paddub     $4, $17, $0
/* 6F7B0 0016F6B0 4000A527 */  addiu      $5, $sp, 0x40
/* 6F7B4 0016F6B4 06B30046 */  mov.s      $f12, $f22
/* 6F7B8 0016F6B8 46AB0046 */  mov.s      $f13, $f21
/* 6F7BC 0016F6BC 86A30046 */  mov.s      $f14, $f20
/* 6F7C0 0016F6C0 20B6050C */  jal        GetPos__9CEditAreaFP11CVector3_i_fff
/* 6F7C4 0016F6C4 00000000 */   nop
/* 6F7C8 0016F6C8 4800A28F */  lw         $2, 0x48($sp)
/* 6F7CC 0016F6CC FFFF4324 */  addiu      $3, $2, -0x1
/* 6F7D0 0016F6D0 4000A28F */  lw         $2, 0x40($sp)
/* 6F7D4 0016F6D4 FFFF4224 */  addiu      $2, $2, -0x1
/* 6F7D8 0016F6D8 5000A2AF */  sw         $2, 0x50($sp)
/* 6F7DC 0016F6DC 5400A3AF */  sw         $3, 0x54($sp)
/* 6F7E0 0016F6E0 02000224 */  addiu      $2, $0, 0x2
/* 6F7E4 0016F6E4 5800A2AF */  sw         $2, 0x58($sp)
/* 6F7E8 0016F6E8 5C00A2AF */  sw         $2, 0x5C($sp)
/* 6F7EC 0016F6EC 28262072 */  paddub     $4, $17, $0
/* 6F7F0 0016F6F0 282E0072 */  paddub     $5, $16, $0
/* 6F7F4 0016F6F4 5000A627 */  addiu      $6, $sp, 0x50
/* 6F7F8 0016F6F8 CCBD050C */  jal        PickUpPoly__9CEditAreaFP6CCPoly8CRect_i_
/* 6F7FC 0016F6FC 00000000 */   nop
.L0016F700:
/* 6F800 0016F700 3000BF7B */  lq         $31, 0x30($sp)
/* 6F804 0016F704 2000B17B */  lq         $17, 0x20($sp)
/* 6F808 0016F708 1000B07B */  lq         $16, 0x10($sp)
/* 6F80C 0016F70C 0800B6C7 */  lwc1       $f22, 0x8($sp)
/* 6F810 0016F710 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* 6F814 0016F714 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 6F818 0016F718 6000BD27 */  addiu      $sp, $sp, 0x60
/* 6F81C 0016F71C 0800E003 */  jr         $31
/* 6F820 0016F720 00000000 */   nop
/* 6F824 0016F724 00000000 */  nop
/* 6F828 0016F728 00000000 */  nop
/* 6F82C 0016F72C 00000000 */  nop
