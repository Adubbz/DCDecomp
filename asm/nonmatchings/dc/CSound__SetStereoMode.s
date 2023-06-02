.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetStereoMode__6CSoundFi
/* 46A90 00146990 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 46A94 00146994 0000BF7F */  sq         $31, 0x0($sp)
/* 46A98 00146998 C0000424 */  addiu      $4, $0, 0xC0
/* 46A9C 0014699C 801E050C */  jal        ezMidi__Fii
/* 46AA0 001469A0 00000000 */   nop
/* 46AA4 001469A4 0000BF7B */  lq         $31, 0x0($sp)
/* 46AA8 001469A8 1000BD27 */  addiu      $sp, $sp, 0x10
/* 46AAC 001469AC 0800E003 */  jr         $31
/* 46AB0 001469B0 00000000 */   nop
/* 46AB4 001469B4 00000000 */  nop
/* 46AB8 001469B8 00000000 */  nop
/* 46ABC 001469BC 00000000 */  nop
