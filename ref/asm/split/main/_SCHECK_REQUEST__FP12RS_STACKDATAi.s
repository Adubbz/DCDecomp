.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SCHECK_REQUEST__FP12RS_STACKDATAi
/* 090870 00190770 E0FFBD27 */  addiu       $29, $29, -0x20
/* 090874 00190774 1000BF7F */  sq          $31, 0x10($29)
/* 090878 00190778 0000B07F */  sq          $16, 0x0($29)
/* 09087C 0019077C 08009024 */  addiu       $16, $4, 0x8
/* 090880 00190780 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 090884 00190784 00000000 */   nop
/* 090888 00190788 D201033C */  lui         $3, %hi(EditPartsInfo)
/* 09088C 0019078C F09B6424 */  addiu       $4, $3, %lo(EditPartsInfo)
/* 090890 00190790 282E4070 */  paddub      $5, $2, $0
/* 090894 00190794 5068060C */  jal         GetRequest__14CEditPartsInfoFi
/* 090898 00190798 00000000 */   nop
/* 09089C 0019079C 282E4070 */  paddub      $5, $2, $0
/* 0908A0 001907A0 28260072 */  paddub      $4, $16, $0
/* 0908A4 001907A4 F828060C */  jal         SetStack__FP12RS_STACKDATAi
/* 0908A8 001907A8 00000000 */   nop
/* 0908AC 001907AC 01000224 */  addiu       $2, $0, 0x1
/* 0908B0 001907B0 1000BF7B */  lq          $31, 0x10($29)
/* 0908B4 001907B4 0000B07B */  lq          $16, 0x0($29)
/* 0908B8 001907B8 2000BD27 */  addiu       $29, $29, 0x20
/* 0908BC 001907BC 0800E003 */  jr          $31
/* 0908C0 001907C0 00000000 */   nop
/* 0908C4 001907C4 00000000 */  nop
/* 0908C8 001907C8 00000000 */  nop
/* 0908CC 001907CC 00000000 */  nop
