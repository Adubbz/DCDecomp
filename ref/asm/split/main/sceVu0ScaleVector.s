.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceVu0ScaleVector
/* 0218E8 001217E8 0000A4D8 */  lqc2        $vf4, 0x0($5)
/* 0218EC 001217EC 00600844 */  mfc1        $8, $f12
/* 0218F0 001217F0 0028A848 */  qmtc2.ni    $8, $vf5
/* 0218F4 001217F4 9821E54B */  vmulx.xyzw  $vf6, $vf4, $vf5x
/* 0218F8 001217F8 0800E003 */  jr          $31
/* 0218FC 001217FC 000086F8 */   sqc2       $vf6, 0x0($4)
