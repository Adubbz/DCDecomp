.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetStack__FP12RS_STACKDATAf__3
/* 0E17F0 001E16F0 0000858C */  lw          $5, 0x0($4)
/* 0E17F4 001E16F4 03000324 */  addiu       $3, $0, 0x3
/* 0E17F8 001E16F8 0300A314 */  bne         $5, $3, .L001E1708
/* 0E17FC 001E16FC 00000000 */   nop
/* 0E1800 001E1700 0400838C */  lw          $3, 0x4($4)
/* 0E1804 001E1704 04006CE4 */  swc1        $f12, 0x4($3)
.L001E1708:
/* 0E1808 001E1708 0800E003 */  jr          $31
/* 0E180C 001E170C 00000000 */   nop
