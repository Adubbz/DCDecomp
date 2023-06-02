.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel setbilinear__Fi
/* 5BD10 0015BC10 F88684AF */  sw         $4, -0x7908($gp)
/* 5BD14 0015BC14 0800E003 */  jr         $31
/* 5BD18 0015BC18 00000000 */   nop
/* 5BD1C 0015BC1C 00000000 */  nop
