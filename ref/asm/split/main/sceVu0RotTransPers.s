.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceVu0RotTransPers
/* 022180 00122080 0000A4D8 */  lqc2        $vf4, 0x0($5)
/* 022184 00122084 1000A5D8 */  lqc2        $vf5, 0x10($5)
/* 022188 00122088 2000A6D8 */  lqc2        $vf6, 0x20($5)
/* 02218C 0012208C 3000A7D8 */  lqc2        $vf7, 0x30($5)
/* 022190 00122090 0000C8D8 */  lqc2        $vf8, 0x0($6)
/* 022194 00122094 BC21E84B */  vmulax.xyzw $ACC, $vf4, $vf8x
/* 022198 00122098 BD28E84B */  vmadday.xyzw $ACC, $vf5, $vf8y
/* 02219C 0012209C BE30E84B */  vmaddaz.xyzw $ACC, $vf6, $vf8z
/* 0221A0 001220A0 4B3AE84B */  vmaddw.xyzw $vf9, $vf7, $vf8w
/* 0221A4 001220A4 BC03E94B */  vdiv        $Q, $vf0w, $vf9w
/* 0221A8 001220A8 BF03004A */  vwaitq
/* 0221AC 001220AC 5C4AC04B */  vmulq.xyz   $vf9, $vf9, $Q
/* 0221B0 001220B0 0200E010 */  beqz        $7, _rotTP
/* 0221B4 001220B4 7D49EA4B */   vftoi4.xyzw $vf10, $vf9
/* 0221B8 001220B8 7C496A4A */  vftoi0.zw   $vf10, $vf9
_rotTP:
/* 0221BC 001220BC 0800E003 */  jr          $31
/* 0221C0 001220C0 00008AF8 */   sqc2       $vf10, 0x0($4)
/* 0221C4 001220C4 00000000 */  nop
