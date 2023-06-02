.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SKIP__FP12RS_STACKDATAi
/* 8C040 0018BF40 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 8C044 0018BF44 0000BF7F */  sq         $31, 0x0($sp)
/* 8C048 0018BF48 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8C04C 0018BF4C 00000000 */   nop
/* 8C050 0018BF50 409282AF */  sw         $2, -0x6DC0($gp)
/* 8C054 0018BF54 01000224 */  addiu      $2, $0, 0x1
/* 8C058 0018BF58 0000BF7B */  lq         $31, 0x0($sp)
/* 8C05C 0018BF5C 1000BD27 */  addiu      $sp, $sp, 0x10
/* 8C060 0018BF60 0800E003 */  jr         $31
/* 8C064 0018BF64 00000000 */   nop
/* 8C068 0018BF68 00000000 */  nop
/* 8C06C 0018BF6C 00000000 */  nop
