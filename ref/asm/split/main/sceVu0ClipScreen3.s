.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceVu0ClipScreen3
/* 022278 00122178 2C01E04B */  vsub.xyzw   $vf4, $vf0, $vf0
/* 02227C 0012217C 8045023C */  lui         $2, (0x45800000 >> 16)
/* 022280 00122180 38140200 */  dsll        $2, $2, 16
/* 022284 00122184 80454234 */  ori         $2, $2, 0x4580
/* 022288 00122188 38140200 */  dsll        $2, $2, 16
/* 02228C 0012218C 000086D8 */  lqc2        $vf6, 0x0($4)
/* 022290 00122190 0000A8D8 */  lqc2        $vf8, 0x0($5)
/* 022294 00122194 0000C9D8 */  lqc2        $vf9, 0x0($6)
/* 022298 00122198 0038A248 */  qmtc2.ni    $2, $vf7
/* 02229C 0012219C 0080C048 */  ctc2.ni     $0, $vi16
/* 0222A0 001221A0 6C31A44B */  vsub.xyw    $vf5, $vf6, $vf4
/* 0222A4 001221A4 6C39864B */  vsub.xy     $vf5, $vf7, $vf6
/* 0222A8 001221A8 6C41A44B */  vsub.xyw    $vf5, $vf8, $vf4
/* 0222AC 001221AC 6C39884B */  vsub.xy     $vf5, $vf7, $vf8
/* 0222B0 001221B0 6C49A44B */  vsub.xyw    $vf5, $vf9, $vf4
/* 0222B4 001221B4 6C39894B */  vsub.xy     $vf5, $vf7, $vf9
/* 0222B8 001221B8 FF02004A */  vnop
/* 0222BC 001221BC FF02004A */  vnop
/* 0222C0 001221C0 FF02004A */  vnop
/* 0222C4 001221C4 FF02004A */  vnop
/* 0222C8 001221C8 FF02004A */  vnop
/* 0222CC 001221CC 00804248 */  cfc2.ni     $2, $vi16
/* 0222D0 001221D0 0800E003 */  jr          $31
/* 0222D4 001221D4 C0004230 */   andi       $2, $2, 0xC0
