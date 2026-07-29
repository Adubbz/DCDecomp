.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _INIT_SYS_MES__FP12RS_STACKDATAi
/* 090490 00190390 F0FFBD27 */  addiu       $29, $29, -0x10
/* 090494 00190394 0000BF7F */  sq          $31, 0x0($29)
/* 090498 00190398 3480050C */  jal         ClearSystemMes__Fv
/* 09049C 0019039C 00000000 */   nop
/* 0904A0 001903A0 01000224 */  addiu       $2, $0, 0x1
/* 0904A4 001903A4 0000BF7B */  lq          $31, 0x0($29)
/* 0904A8 001903A8 1000BD27 */  addiu       $29, $29, 0x10
/* 0904AC 001903AC 0800E003 */  jr          $31
/* 0904B0 001903B0 00000000 */   nop
/* 0904B4 001903B4 00000000 */  nop
/* 0904B8 001903B8 00000000 */  nop
/* 0904BC 001903BC 00000000 */  nop
