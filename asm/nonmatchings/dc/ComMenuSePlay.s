.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ComMenuSePlay__Fi
/* 12CFF0 0022CEF0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 12CFF4 0022CEF4 0000BF7F */  sq         $31, 0x0($sp)
/* 12CFF8 0022CEF8 05008004 */  bltz       $4, .L0022CF10
/* 12CFFC 0022CEFC 00000000 */   nop
/* 12D000 0022CF00 FFFF0524 */  addiu      $5, $0, -0x1
/* 12D004 0022CF04 28360070 */  paddub     $6, $0, $0
/* 12D008 0022CF08 AC69050C */  jal        SndSePlay__Fiii
/* 12D00C 0022CF0C 00000000 */   nop
.L0022CF10:
/* 12D010 0022CF10 0000BF7B */  lq         $31, 0x0($sp)
/* 12D014 0022CF14 1000BD27 */  addiu      $sp, $sp, 0x10
/* 12D018 0022CF18 0800E003 */  jr         $31
/* 12D01C 0022CF1C 00000000 */   nop
