.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _ASQ_ANIME__FP12RS_STACKDATAi
/* 94B50 00194A50 80FFBD27 */  addiu      $sp, $sp, -0x80
/* 94B54 00194A54 7000BF7F */  sq         $31, 0x70($sp)
/* 94B58 00194A58 6000B67F */  sq         $22, 0x60($sp)
/* 94B5C 00194A5C 5000B57F */  sq         $21, 0x50($sp)
/* 94B60 00194A60 4000B47F */  sq         $20, 0x40($sp)
/* 94B64 00194A64 3000B37F */  sq         $19, 0x30($sp)
/* 94B68 00194A68 2000B27F */  sq         $18, 0x20($sp)
/* 94B6C 00194A6C 1000B17F */  sq         $17, 0x10($sp)
/* 94B70 00194A70 0000B07F */  sq         $16, 0x0($sp)
/* 94B74 00194A74 28AEA070 */  paddub     $21, $5, $0
/* 94B78 00194A78 08009624 */  addiu      $22, $4, 0x8
/* 94B7C 00194A7C D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 94B80 00194A80 00000000 */   nop
/* 94B84 00194A84 28264070 */  paddub     $4, $2, $0
/* 94B88 00194A88 242C060C */  jal        GetActSeq__Fi
/* 94B8C 00194A8C 00000000 */   nop
/* 94B90 00194A90 28864070 */  paddub     $16, $2, $0
/* 94B94 00194A94 04000016 */  bnez       $16, .L00194AA8
/* 94B98 00194A98 00000000 */   nop
/* 94B9C 00194A9C 28160070 */  paddub     $2, $0, $0
/* 94BA0 00194AA0 28000010 */  b          .L00194B44
/* 94BA4 00194AA4 00000000 */   nop
.L00194AA8:
/* 94BA8 00194AA8 01001124 */  addiu      $17, $0, 0x1
/* 94BAC 00194AAC 28960070 */  paddub     $18, $0, $0
/* 94BB0 00194AB0 289E0070 */  paddub     $19, $0, $0
/* 94BB4 00194AB4 2826C072 */  paddub     $4, $22, $0
/* 94BB8 00194AB8 08009624 */  addiu      $22, $4, 0x8
/* 94BBC 00194ABC D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 94BC0 00194AC0 00000000 */   nop
/* 94BC4 00194AC4 28A64070 */  paddub     $20, $2, $0
/* 94BC8 00194AC8 0300A22A */  slti       $2, $21, 0x3
/* 94BCC 00194ACC 06004014 */  bnez       $2, .L00194AE8
/* 94BD0 00194AD0 00000000 */   nop
/* 94BD4 00194AD4 2826C072 */  paddub     $4, $22, $0
/* 94BD8 00194AD8 08009624 */  addiu      $22, $4, 0x8
/* 94BDC 00194ADC D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 94BE0 00194AE0 00000000 */   nop
/* 94BE4 00194AE4 288E4070 */  paddub     $17, $2, $0
.L00194AE8:
/* 94BE8 00194AE8 0400A22A */  slti       $2, $21, 0x4
/* 94BEC 00194AEC 06004014 */  bnez       $2, .L00194B08
/* 94BF0 00194AF0 00000000 */   nop
/* 94BF4 00194AF4 2826C072 */  paddub     $4, $22, $0
/* 94BF8 00194AF8 08009624 */  addiu      $22, $4, 0x8
/* 94BFC 00194AFC D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 94C00 00194B00 00000000 */   nop
/* 94C04 00194B04 28964070 */  paddub     $18, $2, $0
.L00194B08:
/* 94C08 00194B08 0500A22A */  slti       $2, $21, 0x5
/* 94C0C 00194B0C 05004014 */  bnez       $2, .L00194B24
/* 94C10 00194B10 00000000 */   nop
/* 94C14 00194B14 2826C072 */  paddub     $4, $22, $0
/* 94C18 00194B18 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 94C1C 00194B1C 00000000 */   nop
/* 94C20 00194B20 289E4070 */  paddub     $19, $2, $0
.L00194B24:
/* 94C24 00194B24 28260072 */  paddub     $4, $16, $0
/* 94C28 00194B28 282E8072 */  paddub     $5, $20, $0
/* 94C2C 00194B2C 28362072 */  paddub     $6, $17, $0
/* 94C30 00194B30 283E4072 */  paddub     $7, $18, $0
/* 94C34 00194B34 28466072 */  paddub     $8, $19, $0
/* 94C38 00194B38 E054050C */  jal        AnimeSeq__10CActionSeqFiiii
/* 94C3C 00194B3C 00000000 */   nop
/* 94C40 00194B40 01000224 */  addiu      $2, $0, 0x1
.L00194B44:
/* 94C44 00194B44 7000BF7B */  lq         $31, 0x70($sp)
/* 94C48 00194B48 6000B67B */  lq         $22, 0x60($sp)
/* 94C4C 00194B4C 5000B57B */  lq         $21, 0x50($sp)
/* 94C50 00194B50 4000B47B */  lq         $20, 0x40($sp)
/* 94C54 00194B54 3000B37B */  lq         $19, 0x30($sp)
/* 94C58 00194B58 2000B27B */  lq         $18, 0x20($sp)
/* 94C5C 00194B5C 1000B17B */  lq         $17, 0x10($sp)
/* 94C60 00194B60 0000B07B */  lq         $16, 0x0($sp)
/* 94C64 00194B64 8000BD27 */  addiu      $sp, $sp, 0x80
/* 94C68 00194B68 0800E003 */  jr         $31
/* 94C6C 00194B6C 00000000 */   nop
