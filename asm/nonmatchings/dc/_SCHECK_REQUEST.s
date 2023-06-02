.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SCHECK_REQUEST__FP12RS_STACKDATAi
/* 90870 00190770 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 90874 00190774 1000BF7F */  sq         $31, 0x10($sp)
/* 90878 00190778 0000B07F */  sq         $16, 0x0($sp)
/* 9087C 0019077C 08009024 */  addiu      $16, $4, 0x8
/* 90880 00190780 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 90884 00190784 00000000 */   nop
/* 90888 00190788 D201033C */  lui        $3, %hi(EditPartsInfo)
/* 9088C 0019078C F09B6424 */  addiu      $4, $3, %lo(EditPartsInfo)
/* 90890 00190790 282E4070 */  paddub     $5, $2, $0
/* 90894 00190794 5068060C */  jal        GetRequest__14CEditPartsInfoFi
/* 90898 00190798 00000000 */   nop
/* 9089C 0019079C 282E4070 */  paddub     $5, $2, $0
/* 908A0 001907A0 28260072 */  paddub     $4, $16, $0
/* 908A4 001907A4 F828060C */  jal        SetStack__FP12RS_STACKDATAi
/* 908A8 001907A8 00000000 */   nop
/* 908AC 001907AC 01000224 */  addiu      $2, $0, 0x1
/* 908B0 001907B0 1000BF7B */  lq         $31, 0x10($sp)
/* 908B4 001907B4 0000B07B */  lq         $16, 0x0($sp)
/* 908B8 001907B8 2000BD27 */  addiu      $sp, $sp, 0x20
/* 908BC 001907BC 0800E003 */  jr         $31
/* 908C0 001907C0 00000000 */   nop
/* 908C4 001907C4 00000000 */  nop
/* 908C8 001907C8 00000000 */  nop
/* 908CC 001907CC 00000000 */  nop
