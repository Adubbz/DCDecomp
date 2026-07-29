.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel LoadFile__FPcPvPi
/* 03F460 0013F360 E0FFBD27 */  addiu       $29, $29, -0x20
/* 03F464 0013F364 1000BF7F */  sq          $31, 0x10($29)
/* 03F468 0013F368 0000B07F */  sq          $16, 0x0($29)
/* 03F46C 0013F36C 28868070 */  paddub      $16, $4, $0
/* 03F470 0013F370 283E0070 */  paddub      $7, $0, $0
/* 03F474 0013F374 F4FC040C */  jal         LoadFile2__FPcPvPii
/* 03F478 0013F378 00000000 */   nop
/* 03F47C 0013F37C 0D004014 */  bnez        $2, .L0013F3B4
/* 03F480 0013F380 00000000 */   nop
/* 03F484 0013F384 2A00023C */  lui         $2, %hi(LIT_439)
/* 03F488 0013F388 50914424 */  addiu       $4, $2, %lo(LIT_439)
/* 03F48C 0013F38C 282E0072 */  paddub      $5, $16, $0
/* 03F490 0013F390 A611040C */  jal         printf
/* 03F494 0013F394 00000000 */   nop
/* 03F498 0013F398 2A00023C */  lui         $2, %hi(LIT_390)
/* 03F49C 0013F39C 38914424 */  addiu       $4, $2, %lo(LIT_390)
/* 03F4A0 0013F3A0 E4020524 */  addiu       $5, $0, 0x2E4
/* 03F4A4 0013F3A4 2A00023C */  lui         $2, %hi(LIT_391)
/* 03F4A8 0013F3A8 40914624 */  addiu       $6, $2, %lo(LIT_391)
/* 03F4AC 0013F3AC 7800040C */  jal         __assert
/* 03F4B0 0013F3B0 00000000 */   nop
.L0013F3B4:
/* 03F4B4 0013F3B4 01000224 */  addiu       $2, $0, 0x1
/* 03F4B8 0013F3B8 1000BF7B */  lq          $31, 0x10($29)
/* 03F4BC 0013F3BC 0000B07B */  lq          $16, 0x0($29)
/* 03F4C0 0013F3C0 2000BD27 */  addiu       $29, $29, 0x20
/* 03F4C4 0013F3C4 0800E003 */  jr          $31
/* 03F4C8 0013F3C8 00000000 */   nop
/* 03F4CC 0013F3CC 00000000 */  nop
