.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SndCheckFade__Fv
/* 05A190 0015A090 108E828F */  lw          $2, -0x71F0($28)
/* 05A194 0015A094 26104000 */  xor         $2, $2, $0
/* 05A198 0015A098 0100422C */  sltiu       $2, $2, 0x1
/* 05A19C 0015A09C 0800E003 */  jr          $31
/* 05A1A0 0015A0A0 00000000 */   nop
/* 05A1A4 0015A0A4 00000000 */  nop
/* 05A1A8 0015A0A8 00000000 */  nop
/* 05A1AC 0015A0AC 00000000 */  nop
