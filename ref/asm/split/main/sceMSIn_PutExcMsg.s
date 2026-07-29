.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceMSIn_PutExcMsg
/* 01F440 0011F340 F0FFBD27 */  addiu       $29, $29, -0x10
/* 01F444 0011F344 2D40C000 */  daddu       $8, $6, $0
/* 01F448 0011F348 0000BFFF */  sd          $31, 0x0($29)
/* 01F44C 0011F34C 2D48E000 */  daddu       $9, $7, $0
/* 01F450 0011F350 F0000224 */  addiu       $2, $0, 0xF0
/* 01F454 0011F354 00000391 */  lbu         $3, 0x0($8)
/* 01F458 0011F358 07006210 */  beq         $3, $2, .L0011F378
/* 01F45C 0011F35C 01000825 */   addiu      $8, $8, 0x1
/* 01F460 0011F360 12000010 */  b           .L0011F3AC
/* 01F464 0011F364 FFFF0224 */   addiu      $2, $0, -0x1
.L0011F368:
/* 01F468 0011F368 7E7C040C */  jal         put_message
/* 01F46C 0011F36C 00000000 */   nop
/* 01F470 0011F370 0F000010 */  b           .L0011F3B0
/* 01F474 0011F374 0000BFDF */   ld         $31, 0x0($29)
.L0011F378:
/* 01F478 0011F378 0200222D */  sltiu       $2, $9, 0x2
/* 01F47C 0011F37C 0A004014 */  bnez        $2, .L0011F3A8
/* 01F480 0011F380 02000724 */   addiu      $7, $0, 0x2
/* 01F484 0011F384 F7000324 */  addiu       $3, $0, 0xF7
/* 01F488 0011F388 00000291 */  lbu         $2, 0x0($8)
/* 01F48C 0011F38C 00000000 */  nop
.L0011F390:
/* 01F490 0011F390 F5FF4310 */  beq         $2, $3, .L0011F368
/* 01F494 0011F394 01000825 */   addiu      $8, $8, 0x1
/* 01F498 0011F398 0100E724 */  addiu       $7, $7, 0x1
/* 01F49C 0011F39C 2B102701 */  sltu        $2, $9, $7
/* 01F4A0 0011F3A0 FBFF4050 */  beql        $2, $0, .L0011F390
/* 01F4A4 0011F3A4 00000291 */   lbu        $2, 0x0($8)
.L0011F3A8:
/* 01F4A8 0011F3A8 FFFF0224 */  addiu       $2, $0, -0x1
.L0011F3AC:
/* 01F4AC 0011F3AC 0000BFDF */  ld          $31, 0x0($29)
.L0011F3B0:
/* 01F4B0 0011F3B0 0800E003 */  jr          $31
/* 01F4B4 0011F3B4 1000BD27 */   addiu      $29, $29, 0x10
