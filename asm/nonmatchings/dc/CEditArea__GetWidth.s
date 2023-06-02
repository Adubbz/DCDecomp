.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetWidth__9CEditAreaFv
/* 70270 00170170 0800828C */  lw         $2, 0x8($4)
/* 70274 00170174 0800E003 */  jr         $31
/* 70278 00170178 00000000 */   nop
/* 7027C 0017017C 00000000 */  nop
