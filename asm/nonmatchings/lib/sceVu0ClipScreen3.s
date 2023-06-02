.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceVu0ClipScreen3
/* 22278 00122178 2C01E04B */  vsub.xyzw  $vf4, $vf0, $vf0
/* 2227C 0012217C 8045023C */  lui        $2, (0x45800000 >> 16)
/* 22280 00122180 38140200 */  dsll       $2, $2, 16
/* 22284 00122184 80454234 */  ori        $2, $2, 0x4580
/* 22288 00122188 38140200 */  dsll       $2, $2, 16
/* 2228C 0012218C 000086D8 */  lqc2       $vf6, 0x0($4)
/* 22290 00122190 0000A8D8 */  lqc2       $vf8, 0x0($5)
/* 22294 00122194 0000C9D8 */  lqc2       $vf9, 0x0($6)
/* 22298 00122198 0038A248 */  qmtc2      $2, $vf7
/* 2229C 0012219C 0080C048 */  ctc2       $0, $vi16
/* 222A0 001221A0 6C31A44B */  vsub.xyw   $vf5, $vf6, $vf4
/* 222A4 001221A4 6C39864B */  vsub.xy    $vf5, $vf7, $vf6
/* 222A8 001221A8 6C41A44B */  vsub.xyw   $vf5, $vf8, $vf4
/* 222AC 001221AC 6C39884B */  vsub.xy    $vf5, $vf7, $vf8
/* 222B0 001221B0 6C49A44B */  vsub.xyw   $vf5, $vf9, $vf4
/* 222B4 001221B4 6C39894B */  vsub.xy    $vf5, $vf7, $vf9
/* 222B8 001221B8 FF02004A */  vnop
/* 222BC 001221BC FF02004A */  vnop
/* 222C0 001221C0 FF02004A */  vnop
/* 222C4 001221C4 FF02004A */  vnop
/* 222C8 001221C8 FF02004A */  vnop
/* 222CC 001221CC 00804248 */  cfc2       $2, $vi16
/* 222D0 001221D0 0800E003 */  jr         $31
/* 222D4 001221D4 C0004230 */   andi      $2, $2, 0xC0
