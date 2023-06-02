.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GET_APAD__FP12RS_STACKDATAi
/* 8BAD0 0018B9D0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 8BAD4 0018B9D4 2000BF7F */  sq         $31, 0x20($sp)
/* 8BAD8 0018B9D8 1000B17F */  sq         $17, 0x10($sp)
/* 8BADC 0018B9DC 0000B07F */  sq         $16, 0x0($sp)
/* 8BAE0 0018B9E0 288E8070 */  paddub     $17, $4, $0
/* 8BAE4 0018B9E4 2886A070 */  paddub     $16, $5, $0
/* 8BAE8 0018B9E8 0A00001A */  blez       $16, .L0018BA14
/* 8BAEC 0018B9EC 00000000 */   nop
/* 8BAF0 0018B9F0 CC01023C */  lui        $2, %hi(GamePad)
/* 8BAF4 0018B9F4 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 8BAF8 0018B9F8 C4AD040C */  jal        GetLXf__8CGamePadFv
/* 8BAFC 0018B9FC 00000000 */   nop
/* 8BB00 0018BA00 28262072 */  paddub     $4, $17, $0
/* 8BB04 0018BA04 08009124 */  addiu      $17, $4, 0x8
/* 8BB08 0018BA08 06030046 */  mov.s      $f12, $f0
/* 8BB0C 0018BA0C 0029060C */  jal        SetStack__FP12RS_STACKDATAf
/* 8BB10 0018BA10 00000000 */   nop
.L0018BA14:
/* 8BB14 0018BA14 0200012A */  slti       $at, $16, 0x2
/* 8BB18 0018BA18 0A002014 */  bnez       $at, .L0018BA44
/* 8BB1C 0018BA1C 00000000 */   nop
/* 8BB20 0018BA20 CC01023C */  lui        $2, %hi(GamePad)
/* 8BB24 0018BA24 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 8BB28 0018BA28 D4AD040C */  jal        GetLYf__8CGamePadFv
/* 8BB2C 0018BA2C 00000000 */   nop
/* 8BB30 0018BA30 28262072 */  paddub     $4, $17, $0
/* 8BB34 0018BA34 08009124 */  addiu      $17, $4, 0x8
/* 8BB38 0018BA38 06030046 */  mov.s      $f12, $f0
/* 8BB3C 0018BA3C 0029060C */  jal        SetStack__FP12RS_STACKDATAf
/* 8BB40 0018BA40 00000000 */   nop
.L0018BA44:
/* 8BB44 0018BA44 0300012A */  slti       $at, $16, 0x3
/* 8BB48 0018BA48 0A002014 */  bnez       $at, .L0018BA74
/* 8BB4C 0018BA4C 00000000 */   nop
/* 8BB50 0018BA50 CC01023C */  lui        $2, %hi(GamePad)
/* 8BB54 0018BA54 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 8BB58 0018BA58 A4AD040C */  jal        GetRXf__8CGamePadFv
/* 8BB5C 0018BA5C 00000000 */   nop
/* 8BB60 0018BA60 28262072 */  paddub     $4, $17, $0
/* 8BB64 0018BA64 08009124 */  addiu      $17, $4, 0x8
/* 8BB68 0018BA68 06030046 */  mov.s      $f12, $f0
/* 8BB6C 0018BA6C 0029060C */  jal        SetStack__FP12RS_STACKDATAf
/* 8BB70 0018BA70 00000000 */   nop
.L0018BA74:
/* 8BB74 0018BA74 0400012A */  slti       $at, $16, 0x4
/* 8BB78 0018BA78 09002014 */  bnez       $at, .L0018BAA0
/* 8BB7C 0018BA7C 00000000 */   nop
/* 8BB80 0018BA80 CC01023C */  lui        $2, %hi(GamePad)
/* 8BB84 0018BA84 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 8BB88 0018BA88 B4AD040C */  jal        GetRYf__8CGamePadFv
/* 8BB8C 0018BA8C 00000000 */   nop
/* 8BB90 0018BA90 28262072 */  paddub     $4, $17, $0
/* 8BB94 0018BA94 06030046 */  mov.s      $f12, $f0
/* 8BB98 0018BA98 0029060C */  jal        SetStack__FP12RS_STACKDATAf
/* 8BB9C 0018BA9C 00000000 */   nop
.L0018BAA0:
/* 8BBA0 0018BAA0 01000224 */  addiu      $2, $0, 0x1
/* 8BBA4 0018BAA4 2000BF7B */  lq         $31, 0x20($sp)
/* 8BBA8 0018BAA8 1000B17B */  lq         $17, 0x10($sp)
/* 8BBAC 0018BAAC 0000B07B */  lq         $16, 0x0($sp)
/* 8BBB0 0018BAB0 3000BD27 */  addiu      $sp, $sp, 0x30
/* 8BBB4 0018BAB4 0800E003 */  jr         $31
/* 8BBB8 0018BAB8 00000000 */   nop
/* 8BBBC 0018BABC 00000000 */  nop
