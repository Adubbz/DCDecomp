.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel MulMatrix__FPA4_fPA4_fPA4_f
/* 0236D0 001235D0 0000A1D8 */  lqc2        $vf1, 0x0($5)
/* 0236D4 001235D4 1000A2D8 */  lqc2        $vf2, 0x10($5)
/* 0236D8 001235D8 2000A3D8 */  lqc2        $vf3, 0x20($5)
/* 0236DC 001235DC 3000A4D8 */  lqc2        $vf4, 0x30($5)
/* 0236E0 001235E0 0000C5D8 */  lqc2        $vf5, 0x0($6)
/* 0236E4 001235E4 1000C6D8 */  lqc2        $vf6, 0x10($6)
/* 0236E8 001235E8 2000C7D8 */  lqc2        $vf7, 0x20($6)
/* 0236EC 001235EC 3000C8D8 */  lqc2        $vf8, 0x30($6)
/* 0236F0 001235F0 BC09E54B */  vmulax.xyzw $ACC, $vf1, $vf5x
/* 0236F4 001235F4 BD10E54B */  vmadday.xyzw $ACC, $vf2, $vf5y
/* 0236F8 001235F8 BE18E54B */  vmaddaz.xyzw $ACC, $vf3, $vf5z
/* 0236FC 001235FC 0B25E54B */  vmaddw.xyzw $vf20, $vf4, $vf5w
/* 023700 00123600 BC09E64B */  vmulax.xyzw $ACC, $vf1, $vf6x
/* 023704 00123604 BD10E64B */  vmadday.xyzw $ACC, $vf2, $vf6y
/* 023708 00123608 BE18E64B */  vmaddaz.xyzw $ACC, $vf3, $vf6z
/* 02370C 0012360C 4B25E64B */  vmaddw.xyzw $vf21, $vf4, $vf6w
/* 023710 00123610 BC09E74B */  vmulax.xyzw $ACC, $vf1, $vf7x
/* 023714 00123614 BD10E74B */  vmadday.xyzw $ACC, $vf2, $vf7y
/* 023718 00123618 BE18E74B */  vmaddaz.xyzw $ACC, $vf3, $vf7z
/* 02371C 0012361C 8B25E74B */  vmaddw.xyzw $vf22, $vf4, $vf7w
/* 023720 00123620 BC09E84B */  vmulax.xyzw $ACC, $vf1, $vf8x
/* 023724 00123624 BD10E84B */  vmadday.xyzw $ACC, $vf2, $vf8y
/* 023728 00123628 BE18E84B */  vmaddaz.xyzw $ACC, $vf3, $vf8z
/* 02372C 0012362C CB25E84B */  vmaddw.xyzw $vf23, $vf4, $vf8w
/* 023730 00123630 000094F8 */  sqc2        $vf20, 0x0($4)
/* 023734 00123634 100095F8 */  sqc2        $vf21, 0x10($4)
/* 023738 00123638 200096F8 */  sqc2        $vf22, 0x20($4)
/* 02373C 0012363C 300097F8 */  sqc2        $vf23, 0x30($4)
/* 023740 00123640 0800E003 */  jr          $31
/* 023744 00123644 00000000 */   nop
/* 023748 00123648 00000000 */  nop
/* 02374C 0012364C 00000000 */  nop
