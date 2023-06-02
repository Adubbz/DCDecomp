.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetPosition__7CObjectFfff
/* 56DD0 00156CD0 10008CE4 */  swc1       $f12, 0x10($4)
/* 56DD4 00156CD4 14008DE4 */  swc1       $f13, 0x14($4)
/* 56DD8 00156CD8 18008EE4 */  swc1       $f14, 0x18($4)
/* 56DDC 00156CDC 0800E003 */  jr         $31
/* 56DE0 00156CE0 00000000 */   nop
/* 56DE4 00156CE4 00000000 */  nop
/* 56DE8 00156CE8 00000000 */  nop
/* 56DEC 00156CEC 00000000 */  nop
