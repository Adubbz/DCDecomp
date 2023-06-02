.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndCheckFade__Fv
/* 5A190 0015A090 108E828F */  lw         $2, -0x71F0($gp)
/* 5A194 0015A094 26104000 */  xor        $2, $2, $0
/* 5A198 0015A098 0100422C */  sltiu      $2, $2, 0x1
/* 5A19C 0015A09C 0800E003 */  jr         $31
/* 5A1A0 0015A0A0 00000000 */   nop
/* 5A1A4 0015A0A4 00000000 */  nop
/* 5A1A8 0015A0A8 00000000 */  nop
/* 5A1AC 0015A0AC 00000000 */  nop
