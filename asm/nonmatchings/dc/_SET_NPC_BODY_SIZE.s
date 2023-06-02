.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_NPC_BODY_SIZE__FP12RS_STACKDATAi
/* 8F6F0 0018F5F0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 8F6F4 0018F5F4 2000BF7F */  sq         $31, 0x20($sp)
/* 8F6F8 0018F5F8 1000B17F */  sq         $17, 0x10($sp)
/* 8F6FC 0018F5FC 0000B07F */  sq         $16, 0x0($sp)
/* 8F700 0018F600 2886A070 */  paddub     $16, $5, $0
/* 8F704 0018F604 08009124 */  addiu      $17, $4, 0x8
/* 8F708 0018F608 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8F70C 0018F60C 00000000 */   nop
/* 8F710 0018F610 28264070 */  paddub     $4, $2, $0
/* 8F714 0018F614 842C060C */  jal        GetChara__Fi
/* 8F718 0018F618 00000000 */   nop
/* 8F71C 0018F61C 281E4070 */  paddub     $3, $2, $0
/* 8F720 0018F620 04006014 */  bnez       $3, .L0018F634
/* 8F724 0018F624 00000000 */   nop
/* 8F728 0018F628 28160070 */  paddub     $2, $0, $0
/* 8F72C 0018F62C 19000010 */  b          .L0018F694
/* 8F730 0018F630 00000000 */   nop
.L0018F634:
/* 8F734 0018F634 0200012A */  slti       $at, $16, 0x2
/* 8F738 0018F638 06002014 */  bnez       $at, .L0018F654
/* 8F73C 0018F63C 00000000 */   nop
/* 8F740 0018F640 28262072 */  paddub     $4, $17, $0
/* 8F744 0018F644 08009124 */  addiu      $17, $4, 0x8
/* 8F748 0018F648 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 8F74C 0018F64C 00000000 */   nop
/* 8F750 0018F650 B00060E4 */  swc1       $f0, 0xB0($3)
.L0018F654:
/* 8F754 0018F654 0300012A */  slti       $at, $16, 0x3
/* 8F758 0018F658 06002014 */  bnez       $at, .L0018F674
/* 8F75C 0018F65C 00000000 */   nop
/* 8F760 0018F660 28262072 */  paddub     $4, $17, $0
/* 8F764 0018F664 08009124 */  addiu      $17, $4, 0x8
/* 8F768 0018F668 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 8F76C 0018F66C 00000000 */   nop
/* 8F770 0018F670 B40060E4 */  swc1       $f0, 0xB4($3)
.L0018F674:
/* 8F774 0018F674 0400012A */  slti       $at, $16, 0x4
/* 8F778 0018F678 05002014 */  bnez       $at, .L0018F690
/* 8F77C 0018F67C 00000000 */   nop
/* 8F780 0018F680 28262072 */  paddub     $4, $17, $0
/* 8F784 0018F684 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 8F788 0018F688 00000000 */   nop
/* 8F78C 0018F68C B80060E4 */  swc1       $f0, 0xB8($3)
.L0018F690:
/* 8F790 0018F690 01000224 */  addiu      $2, $0, 0x1
.L0018F694:
/* 8F794 0018F694 2000BF7B */  lq         $31, 0x20($sp)
/* 8F798 0018F698 1000B17B */  lq         $17, 0x10($sp)
/* 8F79C 0018F69C 0000B07B */  lq         $16, 0x0($sp)
/* 8F7A0 0018F6A0 3000BD27 */  addiu      $sp, $sp, 0x30
/* 8F7A4 0018F6A4 0800E003 */  jr         $31
/* 8F7A8 0018F6A8 00000000 */   nop
/* 8F7AC 0018F6AC 00000000 */  nop
