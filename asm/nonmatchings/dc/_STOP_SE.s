.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _STOP_SE__FP12RS_STACKDATAi
/* 96290 00196190 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 96294 00196194 0000BF7F */  sq         $31, 0x0($sp)
/* 96298 00196198 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 9629C 0019619C 00000000 */   nop
/* 962A0 001961A0 28264070 */  paddub     $4, $2, $0
/* 962A4 001961A4 282E0070 */  paddub     $5, $0, $0
/* 962A8 001961A8 2C6A050C */  jal        SndSeStop__Fii
/* 962AC 001961AC 00000000 */   nop
/* 962B0 001961B0 01000224 */  addiu      $2, $0, 0x1
/* 962B4 001961B4 0000BF7B */  lq         $31, 0x0($sp)
/* 962B8 001961B8 1000BD27 */  addiu      $sp, $sp, 0x10
/* 962BC 001961BC 0800E003 */  jr         $31
/* 962C0 001961C0 00000000 */   nop
/* 962C4 001961C4 00000000 */  nop
/* 962C8 001961C8 00000000 */  nop
/* 962CC 001961CC 00000000 */  nop
