.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_NPC_BODY_SIZE__FP12RS_STACKDATAi
/* 08F6F0 0018F5F0 D0FFBD27 */  addiu       $29, $29, -0x30
/* 08F6F4 0018F5F4 2000BF7F */  sq          $31, 0x20($29)
/* 08F6F8 0018F5F8 1000B17F */  sq          $17, 0x10($29)
/* 08F6FC 0018F5FC 0000B07F */  sq          $16, 0x0($29)
/* 08F700 0018F600 2886A070 */  paddub      $16, $5, $0
/* 08F704 0018F604 08009124 */  addiu       $17, $4, 0x8
/* 08F708 0018F608 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08F70C 0018F60C 00000000 */   nop
/* 08F710 0018F610 28264070 */  paddub      $4, $2, $0
/* 08F714 0018F614 842C060C */  jal         GetChara__Fi
/* 08F718 0018F618 00000000 */   nop
/* 08F71C 0018F61C 281E4070 */  paddub      $3, $2, $0
/* 08F720 0018F620 04006014 */  bnez        $3, .L0018F634
/* 08F724 0018F624 00000000 */   nop
/* 08F728 0018F628 28160070 */  paddub      $2, $0, $0
/* 08F72C 0018F62C 19000010 */  b           .L0018F694
/* 08F730 0018F630 00000000 */   nop
.L0018F634:
/* 08F734 0018F634 0200012A */  slti        $1, $16, 0x2
/* 08F738 0018F638 06002014 */  bnez        $1, .L0018F654
/* 08F73C 0018F63C 00000000 */   nop
/* 08F740 0018F640 28262072 */  paddub      $4, $17, $0
/* 08F744 0018F644 08009124 */  addiu       $17, $4, 0x8
/* 08F748 0018F648 E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 08F74C 0018F64C 00000000 */   nop
/* 08F750 0018F650 B00060E4 */  swc1        $f0, 0xB0($3)
.L0018F654:
/* 08F754 0018F654 0300012A */  slti        $1, $16, 0x3
/* 08F758 0018F658 06002014 */  bnez        $1, .L0018F674
/* 08F75C 0018F65C 00000000 */   nop
/* 08F760 0018F660 28262072 */  paddub      $4, $17, $0
/* 08F764 0018F664 08009124 */  addiu       $17, $4, 0x8
/* 08F768 0018F668 E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 08F76C 0018F66C 00000000 */   nop
/* 08F770 0018F670 B40060E4 */  swc1        $f0, 0xB4($3)
.L0018F674:
/* 08F774 0018F674 0400012A */  slti        $1, $16, 0x4
/* 08F778 0018F678 05002014 */  bnez        $1, .L0018F690
/* 08F77C 0018F67C 00000000 */   nop
/* 08F780 0018F680 28262072 */  paddub      $4, $17, $0
/* 08F784 0018F684 E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 08F788 0018F688 00000000 */   nop
/* 08F78C 0018F68C B80060E4 */  swc1        $f0, 0xB8($3)
.L0018F690:
/* 08F790 0018F690 01000224 */  addiu       $2, $0, 0x1
.L0018F694:
/* 08F794 0018F694 2000BF7B */  lq          $31, 0x20($29)
/* 08F798 0018F698 1000B17B */  lq          $17, 0x10($29)
/* 08F79C 0018F69C 0000B07B */  lq          $16, 0x0($29)
/* 08F7A0 0018F6A0 3000BD27 */  addiu       $29, $29, 0x30
/* 08F7A4 0018F6A4 0800E003 */  jr          $31
/* 08F7A8 0018F6A8 00000000 */   nop
/* 08F7AC 0018F6AC 00000000 */  nop
