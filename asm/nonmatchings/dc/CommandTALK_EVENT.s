.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandTALK_EVENT__FPPv
/* 77580 00177480 0890858F */  lw         $5, -0x6FF8($gp)
/* 77584 00177484 0800A010 */  beqz       $5, .L001774A8
/* 77588 00177488 00000000 */   nop
/* 7758C 0017748C 0000838C */  lw         $3, 0x0($4)
/* 77590 00177490 0000638C */  lw         $3, 0x0($3)
/* 77594 00177494 6000A3AC */  sw         $3, 0x60($5)
/* 77598 00177498 0400838C */  lw         $3, 0x4($4)
/* 7759C 0017749C 0000648C */  lw         $4, 0x0($3)
/* 775A0 001774A0 0890838F */  lw         $3, -0x6FF8($gp)
/* 775A4 001774A4 640064AC */  sw         $4, 0x64($3)
.L001774A8:
/* 775A8 001774A8 0800E003 */  jr         $31
/* 775AC 001774AC 00000000 */   nop
