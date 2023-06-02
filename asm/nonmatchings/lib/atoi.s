.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel atoi
/* 338 00100238 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 33C 0010023C 2D280000 */  daddu      $5, $0, $0
/* 340 00100240 0000BFFF */  sd         $31, 0x0($sp)
/* 344 00100244 621B040C */  jal        strtol
/* 348 00100248 0A000624 */   addiu     $6, $0, 0xA
/* 34C 0010024C 0000BFDF */  ld         $31, 0x0($sp)
/* 350 00100250 3C100200 */  dsll32     $2, $2, 0
/* 354 00100254 3F100200 */  dsra32     $2, $2, 0
/* 358 00100258 0800E003 */  jr         $31
/* 35C 0010025C 1000BD27 */   addiu     $sp, $sp, 0x10
