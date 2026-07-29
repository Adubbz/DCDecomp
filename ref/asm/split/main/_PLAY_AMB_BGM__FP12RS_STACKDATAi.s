.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _PLAY_AMB_BGM__FP12RS_STACKDATAi
/* 096100 00196000 F0FFBD27 */  addiu       $29, $29, -0x10
/* 096104 00196004 0000BF7F */  sq          $31, 0x0($29)
/* 096108 00196008 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 09610C 0019600C 00000000 */   nop
/* 096110 00196010 28264070 */  paddub      $4, $2, $0
/* 096114 00196014 446C050C */  jal         SndAmbientPlay__Fi
/* 096118 00196018 00000000 */   nop
/* 09611C 0019601C 01000224 */  addiu       $2, $0, 0x1
/* 096120 00196020 0000BF7B */  lq          $31, 0x0($29)
/* 096124 00196024 1000BD27 */  addiu       $29, $29, 0x10
/* 096128 00196028 0800E003 */  jr          $31
/* 09612C 0019602C 00000000 */   nop
