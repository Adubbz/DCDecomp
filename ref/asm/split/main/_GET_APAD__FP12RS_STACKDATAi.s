.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _GET_APAD__FP12RS_STACKDATAi
/* 08BAD0 0018B9D0 D0FFBD27 */  addiu       $29, $29, -0x30
/* 08BAD4 0018B9D4 2000BF7F */  sq          $31, 0x20($29)
/* 08BAD8 0018B9D8 1000B17F */  sq          $17, 0x10($29)
/* 08BADC 0018B9DC 0000B07F */  sq          $16, 0x0($29)
/* 08BAE0 0018B9E0 288E8070 */  paddub      $17, $4, $0
/* 08BAE4 0018B9E4 2886A070 */  paddub      $16, $5, $0
/* 08BAE8 0018B9E8 0A00001A */  blez        $16, .L0018BA14
/* 08BAEC 0018B9EC 00000000 */   nop
/* 08BAF0 0018B9F0 CC01023C */  lui         $2, %hi(GamePad)
/* 08BAF4 0018B9F4 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 08BAF8 0018B9F8 C4AD040C */  jal         GetLXf__8CGamePadFv
/* 08BAFC 0018B9FC 00000000 */   nop
/* 08BB00 0018BA00 28262072 */  paddub      $4, $17, $0
/* 08BB04 0018BA04 08009124 */  addiu       $17, $4, 0x8
/* 08BB08 0018BA08 06030046 */  mov.s       $f12, $f0
/* 08BB0C 0018BA0C 0029060C */  jal         SetStack__FP12RS_STACKDATAf
/* 08BB10 0018BA10 00000000 */   nop
.L0018BA14:
/* 08BB14 0018BA14 0200012A */  slti        $1, $16, 0x2
/* 08BB18 0018BA18 0A002014 */  bnez        $1, .L0018BA44
/* 08BB1C 0018BA1C 00000000 */   nop
/* 08BB20 0018BA20 CC01023C */  lui         $2, %hi(GamePad)
/* 08BB24 0018BA24 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 08BB28 0018BA28 D4AD040C */  jal         GetLYf__8CGamePadFv
/* 08BB2C 0018BA2C 00000000 */   nop
/* 08BB30 0018BA30 28262072 */  paddub      $4, $17, $0
/* 08BB34 0018BA34 08009124 */  addiu       $17, $4, 0x8
/* 08BB38 0018BA38 06030046 */  mov.s       $f12, $f0
/* 08BB3C 0018BA3C 0029060C */  jal         SetStack__FP12RS_STACKDATAf
/* 08BB40 0018BA40 00000000 */   nop
.L0018BA44:
/* 08BB44 0018BA44 0300012A */  slti        $1, $16, 0x3
/* 08BB48 0018BA48 0A002014 */  bnez        $1, .L0018BA74
/* 08BB4C 0018BA4C 00000000 */   nop
/* 08BB50 0018BA50 CC01023C */  lui         $2, %hi(GamePad)
/* 08BB54 0018BA54 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 08BB58 0018BA58 A4AD040C */  jal         GetRXf__8CGamePadFv
/* 08BB5C 0018BA5C 00000000 */   nop
/* 08BB60 0018BA60 28262072 */  paddub      $4, $17, $0
/* 08BB64 0018BA64 08009124 */  addiu       $17, $4, 0x8
/* 08BB68 0018BA68 06030046 */  mov.s       $f12, $f0
/* 08BB6C 0018BA6C 0029060C */  jal         SetStack__FP12RS_STACKDATAf
/* 08BB70 0018BA70 00000000 */   nop
.L0018BA74:
/* 08BB74 0018BA74 0400012A */  slti        $1, $16, 0x4
/* 08BB78 0018BA78 09002014 */  bnez        $1, .L0018BAA0
/* 08BB7C 0018BA7C 00000000 */   nop
/* 08BB80 0018BA80 CC01023C */  lui         $2, %hi(GamePad)
/* 08BB84 0018BA84 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 08BB88 0018BA88 B4AD040C */  jal         GetRYf__8CGamePadFv
/* 08BB8C 0018BA8C 00000000 */   nop
/* 08BB90 0018BA90 28262072 */  paddub      $4, $17, $0
/* 08BB94 0018BA94 06030046 */  mov.s       $f12, $f0
/* 08BB98 0018BA98 0029060C */  jal         SetStack__FP12RS_STACKDATAf
/* 08BB9C 0018BA9C 00000000 */   nop
.L0018BAA0:
/* 08BBA0 0018BAA0 01000224 */  addiu       $2, $0, 0x1
/* 08BBA4 0018BAA4 2000BF7B */  lq          $31, 0x20($29)
/* 08BBA8 0018BAA8 1000B17B */  lq          $17, 0x10($29)
/* 08BBAC 0018BAAC 0000B07B */  lq          $16, 0x0($29)
/* 08BBB0 0018BAB0 3000BD27 */  addiu       $29, $29, 0x30
/* 08BBB4 0018BAB4 0800E003 */  jr          $31
/* 08BBB8 0018BAB8 00000000 */   nop
/* 08BBBC 0018BABC 00000000 */  nop
