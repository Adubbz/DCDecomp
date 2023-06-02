.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __muldi3
/* EF38 0010EE38 3F300400 */  dsra32     $6, $4, 0
/* EF3C 0010EE3C 3F180500 */  dsra32     $3, $5, 0
/* EF40 0010EE40 3C200400 */  dsll32     $4, $4, 0
/* EF44 0010EE44 3F200400 */  dsra32     $4, $4, 0
/* EF48 0010EE48 3C280500 */  dsll32     $5, $5, 0
/* EF4C 0010EE4C 3F280500 */  dsra32     $5, $5, 0
/* EF50 0010EE50 18188300 */  mult       $3, $4, $3
/* EF54 0010EE54 1830C570 */  mult1      $6, $6, $5
/* EF58 0010EE58 19008500 */  multu      $4, $5
/* EF5C 0010EE5C 12200000 */  mflo       $4
/* EF60 0010EE60 10100000 */  mfhi       $2
/* EF64 0010EE64 3C200400 */  dsll32     $4, $4, 0
/* EF68 0010EE68 3C100200 */  dsll32     $2, $2, 0
/* EF6C 0010EE6C 3E200400 */  dsrl32     $4, $4, 0
/* EF70 0010EE70 21186600 */  addu       $3, $3, $6
/* EF74 0010EE74 25208200 */  or         $4, $4, $2
/* EF78 0010EE78 FFFF053C */  lui        $5, (0xFFFF0000 >> 16)
/* EF7C 0010EE7C 3E280500 */  dsrl32     $5, $5, 0
/* EF80 0010EE80 3F100400 */  dsra32     $2, $4, 0
/* EF84 0010EE84 21104300 */  addu       $2, $2, $3
/* EF88 0010EE88 24208500 */  and        $4, $4, $5
/* EF8C 0010EE8C 3C100200 */  dsll32     $2, $2, 0
/* EF90 0010EE90 0800E003 */  jr         $31
/* EF94 0010EE94 25108200 */   or        $2, $4, $2
