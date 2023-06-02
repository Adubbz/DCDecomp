.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel setlocale
/* 26E8 001025E8 2D108000 */  daddu      $2, $4, $0
/* 26EC 001025EC 2500033C */  lui        $3, (0x250000 >> 16)
/* 26F0 001025F0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 26F4 001025F4 2D30A000 */  daddu      $6, $5, $0
/* 26F8 001025F8 ECFD648C */  lw         $4, -0x214($3)
/* 26FC 001025FC 0000BFFF */  sd         $31, 0x0($sp)
/* 2700 00102600 5409040C */  jal        _setlocale_r
/* 2704 00102604 2D284000 */   daddu     $5, $2, $0
/* 2708 00102608 0000BFDF */  ld         $31, 0x0($sp)
/* 270C 0010260C 0800E003 */  jr         $31
/* 2710 00102610 1000BD27 */   addiu     $sp, $sp, 0x10
/* 2714 00102614 00000000 */  nop
