.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EBFinishSound__Fii
/* 682F0 001681F0 C48E84AF */  sw         $4, -0x713C($gp)
/* 682F4 001681F4 C88E85AF */  sw         $5, -0x7138($gp)
/* 682F8 001681F8 0800E003 */  jr         $31
/* 682FC 001681FC 00000000 */   nop
