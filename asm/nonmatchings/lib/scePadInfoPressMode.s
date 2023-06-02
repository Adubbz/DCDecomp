.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel scePadInfoPressMode
/* 204D0 001203D0 2D308000 */  daddu      $6, $4, $0
/* 204D4 001203D4 70000324 */  addiu      $3, $0, 0x70
/* 204D8 001203D8 1C000424 */  addiu      $4, $0, 0x1C
/* 204DC 001203DC 1818C370 */  mult1      $3, $6, $3
/* 204E0 001203E0 1820A400 */  mult       $4, $5, $4
/* 204E4 001203E4 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 204E8 001203E8 2B00023C */  lui        $2, %hi(D_002A9C90)
/* 204EC 001203EC 0000BFFF */  sd         $31, 0x0($sp)
/* 204F0 001203F0 909C4224 */  addiu      $2, $2, %lo(D_002A9C90)
/* 204F4 001203F4 21208300 */  addu       $4, $4, $3
/* 204F8 001203F8 21104400 */  addu       $2, $2, $4
/* 204FC 001203FC 1000438C */  lw         $3, 0x10($2)
/* 20500 00120400 07006010 */  beqz       $3, .L00120420
/* 20504 00120404 2D100000 */   daddu     $2, $0, $0
/* 20508 00120408 9A80040C */  jal        scePadGetButtonMask
/* 2050C 0012040C 2D20C000 */   daddu     $4, $6, $0
/* 20510 00120410 0300033C */  lui        $3, (0x3FFFF >> 16)
/* 20514 00120414 FFFF6334 */  ori        $3, $3, (0x3FFFF & 0xFFFF)
/* 20518 00120418 26104300 */  xor        $2, $2, $3
/* 2051C 0012041C 0100422C */  sltiu      $2, $2, 0x1
.L00120420:
/* 20520 00120420 0000BFDF */  ld         $31, 0x0($sp)
/* 20524 00120424 0800E003 */  jr         $31
/* 20528 00120428 1000BD27 */   addiu     $sp, $sp, 0x10
/* 2052C 0012042C 00000000 */  nop
