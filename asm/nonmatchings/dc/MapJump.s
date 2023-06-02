.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MapJump__Fii
/* 41E30 00141D30 A08684AF */  sw         $4, -0x7960($gp)
/* 41E34 00141D34 348D85AF */  sw         $5, -0x72CC($gp)
/* 41E38 00141D38 0800E003 */  jr         $31
/* 41E3C 00141D3C 00000000 */   nop
