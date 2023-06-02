.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetUnitAlt__9CEditAreaFv
/* 70310 00170210 240080C4 */  lwc1       $f0, 0x24($4)
/* 70314 00170214 0800E003 */  jr         $31
/* 70318 00170218 00000000 */   nop
/* 7031C 0017021C 00000000 */  nop
