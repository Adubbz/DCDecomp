.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SP_SET_POS__FP12RS_STACKDATAi
/* 93CC0 00193BC0 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 93CC4 00193BC4 3000BF7F */  sq         $31, 0x30($sp)
/* 93CC8 00193BC8 2000B27F */  sq         $18, 0x20($sp)
/* 93CCC 00193BCC 1000B17F */  sq         $17, 0x10($sp)
/* 93CD0 00193BD0 0000B07F */  sq         $16, 0x0($sp)
/* 93CD4 00193BD4 288EA070 */  paddub     $17, $5, $0
/* 93CD8 00193BD8 08009224 */  addiu      $18, $4, 0x8
/* 93CDC 00193BDC D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 93CE0 00193BE0 00000000 */   nop
/* 93CE4 00193BE4 28264070 */  paddub     $4, $2, $0
/* 93CE8 00193BE8 5428060C */  jal        GetSprite__Fi
/* 93CEC 00193BEC 00000000 */   nop
/* 93CF0 00193BF0 28864070 */  paddub     $16, $2, $0
/* 93CF4 00193BF4 04000016 */  bnez       $16, .L00193C08
/* 93CF8 00193BF8 00000000 */   nop
/* 93CFC 00193BFC 28160070 */  paddub     $2, $0, $0
/* 93D00 00193C00 24000010 */  b          .L00193C94
/* 93D04 00193C04 00000000 */   nop
.L00193C08:
/* 93D08 00193C08 28264072 */  paddub     $4, $18, $0
/* 93D0C 00193C0C 08009224 */  addiu      $18, $4, 0x8
/* 93D10 00193C10 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 93D14 00193C14 00000000 */   nop
/* 93D18 00193C18 00008244 */  mtc1       $2, $f0
/* 93D1C 00193C1C 00000000 */  nop
/* 93D20 00193C20 20008046 */  cvt.s.w    $f0, $f0
/* 93D24 00193C24 080000E6 */  swc1       $f0, 0x8($16)
/* 93D28 00193C28 28264072 */  paddub     $4, $18, $0
/* 93D2C 00193C2C 08009224 */  addiu      $18, $4, 0x8
/* 93D30 00193C30 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 93D34 00193C34 00000000 */   nop
/* 93D38 00193C38 00008244 */  mtc1       $2, $f0
/* 93D3C 00193C3C 00000000 */  nop
/* 93D40 00193C40 20008046 */  cvt.s.w    $f0, $f0
/* 93D44 00193C44 0C0000E6 */  swc1       $f0, 0xC($16)
/* 93D48 00193C48 FFFF0224 */  addiu      $2, $0, -0x1
/* 93D4C 00193C4C 120002A6 */  sh         $2, 0x12($16)
/* 93D50 00193C50 100002A6 */  sh         $2, 0x10($16)
/* 93D54 00193C54 0400212A */  slti       $at, $17, 0x4
/* 93D58 00193C58 06002014 */  bnez       $at, .L00193C74
/* 93D5C 00193C5C 00000000 */   nop
/* 93D60 00193C60 28264072 */  paddub     $4, $18, $0
/* 93D64 00193C64 08009224 */  addiu      $18, $4, 0x8
/* 93D68 00193C68 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 93D6C 00193C6C 00000000 */   nop
/* 93D70 00193C70 100002A6 */  sh         $2, 0x10($16)
.L00193C74:
/* 93D74 00193C74 0500212A */  slti       $at, $17, 0x5
/* 93D78 00193C78 05002014 */  bnez       $at, .L00193C90
/* 93D7C 00193C7C 00000000 */   nop
/* 93D80 00193C80 28264072 */  paddub     $4, $18, $0
/* 93D84 00193C84 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 93D88 00193C88 00000000 */   nop
/* 93D8C 00193C8C 120002A6 */  sh         $2, 0x12($16)
.L00193C90:
/* 93D90 00193C90 01000224 */  addiu      $2, $0, 0x1
.L00193C94:
/* 93D94 00193C94 3000BF7B */  lq         $31, 0x30($sp)
/* 93D98 00193C98 2000B27B */  lq         $18, 0x20($sp)
/* 93D9C 00193C9C 1000B17B */  lq         $17, 0x10($sp)
/* 93DA0 00193CA0 0000B07B */  lq         $16, 0x0($sp)
/* 93DA4 00193CA4 4000BD27 */  addiu      $sp, $sp, 0x40
/* 93DA8 00193CA8 0800E003 */  jr         $31
/* 93DAC 00193CAC 00000000 */   nop
