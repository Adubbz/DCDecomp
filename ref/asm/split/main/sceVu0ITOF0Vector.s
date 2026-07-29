.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceVu0ITOF0Vector
/* 021998 00121898 0000A4D8 */  lqc2        $vf4, 0x0($5)
/* 02199C 0012189C 3C21E54B */  vitof0.xyzw $vf5, $vf4
/* 0219A0 001218A0 0800E003 */  jr          $31
/* 0219A4 001218A4 000085F8 */   sqc2       $vf5, 0x0($4)
