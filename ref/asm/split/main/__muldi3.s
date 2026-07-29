.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __muldi3
/* 00EF38 0010EE38 3F300400 */  dsra32      $6, $4, 0
/* 00EF3C 0010EE3C 3F180500 */  dsra32      $3, $5, 0
/* 00EF40 0010EE40 3C200400 */  dsll32      $4, $4, 0
/* 00EF44 0010EE44 3F200400 */  dsra32      $4, $4, 0
/* 00EF48 0010EE48 3C280500 */  dsll32      $5, $5, 0
/* 00EF4C 0010EE4C 3F280500 */  dsra32      $5, $5, 0
/* 00EF50 0010EE50 18188300 */  mult        $3, $4, $3
/* 00EF54 0010EE54 1830C570 */  mult1       $6, $6, $5
/* 00EF58 0010EE58 19008500 */  multu       $4, $5
/* 00EF5C 0010EE5C 12200000 */  mflo        $4
/* 00EF60 0010EE60 10100000 */  mfhi        $2
/* 00EF64 0010EE64 3C200400 */  dsll32      $4, $4, 0
/* 00EF68 0010EE68 3C100200 */  dsll32      $2, $2, 0
/* 00EF6C 0010EE6C 3E200400 */  dsrl32      $4, $4, 0
/* 00EF70 0010EE70 21186600 */  addu        $3, $3, $6
/* 00EF74 0010EE74 25208200 */  or          $4, $4, $2
/* 00EF78 0010EE78 FFFF053C */  lui         $5, (0xFFFF0000 >> 16)
/* 00EF7C 0010EE7C 3E280500 */  dsrl32      $5, $5, 0
/* 00EF80 0010EE80 3F100400 */  dsra32      $2, $4, 0
/* 00EF84 0010EE84 21104300 */  addu        $2, $2, $3
/* 00EF88 0010EE88 24208500 */  and         $4, $4, $5
/* 00EF8C 0010EE8C 3C100200 */  dsll32      $2, $2, 0
/* 00EF90 0010EE90 0800E003 */  jr          $31
/* 00EF94 0010EE94 25108200 */   or         $2, $4, $2
