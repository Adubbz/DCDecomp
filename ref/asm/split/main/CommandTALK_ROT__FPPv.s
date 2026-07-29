.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CommandTALK_ROT__FPPv
/* 077630 00177530 0890858F */  lw          $5, -0x6FF8($28)
/* 077634 00177534 0400A010 */  beqz        $5, .L00177548
/* 077638 00177538 00000000 */   nop
/* 07763C 0017753C 0000838C */  lw          $3, 0x0($4)
/* 077640 00177540 0000638C */  lw          $3, 0x0($3)
/* 077644 00177544 6800A3AC */  sw          $3, 0x68($5)
.L00177548:
/* 077648 00177548 0800E003 */  jr          $31
/* 07764C 0017754C 00000000 */   nop
