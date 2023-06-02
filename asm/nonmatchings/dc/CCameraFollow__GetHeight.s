.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetHeight__13CCameraFollowFv
/* 24CC0 00124BC0 D40280C4 */  lwc1       $f0, 0x2D4($4)
/* 24CC4 00124BC4 0800E003 */  jr         $31
/* 24CC8 00124BC8 00000000 */   nop
/* 24CCC 00124BCC 00000000 */  nop
