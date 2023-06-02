.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandTIME_TABLE_NO__FPPv
/* 76EF0 00176DF0 0000838C */  lw         $3, 0x0($4)
/* 76EF4 00176DF4 0000648C */  lw         $4, 0x0($3)
/* 76EF8 00176DF8 04008004 */  bltz       $4, .L00176E0C
/* 76EFC 00176DFC 00000000 */   nop
/* 76F00 00176E00 07008328 */  slti       $3, $4, 0x7
/* 76F04 00176E04 02006014 */  bnez       $3, .L00176E10
/* 76F08 00176E08 00000000 */   nop
.L00176E0C:
/* 76F0C 00176E0C 28260070 */  paddub     $4, $0, $0
.L00176E10:
/* 76F10 00176E10 F48F84AF */  sw         $4, -0x700C($gp)
/* 76F14 00176E14 0800E003 */  jr         $31
/* 76F18 00176E18 00000000 */   nop
/* 76F1C 00176E1C 00000000 */  nop
