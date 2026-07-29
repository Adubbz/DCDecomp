.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceVu0ITOF4Vector
/* 021988 00121888 0000A4D8 */  lqc2        $vf4, 0x0($5)
/* 02198C 0012188C 3D21E54B */  vitof4.xyzw $vf5, $vf4
/* 021990 00121890 0800E003 */  jr          $31
/* 021994 00121894 000085F8 */   sqc2       $vf5, 0x0($4)
