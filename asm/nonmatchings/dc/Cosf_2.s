.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Cosf__Ff
/* 24000 00123F00 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 24004 00123F04 0000BF7F */  sq         $31, 0x0($sp)
/* 24008 00123F08 C88080C7 */  lwc1       $f0, -0x7F38($gp)
/* 2400C 00123F0C 00030C46 */  add.s      $f12, $f0, $f12
/* 24010 00123F10 908F040C */  jal        Sinf__Ff
/* 24014 00123F14 00000000 */   nop
/* 24018 00123F18 0000BF7B */  lq         $31, 0x0($sp)
/* 2401C 00123F1C 1000BD27 */  addiu      $sp, $sp, 0x10
/* 24020 00123F20 0800E003 */  jr         $31
/* 24024 00123F24 00000000 */   nop
/* 24028 00123F28 00000000 */  nop
/* 2402C 00123F2C 00000000 */  nop
