.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _GET_NPC_BODY_SIZE__FP12RS_STACKDATAi
/* 08F7B0 0018F6B0 D0FFBD27 */  addiu       $29, $29, -0x30
/* 08F7B4 0018F6B4 2000BF7F */  sq          $31, 0x20($29)
/* 08F7B8 0018F6B8 1000B17F */  sq          $17, 0x10($29)
/* 08F7BC 0018F6BC 0000B07F */  sq          $16, 0x0($29)
/* 08F7C0 0018F6C0 2886A070 */  paddub      $16, $5, $0
/* 08F7C4 0018F6C4 08009124 */  addiu       $17, $4, 0x8
/* 08F7C8 0018F6C8 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08F7CC 0018F6CC 00000000 */   nop
/* 08F7D0 0018F6D0 28264070 */  paddub      $4, $2, $0
/* 08F7D4 0018F6D4 842C060C */  jal         GetChara__Fi
/* 08F7D8 0018F6D8 00000000 */   nop
/* 08F7DC 0018F6DC 04004014 */  bnez        $2, .L0018F6F0
/* 08F7E0 0018F6E0 00000000 */   nop
/* 08F7E4 0018F6E4 28160070 */  paddub      $2, $0, $0
/* 08F7E8 0018F6E8 19000010 */  b           .L0018F750
/* 08F7EC 0018F6EC 00000000 */   nop
.L0018F6F0:
/* 08F7F0 0018F6F0 0200012A */  slti        $1, $16, 0x2
/* 08F7F4 0018F6F4 06002014 */  bnez        $1, .L0018F710
/* 08F7F8 0018F6F8 00000000 */   nop
/* 08F7FC 0018F6FC 28262072 */  paddub      $4, $17, $0
/* 08F800 0018F700 08009124 */  addiu       $17, $4, 0x8
/* 08F804 0018F704 B0004CC4 */  lwc1        $f12, 0xB0($2)
/* 08F808 0018F708 0029060C */  jal         SetStack__FP12RS_STACKDATAf
/* 08F80C 0018F70C 00000000 */   nop
.L0018F710:
/* 08F810 0018F710 0300012A */  slti        $1, $16, 0x3
/* 08F814 0018F714 06002014 */  bnez        $1, .L0018F730
/* 08F818 0018F718 00000000 */   nop
/* 08F81C 0018F71C 28262072 */  paddub      $4, $17, $0
/* 08F820 0018F720 08009124 */  addiu       $17, $4, 0x8
/* 08F824 0018F724 B4004CC4 */  lwc1        $f12, 0xB4($2)
/* 08F828 0018F728 0029060C */  jal         SetStack__FP12RS_STACKDATAf
/* 08F82C 0018F72C 00000000 */   nop
.L0018F730:
/* 08F830 0018F730 0400012A */  slti        $1, $16, 0x4
/* 08F834 0018F734 05002014 */  bnez        $1, .L0018F74C
/* 08F838 0018F738 00000000 */   nop
/* 08F83C 0018F73C 28262072 */  paddub      $4, $17, $0
/* 08F840 0018F740 B8004CC4 */  lwc1        $f12, 0xB8($2)
/* 08F844 0018F744 0029060C */  jal         SetStack__FP12RS_STACKDATAf
/* 08F848 0018F748 00000000 */   nop
.L0018F74C:
/* 08F84C 0018F74C 01000224 */  addiu       $2, $0, 0x1
.L0018F750:
/* 08F850 0018F750 2000BF7B */  lq          $31, 0x20($29)
/* 08F854 0018F754 1000B17B */  lq          $17, 0x10($29)
/* 08F858 0018F758 0000B07B */  lq          $16, 0x0($29)
/* 08F85C 0018F75C 3000BD27 */  addiu       $29, $29, 0x30
/* 08F860 0018F760 0800E003 */  jr          $31
/* 08F864 0018F764 00000000 */   nop
/* 08F868 0018F768 00000000 */  nop
/* 08F86C 0018F76C 00000000 */  nop
