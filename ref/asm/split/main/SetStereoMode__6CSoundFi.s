.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetStereoMode__6CSoundFi
/* 046A90 00146990 F0FFBD27 */  addiu       $29, $29, -0x10
/* 046A94 00146994 0000BF7F */  sq          $31, 0x0($29)
/* 046A98 00146998 C0000424 */  addiu       $4, $0, 0xC0
/* 046A9C 0014699C 801E050C */  jal         ezMidi__Fii
/* 046AA0 001469A0 00000000 */   nop
/* 046AA4 001469A4 0000BF7B */  lq          $31, 0x0($29)
/* 046AA8 001469A8 1000BD27 */  addiu       $29, $29, 0x10
/* 046AAC 001469AC 0800E003 */  jr          $31
/* 046AB0 001469B0 00000000 */   nop
/* 046AB4 001469B4 00000000 */  nop
/* 046AB8 001469B8 00000000 */  nop
/* 046ABC 001469BC 00000000 */  nop
