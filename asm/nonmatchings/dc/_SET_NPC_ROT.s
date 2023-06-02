.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_NPC_ROT__FP12RS_STACKDATAi
/* 8E650 0018E550 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 8E654 0018E554 4000BF7F */  sq         $31, 0x40($sp)
/* 8E658 0018E558 3000B37F */  sq         $19, 0x30($sp)
/* 8E65C 0018E55C 2000B27F */  sq         $18, 0x20($sp)
/* 8E660 0018E560 1000B17F */  sq         $17, 0x10($sp)
/* 8E664 0018E564 0000B07F */  sq         $16, 0x0($sp)
/* 8E668 0018E568 2896A070 */  paddub     $18, $5, $0
/* 8E66C 0018E56C 08009324 */  addiu      $19, $4, 0x8
/* 8E670 0018E570 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8E674 0018E574 00000000 */   nop
/* 8E678 0018E578 28264070 */  paddub     $4, $2, $0
/* 8E67C 0018E57C 842C060C */  jal        GetChara__Fi
/* 8E680 0018E580 00000000 */   nop
/* 8E684 0018E584 28864070 */  paddub     $16, $2, $0
/* 8E688 0018E588 04000016 */  bnez       $16, .L0018E59C
/* 8E68C 0018E58C 00000000 */   nop
/* 8E690 0018E590 28160070 */  paddub     $2, $0, $0
/* 8E694 0018E594 38000010 */  b          .L0018E678
/* 8E698 0018E598 00000000 */   nop
.L0018E59C:
/* 8E69C 0018E59C 288E0070 */  paddub     $17, $0, $0
/* 8E6A0 0018E5A0 BC00028E */  lw         $2, 0xBC($16)
/* 8E6A4 0018E5A4 03004010 */  beqz       $2, .L0018E5B4
/* 8E6A8 0018E5A8 00000000 */   nop
/* 8E6AC 0018E5AC 1001518C */  lw         $17, 0x110($2)
/* 8E6B0 0018E5B0 00000000 */  nop
.L0018E5B4:
/* 8E6B4 0018E5B4 04000224 */  addiu      $2, $0, 0x4
/* 8E6B8 0018E5B8 19004216 */  bne        $18, $2, .L0018E620
/* 8E6BC 0018E5BC 00000000 */   nop
/* 8E6C0 0018E5C0 12002012 */  beqz       $17, .L0018E60C
/* 8E6C4 0018E5C4 00000000 */   nop
/* 8E6C8 0018E5C8 28266072 */  paddub     $4, $19, $0
/* 8E6CC 0018E5CC 08009324 */  addiu      $19, $4, 0x8
/* 8E6D0 0018E5D0 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 8E6D4 0018E5D4 00000000 */   nop
/* 8E6D8 0018E5D8 5000A0E7 */  swc1       $f0, 0x50($sp)
/* 8E6DC 0018E5DC 28266072 */  paddub     $4, $19, $0
/* 8E6E0 0018E5E0 08009324 */  addiu      $19, $4, 0x8
/* 8E6E4 0018E5E4 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 8E6E8 0018E5E8 00000000 */   nop
/* 8E6EC 0018E5EC 5400A0E7 */  swc1       $f0, 0x54($sp)
/* 8E6F0 0018E5F0 28266072 */  paddub     $4, $19, $0
/* 8E6F4 0018E5F4 08009324 */  addiu      $19, $4, 0x8
/* 8E6F8 0018E5F8 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 8E6FC 0018E5FC 00000000 */   nop
/* 8E700 0018E600 5800A0E7 */  swc1       $f0, 0x58($sp)
/* 8E704 0018E604 06000010 */  b          .L0018E620
/* 8E708 0018E608 00000000 */   nop
.L0018E60C:
/* 8E70C 0018E60C 28266072 */  paddub     $4, $19, $0
/* 8E710 0018E610 5000A527 */  addiu      $5, $sp, 0x50
/* 8E714 0018E614 B42D060C */  jal        GetRotation__FP12RS_STACKDATAPf
/* 8E718 0018E618 00000000 */   nop
/* 8E71C 0018E61C 18007326 */  addiu      $19, $19, 0x18
.L0018E620:
/* 8E720 0018E620 02000224 */  addiu      $2, $0, 0x2
/* 8E724 0018E624 0D004216 */  bne        $18, $2, .L0018E65C
/* 8E728 0018E628 00000000 */   nop
/* 8E72C 0018E62C 5800A0AF */  sw         $0, 0x58($sp)
/* 8E730 0018E630 5000A0AF */  sw         $0, 0x50($sp)
/* 8E734 0018E634 28266072 */  paddub     $4, $19, $0
/* 8E738 0018E638 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 8E73C 0018E63C 00000000 */   nop
/* 8E740 0018E640 5400A0E7 */  swc1       $f0, 0x54($sp)
/* 8E744 0018E644 05002016 */  bnez       $17, .L0018E65C
/* 8E748 0018E648 00000000 */   nop
/* 8E74C 0018E64C 5000A427 */  addiu      $4, $sp, 0x50
/* 8E750 0018E650 282E8070 */  paddub     $5, $4, $0
/* 8E754 0018E654 342D060C */  jal        GetWorldRot__FPfPf
/* 8E758 0018E658 00000000 */   nop
.L0018E65C:
/* 8E75C 0018E65C 28260072 */  paddub     $4, $16, $0
/* 8E760 0018E660 5000A527 */  addiu      $5, $sp, 0x50
/* 8E764 0018E664 A000198E */  lw         $25, 0xA0($16)
/* 8E768 0018E668 3400398F */  lw         $25, 0x34($25)
/* 8E76C 0018E66C 09F82003 */  jalr       $25
/* 8E770 0018E670 00000000 */   nop
/* 8E774 0018E674 01000224 */  addiu      $2, $0, 0x1
.L0018E678:
/* 8E778 0018E678 4000BF7B */  lq         $31, 0x40($sp)
/* 8E77C 0018E67C 3000B37B */  lq         $19, 0x30($sp)
/* 8E780 0018E680 2000B27B */  lq         $18, 0x20($sp)
/* 8E784 0018E684 1000B17B */  lq         $17, 0x10($sp)
/* 8E788 0018E688 0000B07B */  lq         $16, 0x0($sp)
/* 8E78C 0018E68C 6000BD27 */  addiu      $sp, $sp, 0x60
/* 8E790 0018E690 0800E003 */  jr         $31
/* 8E794 0018E694 00000000 */   nop
/* 8E798 0018E698 00000000 */  nop
/* 8E79C 0018E69C 00000000 */  nop
