.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetVol__6CSoundFii
/* 046A60 00146960 F0FFBD27 */  addiu       $29, $29, -0x10
/* 046A64 00146964 0000BF7F */  sq          $31, 0x0($29)
/* 046A68 00146968 B000A424 */  addiu       $4, $5, 0xB0
/* 046A6C 0014696C 282EC070 */  paddub      $5, $6, $0
/* 046A70 00146970 801E050C */  jal         ezMidi__Fii
/* 046A74 00146974 00000000 */   nop
/* 046A78 00146978 0000BF7B */  lq          $31, 0x0($29)
/* 046A7C 0014697C 1000BD27 */  addiu       $29, $29, 0x10
/* 046A80 00146980 0800E003 */  jr          $31
/* 046A84 00146984 00000000 */   nop
/* 046A88 00146988 00000000 */  nop
/* 046A8C 0014698C 00000000 */  nop
