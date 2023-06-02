.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandPROJECTION__FPPv
/* 9FFA0 0019FEA0 0000838C */  lw         $3, 0x0($4)
/* 9FFA4 0019FEA4 000060C4 */  lwc1       $f0, 0x0($3)
/* 9FFA8 0019FEA8 9092838F */  lw         $3, -0x6D70($gp)
/* 9FFAC 0019FEAC C00460E4 */  swc1       $f0, 0x4C0($3)
/* 9FFB0 0019FEB0 0800E003 */  jr         $31
/* 9FFB4 0019FEB4 00000000 */   nop
/* 9FFB8 0019FEB8 00000000 */  nop
/* 9FFBC 0019FEBC 00000000 */  nop
