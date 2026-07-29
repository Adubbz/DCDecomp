.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel func_00143620
/* 043720 00143620 F0FFBD27 */  addiu       $29, $29, -0x10
/* 043724 00143624 0000BF7F */  sq          $31, 0x0($29)
/* 043728 00143628 282E0070 */  paddub      $5, $0, $0
/* 04372C 0014362C 28360070 */  paddub      $6, $0, $0
/* 043730 00143630 1C9E050C */  jal         __ct__13CTextureAnimeFP13CTexAnimeDatai
/* 043734 00143634 00000000 */   nop
/* 043738 00143638 0000BF7B */  lq          $31, 0x0($29)
/* 04373C 0014363C 1000BD27 */  addiu       $29, $29, 0x10
/* 043740 00143640 0800E003 */  jr          $31
/* 043744 00143644 00000000 */   nop
/* 043748 00143648 00000000 */  nop
/* 04374C 0014364C 00000000 */  nop
