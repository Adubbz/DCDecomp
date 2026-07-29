.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CommandTALK_EVENT__FPPv
/* 077580 00177480 0890858F */  lw          $5, -0x6FF8($28)
/* 077584 00177484 0800A010 */  beqz        $5, .L001774A8
/* 077588 00177488 00000000 */   nop
/* 07758C 0017748C 0000838C */  lw          $3, 0x0($4)
/* 077590 00177490 0000638C */  lw          $3, 0x0($3)
/* 077594 00177494 6000A3AC */  sw          $3, 0x60($5)
/* 077598 00177498 0400838C */  lw          $3, 0x4($4)
/* 07759C 0017749C 0000648C */  lw          $4, 0x0($3)
/* 0775A0 001774A0 0890838F */  lw          $3, -0x6FF8($28)
/* 0775A4 001774A4 640064AC */  sw          $4, 0x64($3)
.L001774A8:
/* 0775A8 001774A8 0800E003 */  jr          $31
/* 0775AC 001774AC 00000000 */   nop
