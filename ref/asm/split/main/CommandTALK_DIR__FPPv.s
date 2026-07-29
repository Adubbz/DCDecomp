.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CommandTALK_DIR__FPPv
/* 077650 00177550 0890858F */  lw          $5, -0x6FF8($28)
/* 077654 00177554 0400A010 */  beqz        $5, .L00177568
/* 077658 00177558 00000000 */   nop
/* 07765C 0017755C 0000838C */  lw          $3, 0x0($4)
/* 077660 00177560 0000638C */  lw          $3, 0x0($3)
/* 077664 00177564 6C00A3AC */  sw          $3, 0x6C($5)
.L00177568:
/* 077668 00177568 0800E003 */  jr          $31
/* 07766C 0017756C 00000000 */   nop
