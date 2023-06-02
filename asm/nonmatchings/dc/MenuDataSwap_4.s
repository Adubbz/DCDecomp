.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MenuDataSwap__FP11WEAPON_HAVEP11WEAPON_HAVE
/* 12E640 0022E540 D0FEBD27 */  addiu      $sp, $sp, -0x130
/* 12E644 0022E544 2000BF7F */  sq         $31, 0x20($sp)
/* 12E648 0022E548 1000B17F */  sq         $17, 0x10($sp)
/* 12E64C 0022E54C 0000B07F */  sq         $16, 0x0($sp)
/* 12E650 0022E550 288E8070 */  paddub     $17, $4, $0
/* 12E654 0022E554 2886A070 */  paddub     $16, $5, $0
/* 12E658 0022E558 03002012 */  beqz       $17, .L0022E568
/* 12E65C 0022E55C 00000000 */   nop
/* 12E660 0022E560 03000016 */  bnez       $16, .L0022E570
/* 12E664 0022E564 00000000 */   nop
.L0022E568:
/* 12E668 0022E568 10000010 */  b          .L0022E5AC
/* 12E66C 0022E56C 00000000 */   nop
.L0022E570:
/* 12E670 0022E570 3000A427 */  addiu      $4, $sp, 0x30
/* 12E674 0022E574 282E2072 */  paddub     $5, $17, $0
/* 12E678 0022E578 F8000624 */  addiu      $6, $0, 0xF8
/* 12E67C 0022E57C EC0C040C */  jal        memcpy
/* 12E680 0022E580 00000000 */   nop
/* 12E684 0022E584 28262072 */  paddub     $4, $17, $0
/* 12E688 0022E588 282E0072 */  paddub     $5, $16, $0
/* 12E68C 0022E58C F8000624 */  addiu      $6, $0, 0xF8
/* 12E690 0022E590 EC0C040C */  jal        memcpy
/* 12E694 0022E594 00000000 */   nop
/* 12E698 0022E598 28260072 */  paddub     $4, $16, $0
/* 12E69C 0022E59C 3000A527 */  addiu      $5, $sp, 0x30
/* 12E6A0 0022E5A0 F8000624 */  addiu      $6, $0, 0xF8
/* 12E6A4 0022E5A4 EC0C040C */  jal        memcpy
/* 12E6A8 0022E5A8 00000000 */   nop
.L0022E5AC:
/* 12E6AC 0022E5AC 2000BF7B */  lq         $31, 0x20($sp)
/* 12E6B0 0022E5B0 1000B17B */  lq         $17, 0x10($sp)
/* 12E6B4 0022E5B4 0000B07B */  lq         $16, 0x0($sp)
/* 12E6B8 0022E5B8 3001BD27 */  addiu      $sp, $sp, 0x130
/* 12E6BC 0022E5BC 0800E003 */  jr         $31
/* 12E6C0 0022E5C0 00000000 */   nop
/* 12E6C4 0022E5C4 00000000 */  nop
/* 12E6C8 0022E5C8 00000000 */  nop
/* 12E6CC 0022E5CC 00000000 */  nop
