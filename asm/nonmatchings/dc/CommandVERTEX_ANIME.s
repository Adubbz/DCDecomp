.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandVERTEX_ANIME__FPPv
/* 3A070 00139F70 0000838C */  lw         $3, 0x0($4)
/* 3A074 00139F74 0000638C */  lw         $3, 0x0($3)
/* 3A078 00139F78 A48C83AF */  sw         $3, -0x735C($gp)
/* 3A07C 00139F7C 0800E003 */  jr         $31
/* 3A080 00139F80 00000000 */   nop
/* 3A084 00139F84 00000000 */  nop
/* 3A088 00139F88 00000000 */  nop
/* 3A08C 00139F8C 00000000 */  nop
