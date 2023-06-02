.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LoadPackData3__10CCharacterFPUiPcP14CDataAlloc2_1_iP14CDataAlloc2_1_ii
/* 39990 00139890 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 39994 00139894 1000BF7F */  sq         $31, 0x10($sp)
/* 39998 00139898 281E0071 */  paddub     $3, $8, $0
/* 3999C 0013989C 28162071 */  paddub     $2, $9, $0
/* 399A0 001398A0 0000ABFF */  sd         $11, 0x0($sp)
/* 399A4 001398A4 0800AAFF */  sd         $10, 0x8($sp)
/* 399A8 001398A8 2846E070 */  paddub     $8, $7, $0
/* 399AC 001398AC 284EE070 */  paddub     $9, $7, $0
/* 399B0 001398B0 28566070 */  paddub     $10, $3, $0
/* 399B4 001398B4 285E4070 */  paddub     $11, $2, $0
/* 399B8 001398B8 44E7040C */  jal        ReadInfo__FP10CCharacterPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_P14CDataAlloc2_1_iP14CDataAlloc2_1_ii
/* 399BC 001398BC 00000000 */   nop
/* 399C0 001398C0 1000BF7B */  lq         $31, 0x10($sp)
/* 399C4 001398C4 2000BD27 */  addiu      $sp, $sp, 0x20
/* 399C8 001398C8 0800E003 */  jr         $31
/* 399CC 001398CC 00000000 */   nop
