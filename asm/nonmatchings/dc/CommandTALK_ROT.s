.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandTALK_ROT__FPPv
/* 77630 00177530 0890858F */  lw         $5, -0x6FF8($gp)
/* 77634 00177534 0400A010 */  beqz       $5, .L00177548
/* 77638 00177538 00000000 */   nop
/* 7763C 0017753C 0000838C */  lw         $3, 0x0($4)
/* 77640 00177540 0000638C */  lw         $3, 0x0($3)
/* 77644 00177544 6800A3AC */  sw         $3, 0x68($5)
.L00177548:
/* 77648 00177548 0800E003 */  jr         $31
/* 7764C 0017754C 00000000 */   nop
