.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetStack__FP12RS_STACKDATAi__2
/* 0BBAC0 001BB9C0 0000868C */  lw          $6, 0x0($4)
/* 0BBAC4 001BB9C4 03000324 */  addiu       $3, $0, 0x3
/* 0BBAC8 001BB9C8 0300C314 */  bne         $6, $3, .L001BB9D8
/* 0BBACC 001BB9CC 00000000 */   nop
/* 0BBAD0 001BB9D0 0400838C */  lw          $3, 0x4($4)
/* 0BBAD4 001BB9D4 040065AC */  sw          $5, 0x4($3)
.L001BB9D8:
/* 0BBAD8 001BB9D8 0800E003 */  jr          $31
/* 0BBADC 001BB9DC 00000000 */   nop
