.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _sceFsSigSema
/* 17D20 00117C20 0800E003 */  jr         $31
/* 17D24 00117C24 00000000 */   nop
