.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetRoll__7CCameraFv
/* 247E0 001246E0 A00280C4 */  lwc1       $f0, 0x2A0($4)
/* 247E4 001246E4 0800E003 */  jr         $31
/* 247E8 001246E8 00000000 */   nop
/* 247EC 001246EC 00000000 */  nop
