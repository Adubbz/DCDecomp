.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _GET_OBJHDL__FP12RS_STACKDATAi
/* 0BBD80 001BBC80 C0FFBD27 */  addiu       $29, $29, -0x40
/* 0BBD84 001BBC84 3000BF7F */  sq          $31, 0x30($29)
/* 0BBD88 001BBC88 2000B27F */  sq          $18, 0x20($29)
/* 0BBD8C 001BBC8C 1000B17F */  sq          $17, 0x10($29)
/* 0BBD90 001BBC90 0000B07F */  sq          $16, 0x0($29)
/* 0BBD94 001BBC94 08009124 */  addiu       $17, $4, 0x8
/* 0BBD98 001BBC98 4CEE060C */  jal         GetStackInt__FP12RS_STACKDATA__2
/* 0BBD9C 001BBC9C 00000000 */   nop
/* 0BBDA0 001BBCA0 28964070 */  paddub      $18, $2, $0
/* 0BBDA4 001BBCA4 28262072 */  paddub      $4, $17, $0
/* 0BBDA8 001BBCA8 08009124 */  addiu       $17, $4, 0x8
/* 0BBDAC 001BBCAC 4CEE060C */  jal         GetStackInt__FP12RS_STACKDATA__2
/* 0BBDB0 001BBCB0 00000000 */   nop
/* 0BBDB4 001BBCB4 28864070 */  paddub      $16, $2, $0
/* 0BBDB8 001BBCB8 28262072 */  paddub      $4, $17, $0
/* 0BBDBC 001BBCBC 6CEE060C */  jal         GetStackString__FP12RS_STACKDATA__2
/* 0BBDC0 001BBCC0 00000000 */   nop
/* 0BBDC4 001BBCC4 288E4070 */  paddub      $17, $2, $0
/* 0BBDC8 001BBCC8 28264072 */  paddub      $4, $18, $0
/* 0BBDCC 001BBCCC 80EC060C */  jal         GetObjHDL__Fi
/* 0BBDD0 001BBCD0 00000000 */   nop
/* 0BBDD4 001BBCD4 28964070 */  paddub      $18, $2, $0
/* 0BBDD8 001BBCD8 FFFF0224 */  addiu       $2, $0, -0x1
/* 0BBDDC 001BBCDC 1B000212 */  beq         $16, $2, .L001BBD4C
/* 0BBDE0 001BBCE0 00000000 */   nop
/* 0BBDE4 001BBCE4 C89C838F */  lw          $3, -0x6338($28)
/* 0BBDE8 001BBCE8 C0101000 */  sll         $2, $16, 3
/* 0BBDEC 001BBCEC 23105000 */  subu        $2, $2, $16
/* 0BBDF0 001BBCF0 80100200 */  sll         $2, $2, 2
/* 0BBDF4 001BBCF4 21105000 */  addu        $2, $2, $16
/* 0BBDF8 001BBCF8 00110200 */  sll         $2, $2, 4
/* 0BBDFC 001BBCFC 21106200 */  addu        $2, $3, $2
/* 0BBE00 001BBD00 90044424 */  addiu       $4, $2, 0x490
/* 0BBE04 001BBD04 282E2072 */  paddub      $5, $17, $0
/* 0BBE08 001BBD08 6405070C */  jal         GetSearchFrame__13CDungeonPartsFPc
/* 0BBE0C 001BBD0C 00000000 */   nop
/* 0BBE10 001BBD10 05004010 */  beqz        $2, .L001BBD28
/* 0BBE14 001BBD14 00000000 */   nop
/* 0BBE18 001BBD18 000042AE */  sw          $2, 0x0($18)
/* 0BBE1C 001BBD1C 080040AE */  sw          $0, 0x8($18)
/* 0BBE20 001BBD20 1B000010 */  b           .L001BBD90
/* 0BBE24 001BBD24 00000000 */   nop
.L001BBD28:
/* 0BBE28 001BBD28 2A00023C */  lui         $2, %hi(LIT_700)
/* 0BBE2C 001BBD2C D0BC4424 */  addiu       $4, $2, %lo(LIT_700)
/* 0BBE30 001BBD30 282E2072 */  paddub      $5, $17, $0
/* 0BBE34 001BBD34 A611040C */  jal         printf
/* 0BBE38 001BBD38 00000000 */   nop
/* 0BBE3C 001BBD3C 000040AE */  sw          $0, 0x0($18)
/* 0BBE40 001BBD40 080040AE */  sw          $0, 0x8($18)
/* 0BBE44 001BBD44 12000010 */  b           .L001BBD90
/* 0BBE48 001BBD48 00000000 */   nop
.L001BBD4C:
/* 0BBE4C 001BBD4C C89C848F */  lw          $4, -0x6338($28)
/* 0BBE50 001BBD50 282E2072 */  paddub      $5, $17, $0
/* 0BBE54 001BBD54 CC08070C */  jal         GetFrameSearch__11CDungeonMapFPc
/* 0BBE58 001BBD58 00000000 */   nop
/* 0BBE5C 001BBD5C 05004010 */  beqz        $2, .L001BBD74
/* 0BBE60 001BBD60 00000000 */   nop
/* 0BBE64 001BBD64 000042AE */  sw          $2, 0x0($18)
/* 0BBE68 001BBD68 080040AE */  sw          $0, 0x8($18)
/* 0BBE6C 001BBD6C 08000010 */  b           .L001BBD90
/* 0BBE70 001BBD70 00000000 */   nop
.L001BBD74:
/* 0BBE74 001BBD74 2A00023C */  lui         $2, %hi(LIT_701)
/* 0BBE78 001BBD78 00BD4424 */  addiu       $4, $2, %lo(LIT_701)
/* 0BBE7C 001BBD7C 282E2072 */  paddub      $5, $17, $0
/* 0BBE80 001BBD80 A611040C */  jal         printf
/* 0BBE84 001BBD84 00000000 */   nop
/* 0BBE88 001BBD88 000040AE */  sw          $0, 0x0($18)
/* 0BBE8C 001BBD8C 080040AE */  sw          $0, 0x8($18)
.L001BBD90:
/* 0BBE90 001BBD90 01000224 */  addiu       $2, $0, 0x1
/* 0BBE94 001BBD94 3000BF7B */  lq          $31, 0x30($29)
/* 0BBE98 001BBD98 2000B27B */  lq          $18, 0x20($29)
/* 0BBE9C 001BBD9C 1000B17B */  lq          $17, 0x10($29)
/* 0BBEA0 001BBDA0 0000B07B */  lq          $16, 0x0($29)
/* 0BBEA4 001BBDA4 4000BD27 */  addiu       $29, $29, 0x40
/* 0BBEA8 001BBDA8 0800E003 */  jr          $31
/* 0BBEAC 001BBDAC 00000000 */   nop
