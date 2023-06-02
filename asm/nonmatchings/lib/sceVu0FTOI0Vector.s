.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceVu0FTOI0Vector
/* 21978 00121878 0000A4D8 */  lqc2       $vf4, 0x0($5)
/* 2197C 0012187C 7C21E54B */  vftoi0.xyzw $vf5, $vf4
/* 21980 00121880 0800E003 */  jr         $31
/* 21984 00121884 000085F8 */   sqc2      $vf5, 0x0($4)
