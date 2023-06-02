.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _sceFsSemInit
/* 17D08 00117C08 0800E003 */  jr         $31
/* 17D0C 00117C0C 00000000 */   nop
