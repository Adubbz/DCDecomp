.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceVu0ClipScreen
/* 022230 00122130 2C01E04B */  vsub.xyzw   $vf4, $vf0, $vf0
/* 022234 00122134 8045023C */  lui         $2, (0x45800000 >> 16)
/* 022238 00122138 38140200 */  dsll        $2, $2, 16
/* 02223C 0012213C 80454234 */  ori         $2, $2, 0x4580
/* 022240 00122140 38140200 */  dsll        $2, $2, 16
/* 022244 00122144 000087D8 */  lqc2        $vf7, 0x0($4)
/* 022248 00122148 0030A248 */  qmtc2.ni    $2, $vf6
/* 02224C 0012214C 0080C048 */  ctc2.ni     $0, $vi16
/* 022250 00122150 6C39A44B */  vsub.xyw    $vf5, $vf7, $vf4
/* 022254 00122154 6C31874B */  vsub.xy     $vf5, $vf6, $vf7
/* 022258 00122158 FF02004A */  vnop
/* 02225C 0012215C FF02004A */  vnop
/* 022260 00122160 FF02004A */  vnop
/* 022264 00122164 FF02004A */  vnop
/* 022268 00122168 FF02004A */  vnop
/* 02226C 0012216C 00804248 */  cfc2.ni     $2, $vi16
/* 022270 00122170 0800E003 */  jr          $31
/* 022274 00122174 C0004230 */   andi       $2, $2, 0xC0
