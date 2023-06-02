.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetNowManualMenuMode__Fv
/* 134620 00234520 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 134624 00234524 7CA82284 */  lh         $2, -0x5784($at)
/* 134628 00234528 0800E003 */  jr         $31
/* 13462C 0023452C 00000000 */   nop
