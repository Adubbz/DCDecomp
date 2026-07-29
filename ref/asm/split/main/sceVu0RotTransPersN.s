.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel sceVu0RotTransPersN
/* 022128 00122028 0000A4D8 */  lqc2        $vf4, 0x0($5)
/* 02212C 0012202C 1000A5D8 */  lqc2        $vf5, 0x10($5)
/* 022130 00122030 2000A6D8 */  lqc2        $vf6, 0x20($5)
/* 022134 00122034 3000A7D8 */  lqc2        $vf7, 0x30($5)
_rotTPN_loop:
/* 022138 00122038 0000C8D8 */  lqc2        $vf8, 0x0($6)
/* 02213C 0012203C BC21E84B */  vmulax.xyzw $ACC, $vf4, $vf8x
/* 022140 00122040 BD28E84B */  vmadday.xyzw $ACC, $vf5, $vf8y
/* 022144 00122044 BE30E84B */  vmaddaz.xyzw $ACC, $vf6, $vf8z
/* 022148 00122048 4B3AE84B */  vmaddw.xyzw $vf9, $vf7, $vf8w
/* 02214C 0012204C BC03E94B */  vdiv        $Q, $vf0w, $vf9w
/* 022150 00122050 BF03004A */  vwaitq
/* 022154 00122054 5C4AC04B */  vmulq.xyz   $vf9, $vf9, $Q
/* 022158 00122058 02000011 */  beqz        $8, _rotTPN
/* 02215C 0012205C 7D49EA4B */   vftoi4.xyzw $vf10, $vf9
/* 022160 00122060 7C496A4A */  vftoi0.zw   $vf10, $vf9
_rotTPN:
/* 022164 00122064 00008AF8 */  sqc2        $vf10, 0x0($4)
/* 022168 00122068 FFFFE720 */  addi        $7, $7, -0x1 /* handwritten instruction */
/* 02216C 0012206C 1000C620 */  addi        $6, $6, 0x10 /* handwritten instruction */
/* 022170 00122070 F1FF0714 */  bne         $0, $7, _rotTPN_loop
/* 022174 00122074 10008420 */   addi       $4, $4, 0x10 /* handwritten instruction */
/* 022178 00122078 0800E003 */  jr          $31
/* 02217C 0012207C 00000000 */   nop
