.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandTALK_DIR__FPPv
/* 77650 00177550 0890858F */  lw         $5, -0x6FF8($gp)
/* 77654 00177554 0400A010 */  beqz       $5, .L00177568
/* 77658 00177558 00000000 */   nop
/* 7765C 0017755C 0000838C */  lw         $3, 0x0($4)
/* 77660 00177560 0000638C */  lw         $3, 0x0($3)
/* 77664 00177564 6C00A3AC */  sw         $3, 0x6C($5)
.L00177568:
/* 77668 00177568 0800E003 */  jr         $31
/* 7766C 0017756C 00000000 */   nop
