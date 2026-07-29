.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceVu0ClampVector
/* 021C90 00121B90 00600844 */  mfc1        $8, $f12
/* 021C94 00121B94 00680944 */  mfc1        $9, $f13
/* 021C98 00121B98 0000A6D8 */  lqc2        $vf6, 0x0($5)
/* 021C9C 00121B9C 0020A848 */  qmtc2.ni    $8, $vf4
/* 021CA0 00121BA0 0028A948 */  qmtc2.ni    $9, $vf5
/* 021CA4 00121BA4 9031E44B */  vmaxx.xyzw  $vf6, $vf6, $vf4x
/* 021CA8 00121BA8 9431E54B */  vminix.xyzw $vf6, $vf6, $vf5x
/* 021CAC 00121BAC 0800E003 */  jr          $31
/* 021CB0 00121BB0 000086F8 */   sqc2       $vf6, 0x0($4)
/* 021CB4 00121BB4 00000000 */  nop
