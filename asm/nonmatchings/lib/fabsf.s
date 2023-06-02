.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel fabsf
/* 1D898 0011D798 00600344 */  mfc1       $3, $f12
/* 1D89C 0011D79C FF7F023C */  lui        $2, (0x7FFFFFFF >> 16)
/* 1D8A0 0011D7A0 FFFF4234 */  ori        $2, $2, (0x7FFFFFFF & 0xFFFF)
/* 1D8A4 0011D7A4 24186200 */  and        $3, $3, $2
/* 1D8A8 0011D7A8 00008344 */  mtc1       $3, $f0
/* 1D8AC 0011D7AC 0800E003 */  jr         $31
/* 1D8B0 0011D7B0 00000000 */   nop
/* 1D8B4 0011D7B4 00000000 */  nop
