.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandSHADOW_VERTEX_ANIME__FPPv
/* 3A090 00139F90 0000838C */  lw         $3, 0x0($4)
/* 3A094 00139F94 0000638C */  lw         $3, 0x0($3)
/* 3A098 00139F98 AC8C83AF */  sw         $3, -0x7354($gp)
/* 3A09C 00139F9C 0800E003 */  jr         $31
/* 3A0A0 00139FA0 00000000 */   nop
/* 3A0A4 00139FA4 00000000 */  nop
/* 3A0A8 00139FA8 00000000 */  nop
/* 3A0AC 00139FAC 00000000 */  nop
