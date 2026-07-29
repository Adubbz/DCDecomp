.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceVu0ApplyMatrix
/* 021688 00121588 0000A4D8 */  lqc2        $vf4, 0x0($5)
/* 02168C 0012158C 1000A5D8 */  lqc2        $vf5, 0x10($5)
/* 021690 00121590 2000A6D8 */  lqc2        $vf6, 0x20($5)
/* 021694 00121594 3000A7D8 */  lqc2        $vf7, 0x30($5)
/* 021698 00121598 0000C8D8 */  lqc2        $vf8, 0x0($6)
/* 02169C 0012159C BC21E84B */  vmulax.xyzw $ACC, $vf4, $vf8x
/* 0216A0 001215A0 BD28E84B */  vmadday.xyzw $ACC, $vf5, $vf8y
/* 0216A4 001215A4 BE30E84B */  vmaddaz.xyzw $ACC, $vf6, $vf8z
/* 0216A8 001215A8 4B3AE84B */  vmaddw.xyzw $vf9, $vf7, $vf8w
/* 0216AC 001215AC 0800E003 */  jr          $31
/* 0216B0 001215B0 000089F8 */   sqc2       $vf9, 0x0($4)
/* 0216B4 001215B4 00000000 */  nop
