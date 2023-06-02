.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceVu0ITOF0Vector
/* 21998 00121898 0000A4D8 */  lqc2       $vf4, 0x0($5)
/* 2199C 0012189C 3C21E54B */  vitof0.xyzw $vf5, $vf4
/* 219A0 001218A0 0800E003 */  jr         $31
/* 219A4 001218A4 000085F8 */   sqc2      $vf5, 0x0($4)
