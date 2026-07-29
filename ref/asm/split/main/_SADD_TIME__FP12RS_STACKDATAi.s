.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SADD_TIME__FP12RS_STACKDATAi
/* 095C20 00195B20 F0FFBD27 */  addiu       $29, $29, -0x10
/* 095C24 00195B24 0000BF7F */  sq          $31, 0x0($29)
/* 095C28 00195B28 E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 095C2C 00195B2C 00000000 */   nop
/* 095C30 00195B30 1C8D848F */  lw          $4, -0x72E4($28)
/* 095C34 00195B34 06030046 */  mov.s       $f12, $f0
/* 095C38 00195B38 F85E050C */  jal         AddNowTime__9CSaveDataFf
/* 095C3C 00195B3C 00000000 */   nop
/* 095C40 00195B40 01000224 */  addiu       $2, $0, 0x1
/* 095C44 00195B44 0000BF7B */  lq          $31, 0x0($29)
/* 095C48 00195B48 1000BD27 */  addiu       $29, $29, 0x10
/* 095C4C 00195B4C 0800E003 */  jr          $31
/* 095C50 00195B50 00000000 */   nop
/* 095C54 00195B54 00000000 */  nop
/* 095C58 00195B58 00000000 */  nop
/* 095C5C 00195B5C 00000000 */  nop
