.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetStack__FP12RS_STACKDATAi__3
/* 0E17D0 001E16D0 0000868C */  lw          $6, 0x0($4)
/* 0E17D4 001E16D4 03000324 */  addiu       $3, $0, 0x3
/* 0E17D8 001E16D8 0300C314 */  bne         $6, $3, .L001E16E8
/* 0E17DC 001E16DC 00000000 */   nop
/* 0E17E0 001E16E0 0400838C */  lw          $3, 0x4($4)
/* 0E17E4 001E16E4 040065AC */  sw          $5, 0x4($3)
.L001E16E8:
/* 0E17E8 001E16E8 0800E003 */  jr          $31
/* 0E17EC 001E16EC 00000000 */   nop
