.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceVu0MulVector
/* 218D0 001217D0 0000A4D8 */  lqc2       $vf4, 0x0($5)
/* 218D4 001217D4 0000C5D8 */  lqc2       $vf5, 0x0($6)
/* 218D8 001217D8 AA21E54B */  vmul.xyzw  $vf6, $vf4, $vf5
/* 218DC 001217DC 0800E003 */  jr         $31
/* 218E0 001217E0 000086F8 */   sqc2      $vf6, 0x0($4)
/* 218E4 001217E4 00000000 */  nop
