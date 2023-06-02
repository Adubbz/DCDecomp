.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LoadFile__FPcPvPi
/* 3F460 0013F360 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 3F464 0013F364 1000BF7F */  sq         $31, 0x10($sp)
/* 3F468 0013F368 0000B07F */  sq         $16, 0x0($sp)
/* 3F46C 0013F36C 28868070 */  paddub     $16, $4, $0
/* 3F470 0013F370 283E0070 */  paddub     $7, $0, $0
/* 3F474 0013F374 F4FC040C */  jal        LoadFile2__FPcPvPii
/* 3F478 0013F378 00000000 */   nop
/* 3F47C 0013F37C 0D004014 */  bnez       $2, .L0013F3B4
/* 3F480 0013F380 00000000 */   nop
/* 3F484 0013F384 2A00023C */  lui        $2, %hi(_439)
/* 3F488 0013F388 50914424 */  addiu      $4, $2, %lo(_439)
/* 3F48C 0013F38C 282E0072 */  paddub     $5, $16, $0
/* 3F490 0013F390 A611040C */  jal        printf
/* 3F494 0013F394 00000000 */   nop
/* 3F498 0013F398 2A00023C */  lui        $2, %hi(_390)
/* 3F49C 0013F39C 38914424 */  addiu      $4, $2, %lo(_390)
/* 3F4A0 0013F3A0 E4020524 */  addiu      $5, $0, 0x2E4
/* 3F4A4 0013F3A4 2A00023C */  lui        $2, %hi(_391)
/* 3F4A8 0013F3A8 40914624 */  addiu      $6, $2, %lo(_391)
/* 3F4AC 0013F3AC 7800040C */  jal        __assert
/* 3F4B0 0013F3B0 00000000 */   nop
.L0013F3B4:
/* 3F4B4 0013F3B4 01000224 */  addiu      $2, $0, 0x1
/* 3F4B8 0013F3B8 1000BF7B */  lq         $31, 0x10($sp)
/* 3F4BC 0013F3BC 0000B07B */  lq         $16, 0x0($sp)
/* 3F4C0 0013F3C0 2000BD27 */  addiu      $sp, $sp, 0x20
/* 3F4C4 0013F3C4 0800E003 */  jr         $31
/* 3F4C8 0013F3C8 00000000 */   nop
/* 3F4CC 0013F3CC 00000000 */  nop
