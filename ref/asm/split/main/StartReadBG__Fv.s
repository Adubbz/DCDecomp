.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel StartReadBG__Fv
/* 03EDC0 0013ECC0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 03EDC4 0013ECC4 0000BF7F */  sq          $31, 0x0($29)
/* 03EDC8 0013ECC8 94FA040C */  jal         InitReadBG__Fv
/* 03EDCC 0013ECCC 00000000 */   nop
/* 03EDD0 0013ECD0 0000BF7B */  lq          $31, 0x0($29)
/* 03EDD4 0013ECD4 1000BD27 */  addiu       $29, $29, 0x10
/* 03EDD8 0013ECD8 0800E003 */  jr          $31
/* 03EDDC 0013ECDC 00000000 */   nop
