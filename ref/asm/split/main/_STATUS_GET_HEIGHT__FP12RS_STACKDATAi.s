.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _STATUS_GET_HEIGHT__FP12RS_STACKDATAi
/* 0E31F0 001E30F0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0E31F4 001E30F4 0000BF7F */  sq          $31, 0x0($29)
/* 0E31F8 001E30F8 E09C858F */  lw          $5, -0x6320($28)
/* 0E31FC 001E30FC 9000A38C */  lw          $3, 0x90($5)
/* 0E3200 001E3100 80100300 */  sll         $2, $3, 2
/* 0E3204 001E3104 21184300 */  addu        $3, $2, $3
/* 0E3208 001E3108 80100300 */  sll         $2, $3, 2
/* 0E320C 001E310C 21106200 */  addu        $2, $3, $2
/* 0E3210 001E3110 00110200 */  sll         $2, $2, 4
/* 0E3214 001E3114 21104500 */  addu        $2, $2, $5
/* 0E3218 001E3118 0200013C */  lui         $1, (0x20000 >> 16)
/* 0E321C 001E311C 21084100 */  addu        $1, $2, $1
/* 0E3220 001E3120 88E42CC4 */  lwc1        $f12, -0x1B78($1)
/* 0E3224 001E3124 BC85070C */  jal         SetStack__FP12RS_STACKDATAf__3
/* 0E3228 001E3128 00000000 */   nop
/* 0E322C 001E312C 01000224 */  addiu       $2, $0, 0x1
/* 0E3230 001E3130 0000BF7B */  lq          $31, 0x0($29)
/* 0E3234 001E3134 1000BD27 */  addiu       $29, $29, 0x10
/* 0E3238 001E3138 0800E003 */  jr          $31
/* 0E323C 001E313C 00000000 */   nop
