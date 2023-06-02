.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel sceVu0RotTransPersN
/* 22128 00122028 0000A4D8 */  lqc2       $vf4, 0x0($5)
/* 2212C 0012202C 1000A5D8 */  lqc2       $vf5, 0x10($5)
/* 22130 00122030 2000A6D8 */  lqc2       $vf6, 0x20($5)
/* 22134 00122034 3000A7D8 */  lqc2       $vf7, 0x30($5)
.L00122038:
/* 22138 00122038 0000C8D8 */  lqc2       $vf8, 0x0($6)
/* 2213C 0012203C BC21E84B */  vmulax.xyzw ACC, $vf4, $vf8x
/* 22140 00122040 BD28E84B */  vmadday.xyzw ACC, $vf5, $vf8y
/* 22144 00122044 BE30E84B */  vmaddaz.xyzw ACC, $vf6, $vf8z
/* 22148 00122048 4B3AE84B */  vmaddw.xyzw $vf9, $vf7, $vf8w
/* 2214C 0012204C BC03E94B */  vdiv       Q, $vf0w, $vf9w
/* 22150 00122050 BF03004A */  vwaitq
/* 22154 00122054 5C4AC04B */  vmulq.xyz  $vf9, $vf9, Q
/* 22158 00122058 02000011 */  beqz       $8, .L00122064
/* 2215C 0012205C 7D49EA4B */   vftoi4.xyzw $vf10, $vf9
/* 22160 00122060 7C496A4A */  vftoi0.zw  $vf10, $vf9
.L00122064:
/* 22164 00122064 00008AF8 */  sqc2       $vf10, 0x0($4)
/* 22168 00122068 FFFFE720 */  addi       $7, $7, -0x1 # handwritten instruction
/* 2216C 0012206C 1000C620 */  addi       $6, $6, 0x10 # handwritten instruction
/* 22170 00122070 F1FF0714 */  bne        $0, $7, .L00122038
/* 22174 00122074 10008420 */   addi      $4, $4, 0x10 # handwritten instruction
/* 22178 00122078 0800E003 */  jr         $31
/* 2217C 0012207C 00000000 */   nop
