.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EBDebug__Fi
/* 68520 00168420 D48E84AF */  sw         $4, -0x712C($gp)
/* 68524 00168424 0800E003 */  jr         $31
/* 68528 00168428 00000000 */   nop
/* 6852C 0016842C 00000000 */  nop
