.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MulMatrix__FPA4_fPA4_fPA4_f
/* 236D0 001235D0 0000A1D8 */  lqc2       $vf1, 0x0($5)
/* 236D4 001235D4 1000A2D8 */  lqc2       $vf2, 0x10($5)
/* 236D8 001235D8 2000A3D8 */  lqc2       $vf3, 0x20($5)
/* 236DC 001235DC 3000A4D8 */  lqc2       $vf4, 0x30($5)
/* 236E0 001235E0 0000C5D8 */  lqc2       $vf5, 0x0($6)
/* 236E4 001235E4 1000C6D8 */  lqc2       $vf6, 0x10($6)
/* 236E8 001235E8 2000C7D8 */  lqc2       $vf7, 0x20($6)
/* 236EC 001235EC 3000C8D8 */  lqc2       $vf8, 0x30($6)
/* 236F0 001235F0 BC09E54B */  vmulax.xyzw ACC, $vf1, $vf5x
/* 236F4 001235F4 BD10E54B */  vmadday.xyzw ACC, $vf2, $vf5y
/* 236F8 001235F8 BE18E54B */  vmaddaz.xyzw ACC, $vf3, $vf5z
/* 236FC 001235FC 0B25E54B */  vmaddw.xyzw $vf20, $vf4, $vf5w
/* 23700 00123600 BC09E64B */  vmulax.xyzw ACC, $vf1, $vf6x
/* 23704 00123604 BD10E64B */  vmadday.xyzw ACC, $vf2, $vf6y
/* 23708 00123608 BE18E64B */  vmaddaz.xyzw ACC, $vf3, $vf6z
/* 2370C 0012360C 4B25E64B */  vmaddw.xyzw $vf21, $vf4, $vf6w
/* 23710 00123610 BC09E74B */  vmulax.xyzw ACC, $vf1, $vf7x
/* 23714 00123614 BD10E74B */  vmadday.xyzw ACC, $vf2, $vf7y
/* 23718 00123618 BE18E74B */  vmaddaz.xyzw ACC, $vf3, $vf7z
/* 2371C 0012361C 8B25E74B */  vmaddw.xyzw $vf22, $vf4, $vf7w
/* 23720 00123620 BC09E84B */  vmulax.xyzw ACC, $vf1, $vf8x
/* 23724 00123624 BD10E84B */  vmadday.xyzw ACC, $vf2, $vf8y
/* 23728 00123628 BE18E84B */  vmaddaz.xyzw ACC, $vf3, $vf8z
/* 2372C 0012362C CB25E84B */  vmaddw.xyzw $vf23, $vf4, $vf8w
/* 23730 00123630 000094F8 */  sqc2       $vf20, 0x0($4)
/* 23734 00123634 100095F8 */  sqc2       $vf21, 0x10($4)
/* 23738 00123638 200096F8 */  sqc2       $vf22, 0x20($4)
/* 2373C 0012363C 300097F8 */  sqc2       $vf23, 0x30($4)
/* 23740 00123640 0800E003 */  jr         $31
/* 23744 00123644 00000000 */   nop
/* 23748 00123648 00000000 */  nop
/* 2374C 0012364C 00000000 */  nop
