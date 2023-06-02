.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel signal
/* 4FF0 00104EF0 2D108000 */  daddu      $2, $4, $0
/* 4FF4 00104EF4 2500033C */  lui        $3, (0x250000 >> 16)
/* 4FF8 00104EF8 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 4FFC 00104EFC 2D30A000 */  daddu      $6, $5, $0
/* 5000 00104F00 ECFD648C */  lw         $4, -0x214($3)
/* 5004 00104F04 0000BFFF */  sd         $31, 0x0($sp)
/* 5008 00104F08 2413040C */  jal        _signal_r
/* 500C 00104F0C 2D284000 */   daddu     $5, $2, $0
/* 5010 00104F10 0000BFDF */  ld         $31, 0x0($sp)
/* 5014 00104F14 0800E003 */  jr         $31
/* 5018 00104F18 1000BD27 */   addiu     $sp, $sp, 0x10
/* 501C 00104F1C 00000000 */  nop
