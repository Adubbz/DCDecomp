.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MenuDataSwap__FP11ATTACH_LISTP11ATTACH_LIST
/* 12E6D0 0022E5D0 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 12E6D4 0022E5D4 2000BF7F */  sq         $31, 0x20($sp)
/* 12E6D8 0022E5D8 1000B17F */  sq         $17, 0x10($sp)
/* 12E6DC 0022E5DC 0000B07F */  sq         $16, 0x0($sp)
/* 12E6E0 0022E5E0 288E8070 */  paddub     $17, $4, $0
/* 12E6E4 0022E5E4 2886A070 */  paddub     $16, $5, $0
/* 12E6E8 0022E5E8 03002012 */  beqz       $17, .L0022E5F8
/* 12E6EC 0022E5EC 00000000 */   nop
/* 12E6F0 0022E5F0 03000016 */  bnez       $16, .L0022E600
/* 12E6F4 0022E5F4 00000000 */   nop
.L0022E5F8:
/* 12E6F8 0022E5F8 10000010 */  b          .L0022E63C
/* 12E6FC 0022E5FC 00000000 */   nop
.L0022E600:
/* 12E700 0022E600 3000A427 */  addiu      $4, $sp, 0x30
/* 12E704 0022E604 282E2072 */  paddub     $5, $17, $0
/* 12E708 0022E608 20000624 */  addiu      $6, $0, 0x20
/* 12E70C 0022E60C EC0C040C */  jal        memcpy
/* 12E710 0022E610 00000000 */   nop
/* 12E714 0022E614 28262072 */  paddub     $4, $17, $0
/* 12E718 0022E618 282E0072 */  paddub     $5, $16, $0
/* 12E71C 0022E61C 20000624 */  addiu      $6, $0, 0x20
/* 12E720 0022E620 EC0C040C */  jal        memcpy
/* 12E724 0022E624 00000000 */   nop
/* 12E728 0022E628 28260072 */  paddub     $4, $16, $0
/* 12E72C 0022E62C 3000A527 */  addiu      $5, $sp, 0x30
/* 12E730 0022E630 20000624 */  addiu      $6, $0, 0x20
/* 12E734 0022E634 EC0C040C */  jal        memcpy
/* 12E738 0022E638 00000000 */   nop
.L0022E63C:
/* 12E73C 0022E63C 2000BF7B */  lq         $31, 0x20($sp)
/* 12E740 0022E640 1000B17B */  lq         $17, 0x10($sp)
/* 12E744 0022E644 0000B07B */  lq         $16, 0x0($sp)
/* 12E748 0022E648 5000BD27 */  addiu      $sp, $sp, 0x50
/* 12E74C 0022E64C 0800E003 */  jr         $31
/* 12E750 0022E650 00000000 */   nop
/* 12E754 0022E654 00000000 */  nop
/* 12E758 0022E658 00000000 */  nop
/* 12E75C 0022E65C 00000000 */  nop
