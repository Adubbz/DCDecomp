.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _sceFsIntrSigSema
/* 17D28 00117C28 0800E003 */  jr         $31
/* 17D2C 00117C2C 00000000 */   nop
