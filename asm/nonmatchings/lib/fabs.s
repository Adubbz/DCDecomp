.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel fabs
/* 1D1D8 0011D0D8 2D108000 */  daddu      $2, $4, $0
/* 1D1DC 0011D0DC 3F100200 */  dsra32     $2, $2, 0
/* 1D1E0 0011D0E0 2D288000 */  daddu      $5, $4, $0
/* 1D1E4 0011D0E4 FF7F033C */  lui        $3, (0x7FFFFFFF >> 16)
/* 1D1E8 0011D0E8 FFFF043C */  lui        $4, (0xFFFF0000 >> 16)
/* 1D1EC 0011D0EC 3E200400 */  dsrl32     $4, $4, 0
/* 1D1F0 0011D0F0 FFFF6334 */  ori        $3, $3, (0x7FFFFFFF & 0xFFFF)
/* 1D1F4 0011D0F4 2428A400 */  and        $5, $5, $4
/* 1D1F8 0011D0F8 24104300 */  and        $2, $2, $3
/* 1D1FC 0011D0FC 3C100200 */  dsll32     $2, $2, 0
/* 1D200 0011D100 2520A200 */  or         $4, $5, $2
/* 1D204 0011D104 0800E003 */  jr         $31
/* 1D208 0011D108 2D108000 */   daddu     $2, $4, $0
/* 1D20C 0011D10C 00000000 */  nop
