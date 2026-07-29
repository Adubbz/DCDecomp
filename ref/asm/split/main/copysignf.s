.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel copysignf
/* 004B68 00104A68 00600544 */  mfc1        $5, $f12
/* 004B6C 00104A6C 00680444 */  mfc1        $4, $f13
/* 004B70 00104A70 2D188000 */  daddu       $3, $4, $0
/* 004B74 00104A74 FF7F023C */  lui         $2, (0x7FFFFFFF >> 16)
/* 004B78 00104A78 FFFF4234 */  ori         $2, $2, (0x7FFFFFFF & 0xFFFF)
/* 004B7C 00104A7C 0080043C */  lui         $4, (0x80000000 >> 16)
/* 004B80 00104A80 2428A200 */  and         $5, $5, $2
/* 004B84 00104A84 24186400 */  and         $3, $3, $4
/* 004B88 00104A88 2528A300 */  or          $5, $5, $3
/* 004B8C 00104A8C 00008544 */  mtc1        $5, $f0
/* 004B90 00104A90 0800E003 */  jr          $31
/* 004B94 00104A94 00000000 */   nop
