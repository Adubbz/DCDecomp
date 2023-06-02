.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Initialize__7CVisualFv
/* 34C50 00134B50 000080AC */  sw         $0, 0x0($4)
/* 34C54 00134B54 040080AC */  sw         $0, 0x4($4)
/* 34C58 00134B58 0800E003 */  jr         $31
/* 34C5C 00134B5C 00000000 */   nop
