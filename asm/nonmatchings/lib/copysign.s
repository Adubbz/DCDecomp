.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel copysign
/* 4888 00104788 2D108000 */  daddu      $2, $4, $0
/* 488C 0010478C 3F100200 */  dsra32     $2, $2, 0
/* 4890 00104790 3F280500 */  dsra32     $5, $5, 0
/* 4894 00104794 2D308000 */  daddu      $6, $4, $0
/* 4898 00104798 FF7F033C */  lui        $3, (0x7FFFFFFF >> 16)
/* 489C 0010479C 0080043C */  lui        $4, (0x80000000 >> 16)
/* 48A0 001047A0 FFFF6334 */  ori        $3, $3, (0x7FFFFFFF & 0xFFFF)
/* 48A4 001047A4 2428A400 */  and        $5, $5, $4
/* 48A8 001047A8 24104300 */  and        $2, $2, $3
/* 48AC 001047AC FFFF043C */  lui        $4, (0xFFFF0000 >> 16)
/* 48B0 001047B0 3E200400 */  dsrl32     $4, $4, 0
/* 48B4 001047B4 25104500 */  or         $2, $2, $5
/* 48B8 001047B8 2430C400 */  and        $6, $6, $4
/* 48BC 001047BC 3C100200 */  dsll32     $2, $2, 0
/* 48C0 001047C0 2520C200 */  or         $4, $6, $2
/* 48C4 001047C4 0800E003 */  jr         $31
/* 48C8 001047C8 2D108000 */   daddu     $2, $4, $0
/* 48CC 001047CC 00000000 */  nop
