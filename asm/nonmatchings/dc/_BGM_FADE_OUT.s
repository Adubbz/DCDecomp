.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _BGM_FADE_OUT__FP12RS_STACKDATAi
/* 96040 00195F40 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 96044 00195F44 3000BF7F */  sq         $31, 0x30($sp)
/* 96048 00195F48 2000B27F */  sq         $18, 0x20($sp)
/* 9604C 00195F4C 1000B17F */  sq         $17, 0x10($sp)
/* 96050 00195F50 0000B07F */  sq         $16, 0x0($sp)
/* 96054 00195F54 288EA070 */  paddub     $17, $5, $0
/* 96058 00195F58 08009224 */  addiu      $18, $4, 0x8
/* 9605C 00195F5C D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 96060 00195F60 00000000 */   nop
/* 96064 00195F64 28864070 */  paddub     $16, $2, $0
/* 96068 00195F68 28160070 */  paddub     $2, $0, $0
/* 9606C 00195F6C 0200212A */  slti       $at, $17, 0x2
/* 96070 00195F70 04002014 */  bnez       $at, .L00195F84
/* 96074 00195F74 00000000 */   nop
/* 96078 00195F78 28264072 */  paddub     $4, $18, $0
/* 9607C 00195F7C D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 96080 00195F80 00000000 */   nop
.L00195F84:
/* 96084 00195F84 28260072 */  paddub     $4, $16, $0
/* 96088 00195F88 282E4070 */  paddub     $5, $2, $0
/* 9608C 00195F8C C467050C */  jal        SndBgmFadeOut__Fii
/* 96090 00195F90 00000000 */   nop
/* 96094 00195F94 01000224 */  addiu      $2, $0, 0x1
/* 96098 00195F98 3000BF7B */  lq         $31, 0x30($sp)
/* 9609C 00195F9C 2000B27B */  lq         $18, 0x20($sp)
/* 960A0 00195FA0 1000B17B */  lq         $17, 0x10($sp)
/* 960A4 00195FA4 0000B07B */  lq         $16, 0x0($sp)
/* 960A8 00195FA8 4000BD27 */  addiu      $sp, $sp, 0x40
/* 960AC 00195FAC 0800E003 */  jr         $31
/* 960B0 00195FB0 00000000 */   nop
/* 960B4 00195FB4 00000000 */  nop
/* 960B8 00195FB8 00000000 */  nop
/* 960BC 00195FBC 00000000 */  nop
