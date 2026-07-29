.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel sceVu0MulMatrix
/* 0216B8 001215B8 0000A4D8 */  lqc2        $vf4, 0x0($5)
/* 0216BC 001215BC 1000A5D8 */  lqc2        $vf5, 0x10($5)
/* 0216C0 001215C0 2000A6D8 */  lqc2        $vf6, 0x20($5)
/* 0216C4 001215C4 3000A7D8 */  lqc2        $vf7, 0x30($5)
/* 0216C8 001215C8 04000724 */  addiu       $7, $0, 0x4
_loopMulMatrix:
/* 0216CC 001215CC 0000C8D8 */  lqc2        $vf8, 0x0($6)
/* 0216D0 001215D0 BC21E84B */  vmulax.xyzw $ACC, $vf4, $vf8x
/* 0216D4 001215D4 BD28E84B */  vmadday.xyzw $ACC, $vf5, $vf8y
/* 0216D8 001215D8 BE30E84B */  vmaddaz.xyzw $ACC, $vf6, $vf8z
/* 0216DC 001215DC 4B3AE84B */  vmaddw.xyzw $vf9, $vf7, $vf8w
/* 0216E0 001215E0 000089F8 */  sqc2        $vf9, 0x0($4)
/* 0216E4 001215E4 FFFFE720 */  addi        $7, $7, -0x1 /* handwritten instruction */
/* 0216E8 001215E8 1000C620 */  addi        $6, $6, 0x10 /* handwritten instruction */
/* 0216EC 001215EC F7FF0714 */  bne         $0, $7, _loopMulMatrix
/* 0216F0 001215F0 10008420 */   addi       $4, $4, 0x10 /* handwritten instruction */
/* 0216F4 001215F4 0800E003 */  jr          $31
/* 0216F8 001215F8 00000000 */   nop
/* 0216FC 001215FC 00000000 */  nop
