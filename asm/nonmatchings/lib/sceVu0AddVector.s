.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceVu0AddVector
/* 218A0 001217A0 0000A4D8 */  lqc2       $vf4, 0x0($5)
/* 218A4 001217A4 0000C5D8 */  lqc2       $vf5, 0x0($6)
/* 218A8 001217A8 A821E54B */  vadd.xyzw  $vf6, $vf4, $vf5
/* 218AC 001217AC 0800E003 */  jr         $31
/* 218B0 001217B0 000086F8 */   sqc2      $vf6, 0x0($4)
/* 218B4 001217B4 00000000 */  nop
