.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetRoll__7CCameraFf
/* 24760 00124660 A0028CE4 */  swc1       $f12, 0x2A0($4)
/* 24764 00124664 0800E003 */  jr         $31
/* 24768 00124668 00000000 */   nop
/* 2476C 0012466C 00000000 */  nop
