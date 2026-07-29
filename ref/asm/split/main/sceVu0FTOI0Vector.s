.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceVu0FTOI0Vector
/* 021978 00121878 0000A4D8 */  lqc2        $vf4, 0x0($5)
/* 02197C 0012187C 7C21E54B */  vftoi0.xyzw $vf5, $vf4
/* 021980 00121880 0800E003 */  jr          $31
/* 021984 00121884 000085F8 */   sqc2       $vf5, 0x0($4)
