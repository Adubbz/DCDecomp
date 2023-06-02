.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceVu0FTOI4Vector
/* 21968 00121868 0000A4D8 */  lqc2       $vf4, 0x0($5)
/* 2196C 0012186C 7D21E54B */  vftoi4.xyzw $vf5, $vf4
/* 21970 00121870 0800E003 */  jr         $31
/* 21974 00121874 000085F8 */   sqc2      $vf5, 0x0($4)
