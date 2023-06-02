.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetMapInfo__9CEditAreaFii
/* 701E0 001700E0 040085AC */  sw         $5, 0x4($4)
/* 701E4 001700E4 000086AC */  sw         $6, 0x0($4)
/* 701E8 001700E8 0800E003 */  jr         $31
/* 701EC 001700EC 00000000 */   nop
