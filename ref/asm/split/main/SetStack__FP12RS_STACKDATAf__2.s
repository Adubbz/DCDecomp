.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetStack__FP12RS_STACKDATAf__2
/* 0BBAE0 001BB9E0 0000858C */  lw          $5, 0x0($4)
/* 0BBAE4 001BB9E4 03000324 */  addiu       $3, $0, 0x3
/* 0BBAE8 001BB9E8 0300A314 */  bne         $5, $3, .L001BB9F8
/* 0BBAEC 001BB9EC 00000000 */   nop
/* 0BBAF0 001BB9F0 0400838C */  lw          $3, 0x4($4)
/* 0BBAF4 001BB9F4 04006CE4 */  swc1        $f12, 0x4($3)
.L001BB9F8:
/* 0BBAF8 001BB9F8 0800E003 */  jr          $31
/* 0BBAFC 001BB9FC 00000000 */   nop
