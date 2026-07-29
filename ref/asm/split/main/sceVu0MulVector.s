.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceVu0MulVector
/* 0218D0 001217D0 0000A4D8 */  lqc2        $vf4, 0x0($5)
/* 0218D4 001217D4 0000C5D8 */  lqc2        $vf5, 0x0($6)
/* 0218D8 001217D8 AA21E54B */  vmul.xyzw   $vf6, $vf4, $vf5
/* 0218DC 001217DC 0800E003 */  jr          $31
/* 0218E0 001217E0 000086F8 */   sqc2       $vf6, 0x0($4)
/* 0218E4 001217E4 00000000 */  nop
