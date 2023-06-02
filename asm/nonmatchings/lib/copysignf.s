.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel copysignf
/* 4B68 00104A68 00600544 */  mfc1       $5, $f12
/* 4B6C 00104A6C 00680444 */  mfc1       $4, $f13
/* 4B70 00104A70 2D188000 */  daddu      $3, $4, $0
/* 4B74 00104A74 FF7F023C */  lui        $2, (0x7FFFFFFF >> 16)
/* 4B78 00104A78 FFFF4234 */  ori        $2, $2, (0x7FFFFFFF & 0xFFFF)
/* 4B7C 00104A7C 0080043C */  lui        $4, (0x80000000 >> 16)
/* 4B80 00104A80 2428A200 */  and        $5, $5, $2
/* 4B84 00104A84 24186400 */  and        $3, $3, $4
/* 4B88 00104A88 2528A300 */  or         $5, $5, $3
/* 4B8C 00104A8C 00008544 */  mtc1       $5, $f0
/* 4B90 00104A90 0800E003 */  jr         $31
/* 4B94 00104A94 00000000 */   nop
