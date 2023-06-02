.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetCPoly__5CFishFP6CCPolyi
/* 140570 00240470 002485AC */  sw         $5, 0x2400($4)
/* 140574 00240474 042486AC */  sw         $6, 0x2404($4)
/* 140578 00240478 0800E003 */  jr         $31
/* 14057C 0024047C 00000000 */   nop
