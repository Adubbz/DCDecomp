.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceVu0ClipScreen
/* 22230 00122130 2C01E04B */  vsub.xyzw  $vf4, $vf0, $vf0
/* 22234 00122134 8045023C */  lui        $2, (0x45800000 >> 16)
/* 22238 00122138 38140200 */  dsll       $2, $2, 16
/* 2223C 0012213C 80454234 */  ori        $2, $2, 0x4580
/* 22240 00122140 38140200 */  dsll       $2, $2, 16
/* 22244 00122144 000087D8 */  lqc2       $vf7, 0x0($4)
/* 22248 00122148 0030A248 */  qmtc2      $2, $vf6
/* 2224C 0012214C 0080C048 */  ctc2       $0, $vi16
/* 22250 00122150 6C39A44B */  vsub.xyw   $vf5, $vf7, $vf4
/* 22254 00122154 6C31874B */  vsub.xy    $vf5, $vf6, $vf7
/* 22258 00122158 FF02004A */  vnop
/* 2225C 0012215C FF02004A */  vnop
/* 22260 00122160 FF02004A */  vnop
/* 22264 00122164 FF02004A */  vnop
/* 22268 00122168 FF02004A */  vnop
/* 2226C 0012216C 00804248 */  cfc2       $2, $vi16
/* 22270 00122170 0800E003 */  jr         $31
/* 22274 00122174 C0004230 */   andi      $2, $2, 0xC0
