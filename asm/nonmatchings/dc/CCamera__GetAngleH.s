.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetAngleH__7CCameraFv
/* 247D0 001246D0 AC0280C4 */  lwc1       $f0, 0x2AC($4)
/* 247D4 001246D4 0800E003 */  jr         $31
/* 247D8 001246D8 00000000 */   nop
/* 247DC 001246DC 00000000 */  nop
