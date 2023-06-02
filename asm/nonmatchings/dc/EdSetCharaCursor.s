.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdSetCharaCursor__Fi
/* 7CCE0 0017CBE0 B49084AF */  sw         $4, -0x6F4C($gp)
/* 7CCE4 0017CBE4 0800E003 */  jr         $31
/* 7CCE8 0017CBE8 00000000 */   nop
/* 7CCEC 0017CBEC 00000000 */  nop
