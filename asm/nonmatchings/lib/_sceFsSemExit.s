.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _sceFsSemExit
/* 17D10 00117C10 0800E003 */  jr         $31
/* 17D14 00117C14 00000000 */   nop
