.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EventEnable__10CCharacterFi
/* 38330 00138230 E40D85AC */  sw         $5, 0xDE4($4)
/* 38334 00138234 0800E003 */  jr         $31
/* 38338 00138238 00000000 */   nop
/* 3833C 0013823C 00000000 */  nop
