.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceVu0SubVector
/* 0218B8 001217B8 0000A4D8 */  lqc2        $vf4, 0x0($5)
/* 0218BC 001217BC 0000C5D8 */  lqc2        $vf5, 0x0($6)
/* 0218C0 001217C0 AC21E54B */  vsub.xyzw   $vf6, $vf4, $vf5
/* 0218C4 001217C4 0800E003 */  jr          $31
/* 0218C8 001217C8 000086F8 */   sqc2       $vf6, 0x0($4)
/* 0218CC 001217CC 00000000 */  nop
