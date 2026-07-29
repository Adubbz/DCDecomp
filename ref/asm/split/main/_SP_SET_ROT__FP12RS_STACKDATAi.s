.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SP_SET_ROT__FP12RS_STACKDATAi
/* 093E80 00193D80 D0FFBD27 */  addiu       $29, $29, -0x30
/* 093E84 00193D84 2000BF7F */  sq          $31, 0x20($29)
/* 093E88 00193D88 1000B17F */  sq          $17, 0x10($29)
/* 093E8C 00193D8C 0000B07F */  sq          $16, 0x0($29)
/* 093E90 00193D90 08009124 */  addiu       $17, $4, 0x8
/* 093E94 00193D94 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 093E98 00193D98 00000000 */   nop
/* 093E9C 00193D9C 28264070 */  paddub      $4, $2, $0
/* 093EA0 00193DA0 5428060C */  jal         GetSprite__Fi
/* 093EA4 00193DA4 00000000 */   nop
/* 093EA8 00193DA8 28864070 */  paddub      $16, $2, $0
/* 093EAC 00193DAC 04000016 */  bnez        $16, .L00193DC0
/* 093EB0 00193DB0 00000000 */   nop
/* 093EB4 00193DB4 28160070 */  paddub      $2, $0, $0
/* 093EB8 00193DB8 12000010 */  b           .L00193E04
/* 093EBC 00193DBC 00000000 */   nop
.L00193DC0:
/* 093EC0 00193DC0 01000224 */  addiu       $2, $0, 0x1
/* 093EC4 00193DC4 040002A6 */  sh          $2, 0x4($16)
/* 093EC8 00193DC8 28262072 */  paddub      $4, $17, $0
/* 093ECC 00193DCC 08009124 */  addiu       $17, $4, 0x8
/* 093ED0 00193DD0 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 093ED4 00193DD4 00000000 */   nop
/* 093ED8 00193DD8 240002A6 */  sh          $2, 0x24($16)
/* 093EDC 00193DDC 28262072 */  paddub      $4, $17, $0
/* 093EE0 00193DE0 08009124 */  addiu       $17, $4, 0x8
/* 093EE4 00193DE4 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 093EE8 00193DE8 00000000 */   nop
/* 093EEC 00193DEC 260002A6 */  sh          $2, 0x26($16)
/* 093EF0 00193DF0 28262072 */  paddub      $4, $17, $0
/* 093EF4 00193DF4 E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 093EF8 00193DF8 00000000 */   nop
/* 093EFC 00193DFC 280000E6 */  swc1        $f0, 0x28($16)
/* 093F00 00193E00 01000224 */  addiu       $2, $0, 0x1
.L00193E04:
/* 093F04 00193E04 2000BF7B */  lq          $31, 0x20($29)
/* 093F08 00193E08 1000B17B */  lq          $17, 0x10($29)
/* 093F0C 00193E0C 0000B07B */  lq          $16, 0x0($29)
/* 093F10 00193E10 3000BD27 */  addiu       $29, $29, 0x30
/* 093F14 00193E14 0800E003 */  jr          $31
/* 093F18 00193E18 00000000 */   nop
/* 093F1C 00193E1C 00000000 */  nop
