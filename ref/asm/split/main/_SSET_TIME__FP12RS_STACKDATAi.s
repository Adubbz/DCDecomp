.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SSET_TIME__FP12RS_STACKDATAi
/* 095B90 00195A90 F0FFBD27 */  addiu       $29, $29, -0x10
/* 095B94 00195A94 0000BF7F */  sq          $31, 0x0($29)
/* 095B98 00195A98 E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 095B9C 00195A9C 00000000 */   nop
/* 095BA0 00195AA0 1C8D848F */  lw          $4, -0x72E4($28)
/* 095BA4 00195AA4 06030046 */  mov.s       $f12, $f0
/* 095BA8 00195AA8 F05E050C */  jal         SetNowTime__9CSaveDataFf
/* 095BAC 00195AAC 00000000 */   nop
/* 095BB0 00195AB0 01000224 */  addiu       $2, $0, 0x1
/* 095BB4 00195AB4 0000BF7B */  lq          $31, 0x0($29)
/* 095BB8 00195AB8 1000BD27 */  addiu       $29, $29, 0x10
/* 095BBC 00195ABC 0800E003 */  jr          $31
/* 095BC0 00195AC0 00000000 */   nop
/* 095BC4 00195AC4 00000000 */  nop
/* 095BC8 00195AC8 00000000 */  nop
/* 095BCC 00195ACC 00000000 */  nop
